function [ psd ] = get_psd( profile, is_windowing, int_factor, ns_profile )
%GET_PSD Summary of this function goes here
%   Detailed explanation goes here

if(is_windowing)
    psd = abs(profile/(int_factor)).^2;
    window_norm = sum(blackman(ns_profile))^2;
    psd = psd/window_norm;   
else
    psd = abs(profile/(int_factor*ns_profile)).^2;
end;
        
% single sided spectrum scaling
psd(2:end-1) = 2*psd(2:end-1);

% convert V^2 to Watts
psd = psd/50;

% convert Watts to dBm
psd = 10*log10(psd) + 30; 

end

