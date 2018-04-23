function sinal_filtrado = filt0_50(sinal)

wo = 60/(160/2);  %Filter 60Hz from a 160Hz sampled signal
bw = wo/35;       %Q = 35 quality factor
[nb,na] = iirnotch(wo,bw);
%fvtool(nb,na);

g2 = designfilt('lowpassiir', 'PassbandFrequency', 50, ...
               'StopbandFrequency', 50.2, 'StopbandAttenuation', 60, ...
               'PassbandRipple', 0.5, 'SampleRate', 160, ...
               'DesignMethod', 'cheby2');
d1 = designfilt('highpassiir', 'StopbandFrequency', 0.3, ...
               'PassbandFrequency', 0.5, 'StopbandAttenuation', 60, ...
               'PassbandRipple', 0.5, 'SampleRate', 160, ...
               'DesignMethod', 'cheby2');
% freqz(b2)
% freqz(d1)

sinal_filtrado = filtfilt(nb,na, sinal(1,:)); 
sinal_filtrado = filtfilt(g2, sinal_fitlrado(1,:));  
sinal_filtrado = filtfilt(d1, sinal_filtrado(1,:));