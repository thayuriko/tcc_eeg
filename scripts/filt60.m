function sinal_filtrado = filt60(sinal)

wo = 60/(160/2);  %Filter 60Hz from a 160Hz sampled signal
bw = wo/35;       %Q = 35 quality factor
[nb,na] = iirnotch(wo,bw);
fvtool(nb,na);

sinal_filtrado = filtfilt(nb,na, sinal); 