function sinal_filtrado = filtdelta(sinal)

d1 = designfilt('highpassiir', 'StopbandFrequency', 0.3, ...
               'PassbandFrequency', 0.5, 'StopbandAttenuation', 60, ...
               'PassbandRipple', 0.5, 'SampleRate', 160, ...
               'DesignMethod', 'cheby2');
d2 = designfilt('lowpassiir', 'PassbandFrequency', 4, ...
               'StopbandFrequency', 4.2, 'StopbandAttenuation', 60, ...
               'PassbandRipple', 0.5, 'SampleRate', 160, ...
               'DesignMethod', 'cheby2');
% freqz(d1)
% freqz(d2) 

sinal_filtrado = filtfilt(d1, sinal(1,:));  
sinal_filtrado = filtfilt(d2, sinal_filtrado(1,:));