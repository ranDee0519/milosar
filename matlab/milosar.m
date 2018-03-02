% moving to a vectorised processing approach
% asssumes triangular modulation in chunk recording mode

clear;
close all;
clc;

%% processing settings
proc.is_g2       = 0;                   % enable G2 SAR processor
proc.is_taper    = 1;                   % enable tapering
proc.demod       = 0;                   % 0 = reference channel, 1 = synthetic LO
proc.is_mti      = 0;                   % enable moving target indication
proc.is_doppler  = 0;                   % non zero value enables doppler processing ans sets number of range lines
proc.is_sub      = 0;                   % non zero value enables coherent subtraction and sets index of profile to use as a reference
proc.is_correct  = 0;                   % non zero value enables phase correction and sets index of profile to use as a reference
proc.is_norm     = 0;                   % non zero value enables normalisation of each pulse
proc.is_psd_avg  = 0;                   % value greater than one enables averaging of psds to reduce variance 
proc.is_rem_dc   = 1;                   % enable DC offset removal
proc.is_flip     = 1;                   % flip spectrum to account for nyquist folding
proc.n_pre_chnks = 1;                   % number of chunks to skip before processing
proc.n_pre_smpls = 10;                  % number of samples to chop from beginning of each ramp

%% system parameters

% misc
VF          = 1;                        % velocity factor of propogation medium
C           = VF*299792458;             % speed of light [m/s]
Z           = 50;                       % 50 ohm system

% red pitaya 
F_clk       = 125e6;                    % red pitaya clock frequency
DF          = 8;                        % sampling decimation factor
F_s         = F_clk/DF;                 % resultant sampling frequency [Hz]

adc.bits    = 14;                       % red pitaya bits per sample
adc.scaling = ((+1)-(-1))/(2^adc.bits); % scaling between adc counts and voltage
adc.max     = +2^(adc.bits - 1) - 1;    % maximum adc count
adc.min     = -2^(adc.bits - 1);        % minimum adc count

% synthesizers 
FN          = 6039798;                  % fractional numerator
N           = 94;                       % N counter
F_pd        = 100e6;                    % phase detector frequency [Hz]

CRF         = 2500;                     % chunk repetition frequency - provided by fpga
CRI         = 1/CRF;                    % chunk repetition interval
ns_chunk    = F_s*CRI;                  % number of samples recorded per PRI

% maximum number of phase detector cycles available per CRI
% to avoid triangle modulation length exceeding the CRI
L_tot       = floor(F_pd/CRF);  
       
I_up        = 3355;                     % fractional numerator increment per pd cycle
L_up        = 30000;                    % phase detector cycles of up ramp 
T_up        = L_up/F_pd;                % time period of up ramp
ns_up       = floor(F_s*T_up);          % samples in up ramp

F_init      = get_vco_freq(0, 4, N, F_pd);                      % ramp starting frequency [Hz]
F_o         = get_vco_freq(FN, 4, N, F_pd) - F_init;            % frequency offset between ramps [Hz]
B           = get_vco_freq(I_up*L_up, 4, N, F_pd) - F_init;     % bandwidth during up ramp [Hz]
F_c         = F_init + B/2;                                     % radar centre frequency [Hz]

K_p         = (T_up/B)*(C/2);           % constant of proportionality (R = K_p * f_b)

%% visualisation settings
visual.n_peek    = 1;                   % number of profiles to view during processing
visual.interp    = 1;                   % interpolation factor
visual.rti_dr    = -100;                % RTI plot dynamic range [dB]
visual.rd_dr     = -40;                 % RD plot dynamic range [dB]
visual.r_min     = 0;                   % min range [m]
visual.r_max     = 250;                 % max range [m]

%% extract binary data
dataset_directory = '/home/darryn/Dropbox/Datasets/Temp/02_03_18_09_30_24/';
raw_data.a = extract_data(strcat(dataset_directory, 'A.bin'), 'int16'); 
raw_data.b = extract_data(strcat(dataset_directory, 'B.bin'), 'int16');
clear dataset_directory;

