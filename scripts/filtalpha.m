function sinal_filtrado = filtalpha(sinal)

a1 = designfilt('highpassiir', 'StopbandFrequency', 7.8, ...
               'PassbandFrequency', 8, 'StopbandAttenuation', 60, ...
               'PassbandRipple', 0.5, 'SampleRate', 160, ...
               'DesignMethod', 'cheby2');
a2 = designfilt('lowpassiir', 'PassbandFrequency', 13, ...
               'StopbandFrequency', 13.2, 'StopbandAttenuation', 60, ...
               'PassbandRipple', 0.5, 'SampleRate', 160, ...
               'DesignMethod', 'cheby2');
% freqz(a1)
% freqz(a2)

sinal_filtrado = filtfilt(a1, sinal(1,:));  
sinal_filtrado = filtfilt(a2, sinal_filtrado(1,:));