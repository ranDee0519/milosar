function [  ] = plot_beat( ch_1, ch_2, ns_preview, adc_min, adc_max, ns_up, ns_pre )
%PLOT_BEAT Summary of this function goes here
%   Detailed explanation goes here

F_s = 125e6/8;
t_preview = linspace(1/F_s, ns_preview/F_s, ns_preview);   % time vector for preview [s]

figure();
subplot(2, 1, 1);
plot(t_preview, ch_1(1 : ns_preview));
title('Channel 1: Raw Beat Signal');
xlabel('Time [s]');
ylabel('ADC Count');
ylim([adc_min adc_max]*1.1);
line([1/F_s max(t_preview)], [adc_max adc_max], 'Color','red',   'LineStyle','--');
line([1/F_s max(t_preview)], [adc_min adc_min], 'Color','red',   'LineStyle','--');
line([ns_up/F_s ns_up/F_s], [adc_min adc_max]*1.1, 'Color','blue');
line([ns_pre/F_s ns_pre/F_s], [adc_min adc_max]*1.1, 'Color','blue');
xlim([min(t_preview) max(t_preview)]);

subplot(2, 1, 2);
plot(t_preview, ch_2(1 : ns_preview));
title('Channel 2: Raw Beat Signal');
xlabel('Time [s]');
ylabel('ADC Count');
ylim([adc_min adc_max]*1.1);
line([1/F_s max(t_preview)], [adc_max adc_max], 'Color','red',   'LineStyle','--');
line([1/F_s max(t_preview)], [adc_min adc_min], 'Color','red',   'LineStyle','--');
line([ns_up/F_s ns_up/F_s], [adc_min adc_max]*1.1, 'Color','blue');
line([ns_pre/F_s ns_pre/F_s], [adc_min adc_max]*1.1, 'Color','blue');
xlim([min(t_preview) max(t_preview)]);


% print(strcat(file_path, 'beat.pdf'), '-dpdf', '-bestfit');

end