%% preprocess data
preprocessed_data.a = raw_data.a(proc.n_pre_chnks*ns_chunk + 1 : length(raw_data.a));
preprocessed_data.b = raw_data.b(proc.n_pre_chnks*ns_chunk + 1 : length(raw_data.b));
clear raw_data;

ns_dataset  = length(preprocessed_data.a);
n_chunks    = floor(ns_dataset/ns_chunk);

%% chop off trailing samples
ns_dataset  = ns_chunk*n_chunks;
preprocessed_data.a = preprocessed_data.a(1 : ns_dataset);
preprocessed_data.b = preprocessed_data.b(1 : ns_dataset);

%% plot raw beat signals
plot_beat(preprocessed_data.a, preprocessed_data.b, visual.n_peek*ns_chunk, adc.min, adc.max, ns_up, proc.n_pre_smpls);

%% perform demodulation
if (proc.demod == 0)
    preprocessed_data.demod = preprocessed_data.a .* preprocessed_data.b;
elseif (proc.demod == 1)
    % synthesize reference LO signal
    t_dataset   = linspace(1/F_s, ns_dataset/F_s, ns_dataset); 
    preprocessed_data.synth = sin(2*pi*F_o*t_dataset)';
    clear preprocessed_data.synth;
    
    preprocessed_data.demod = preprocessed_data.a .* preprocessed_data.synth;
end

%% remove dc offset
if (proc.is_rem_dc)
    preprocessed_data.a = preprocessed_data.a - mean(preprocessed_data.a);
    preprocessed_data.b = preprocessed_data.b - mean(preprocessed_data.b);
end; 

%% calculate dataset parameters
ns_fft      = visual.interp*(2^nextpow2(ns_up));                
ns_ssb      = ns_fft/2 + 1;                                  
range_res   = K_p*sqrt((1/(T_up))^2 + (F_s/ns_fft)^2);

%% plot vectors
% slow time for entire dataset [s]
t_slow      = linspace(0, CRI*n_chunks, n_chunks);   
% fast time for ramp [s]
t_fast      = linspace(0, T_up, ns_up);                            
% spectrum of one ramp [Hz]
f_if        = (linspace(0, F_s/2, ns_ssb) + (F_s/2));   
f_bb        = linspace(0, F_s/2, ns_ssb);
% range for one ramp [m]
r_if        = (f_if - F_o)*K_p;
r_bb        = f_bb*K_p;


%% reshape data into a matrix
data_matrix.a = reshape(preprocessed_data.a, [ns_chunk n_chunks]);
data_matrix.b = reshape(preprocessed_data.b, [ns_chunk n_chunks]);
data_matrix.demod = reshape(preprocessed_data.demod, [ns_chunk n_chunks]);
clear preprocessed_data;

%% chop unused data
data_matrix.a = data_matrix.a(1 + proc.n_pre_smpls : ns_up, :);
data_matrix.b = data_matrix.b(1 + proc.n_pre_smpls : ns_up, :);
data_matrix.demod = data_matrix.demod(1 + proc.n_pre_smpls : ns_up, :);

ns_up = ns_up - proc.n_pre_smpls;

%% scale adc counts to volts
data_matrix.a = data_matrix.a*adc.scaling;
data_matrix.b = data_matrix.b*adc.scaling;
data_matrix.demod = data_matrix.demod*adc.scaling;

%% apply range windowing function
if(proc.is_taper)
    window_matrix = repmat(blackman(ns_up), 1, n_chunks);
    
    data_matrix.a = data_matrix.a .* window_matrix;
    data_matrix.b = data_matrix.b .* window_matrix;
    data_matrix.demod = data_matrix.demod .* window_matrix;
    clear window_matrix;
end;

%% fft each column
fft_matrix.a = fft(data_matrix.a, ns_fft);
fft_matrix.b = fft(data_matrix.b, ns_fft);
fft_matrix.demod = fft(data_matrix.demod, ns_fft);
clear data_matrix;

%% remove negative spectum
ssb_matrix.a = fft_matrix.a(1 : ns_ssb, :);
ssb_matrix.b = fft_matrix.b(1 : ns_ssb, :);
ssb_matrix.demod = fft_matrix.demod(1 : ns_ssb, :);
clear fft_matrix;

%% reverse Nyquist folding flip
if (proc.is_flip)
    ssb_matrix.a = flipud(ssb_matrix.a);
    ssb_matrix.b = flipud(ssb_matrix.b);
end;

%% RTI and RD plots
figure;
subplot(3, 2, 1);
imagesc(t_slow, r_if, 20*log10(abs(ssb_matrix.a)));
title('Channel A: Range-Time-Intensity');
ylabel('Range [m]');
xlabel('Slow Time [s]');  
ylim([visual.r_min visual.r_max]);

subplot(3, 2, 2);
imagesc(t_slow, r_if, angle(ssb_matrix.a));
title('Channel A: Range-Time-Phase');
ylabel('Range [m]');
xlabel('Slow Time [s]');  
ylim([visual.r_min visual.r_max]);

subplot(3, 2, 3);
imagesc(t_slow, r_if, 20*log10(abs(ssb_matrix.b)));
title('Channel B: Range-Time-Intensity');
ylabel('Range [m]');
xlabel('Slow Time [s]');  
ylim([visual.r_min visual.r_max]);

subplot(3, 2, 4);
imagesc(t_slow, r_if, angle(ssb_matrix.b));
title('Channel B: Range-Time-Phase');
ylabel('Range [m]');
xlabel('Slow Time [s]');  
ylim([visual.r_min visual.r_max]);

subplot(3, 2, 5);
imagesc(t_slow, r_bb, 20*log10(abs(ssb_matrix.demod)));
title('Demodulated: Range-Time-Intensity');
ylabel('Range [m]');
xlabel('Slow Time [s]');  
ylim([visual.r_min visual.r_max]);

subplot(3, 2, 6);
imagesc(t_slow, r_bb, angle(ssb_matrix.demod));
title('Demodulated: Range-Time-Phase');
ylabel('Range [m]');
xlabel('Slow Time [s]');  
ylim([visual.r_min visual.r_max]);

%% perform coherent integration
int_profile = sum(ssb_matrix.demod, 2); 

figure(10);
plot(r_bb, 10*log10(abs(int_profile)));
title('Integrated Range Profile');
xlabel('Range [m]');
ylabel('Magnitude [dB]');  
xlim([visual.r_min visual.r_max]);

% for i = 1 : n_chunks
%     plot(r_bb, 10*log10(abs(ssb_matrix.demod(:, i))));
%     pause();
% end;

%% generate g2 processor input
if (proc.is_g2)

    g2.in  = 'g2_az.bin';
    g2.cmd = 'g2_az.cmd';
    g2.log = 'g2_az.log';
    g2.out = 'g2_az.out';
    
    % open temp binary file    
    f_id = fopen(g2.in, 'w');

    % convert values to complex-single (float32) 
    single_matrix = single(ssb_matrix.demod); 
    clear ssb_matrix.demod;
    
    % separate the real and imag parts
    real_matrix = real(single_matrix);
    imag_matrix = imag(single_matrix);
    clear single_matrix;
    
    interleaved_matix = zeros(ns_ssb*2, n_chunks);
    
    % interleave the rows of the real and imag matrices
    interleaved_index = 1;
    for row = 1 : ns_ssb
        interleaved_matix(interleaved_index, :)     = real_matrix(row, :);
        interleaved_matix(interleaved_index + 1, :) = imag_matrix(row, :);
        interleaved_index = interleaved_index + 2;
    end
    
    clear real_matrix imag_matrix interleaved_index row;
    
    % fwrite writes per column, perform non-conjugate transpose
    fwrite(f_id, transpose(interleaved_matix), 'single');
    fclose(f_id);
    
    clear interleaved_matix;    
   
    %% generate g2 azimuth compression command file

    % open temp binary file    
    f_id = fopen(g2.cmd, 'w');   

    V_avg = 5; % average velocity [m/s]
    
    fprintf(f_id, 'MiloSAR-created azcom command file (SAR Azimuth Compression)\n');
    fprintf(f_id, '$ProgramVersion (jmh)    => 1.1\n');
    fprintf(f_id, '-------------------------------------------------------\n\n');
    fprintf(f_id, '$ScreenUpdateRate             => %i\n', 10);
    fprintf(f_id, '$LogFileName                  => %s\n', g2.log); 
    fprintf(f_id, '$InputStartSampleDelay        => %i\n', 0);
    fprintf(f_id, '$CarrierFreq [Hz]             => %f\n', F_c);
    fprintf(f_id, '$InputPRF [Hz]                => %i\n', CRF);
    fprintf(f_id, '$NomGroundSpeed [m/s]         => %f\n', V_avg);
    fprintf(f_id, '$InputFileAzPts               => %i\n', n_chunks);
    fprintf(f_id, '$StartProcessAzPt             => 0\n');
    fprintf(f_id, '$AzPtsToProcess               => %i\n', n_chunks);
    fprintf(f_id, '$InputFileRngBins             => %i\n', ns_ssb);
    fprintf(f_id, '$StartProcessRngBin           => 0\n');
    fprintf(f_id, '$RngBinsToProcess             => %i\n', ns_ssb);
    fprintf(f_id, '$InputDCOffsetI               => 0.0\n');
    fprintf(f_id, '$InputDCOffsetQ               => 0.0\n');
    fprintf(f_id, '$InvFFTSizeReduc [pow of 2]   => 1\n');
    fprintf(f_id, '$InputFileName                => %s\n', g2.in);
    fprintf(f_id, '$OutputFileName               => %s\n', g2.out);
    fprintf(f_id, '$AppendExistOutFileFlg [Y/N]  => N\n');
    fprintf(f_id, '$RngFocSegments               => 32\n');
    fprintf(f_id, '$RefFuncSign [+-1]            => +1\n');
    fprintf(f_id, '$A2DFreq [Hz]                 => %f\n', F_s);
    fprintf(f_id, '$NomAzRes [m - see note]      => %f\n', range_res);
    fprintf(f_id, '$WinConstTime [0.0-1.0]       => 1.0\n');
    fprintf(f_id, '$NumLooks                     => 1\n');
    fprintf(f_id, '$LookOverlapFrac [0.0-1.0]    => 0\n');
    fprintf(f_id, '$WinConstFreq [0.0-1.0]       => 0.08\n');
    fprintf(f_id, '$RngCurvInterpSize            => 4\n');
    fprintf(f_id, '$RngCurvBatchSize             => 32\n');
    fprintf(f_id, '$PostSumRatio                 => 1\n');
    fprintf(f_id, '$DetectMethod                 => 2\n');
    fprintf(f_id, '$InputDataType                => 3\n');
    fprintf(f_id, '$OutputDataType               => 3\n');
    fprintf(f_id, '$Scale                        => 1.0\n');
    fprintf(f_id, '$ReportMax [1/0]              => 1\n');
    
    fclose(f_id);
    clear f_id;
    
    %% run g2 processor and plot results
    
%     sys_cmd = strcat('./azcom g2_az.cmd');
%     system(sys_cmd);
%         
%     raw_data = extract_data(g2_az_out, 'float32');
%     complex_data = binIQ2complex(raw_data);
%     bin_matrix = reshape(complex_data, [50 100]);
% 
%     imagesc(10*log10(abs(bin_matrix)));
%     title('Range-Compressed Binary File');
    
end;

