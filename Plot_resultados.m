% clear; clc; close all;

% run tratamento_sinal.m

% PLOT BASELINE OPEN POR CLASSE FREQ
figure('Name','SINAL FILTRADO Olhos abertos','NumberTitle','off')
subplot(2,2,1)
plot(1:length(delta_baseOp), delta_baseOp)
title('Frequência Delta 0,5-4Hz')
axis([1 1000 -100 100])

subplot(2,2,2)
plot(1:length(tetha_baseOp), tetha_baseOp)
title('Frequência Tetha 4-8Hz')
axis([1 1000 -100 100])

subplot(2,2,3)
plot(1:length(alpha_baseOp), alpha_baseOp)
title('Frequência Alpha 8-13Hz')
axis([1 1000 -100 100])

subplot(2,2,4)
plot(1:length(beta_baseOp), beta_baseOp)
title('Frequência Beta 13-30Hz')
axis([1 1000 -100 100])

subplot(2,2,1)
plot(1:length(gama_baseOp), gama_baseOp)
title('Frequência Gama 30-40Hz')
axis([1 1000 -100 100])

% PLOT MOVE 2 FISTS POR CLASSE FREQ
figure('Name','SINAL FILTRADO Movendo 2 mãos','NumberTitle','off')
subplot(2,2,1)
plot(1:length(delta_mov2), delta_mov2)
title('Frequência Delta 0,5-4Hz')
axis([1 1000 -100 100])

subplot(2,2,1)
plot(1:length(gama_mov2), gama_mov2)
title('Frequência Gama 30-40Hz')
axis([1 1000 -100 100])

subplot(2,2,2)
plot(1:length(tetha_mov2), tetha_mov2)
title('Frequência Tetha 4-8Hz')
axis([1 1000 -100 100])

subplot(2,2,3)
plot(1:length(alpha_mov2), alpha_mov2)
title('Frequência Alpha 8-13Hz')
axis([1 1000 -100 100])

subplot(2,2,4)
plot(1:length(beta_mov2), beta_mov2)
title('Frequência Beta 13-30Hz')
axis([1 1000 -100 100])


% FFT DOS SINAIS BASELINE OPEN
fftbeta_baseOpen = fftshift(fft(beta_baseOp,160));
ffttetha_baseOpen = fftshift(fft(tetha_baseOp,160));
fftdelta_baseOpen = fftshift(fft(delta_baseOp,160));
fftalpha_baseOpen = fftshift(fft(alpha_baseOp,160));
fftgama_baseOpen = fftshift(fft(gama_baseOp,160));

figure('Name','Olhos abertos','NumberTitle','off')
subplot(2,2,1)
plot(1:length(fftdelta_baseOpen),abs(fftdelta_baseOpen))
title('Frequência Delta 0,5-4Hz')

subplot(2,2,1)
plot(1:length(fftgama_baseOpen),abs(fftgama_baseOpen))
title('Frequência Gama 30-40Hz')

subplot(2,2,2)
plot(1:length(ffttetha_baseOpen),abs(ffttetha_baseOpen))
title('Frequência Tetha 4-8Hz')

subplot(2,2,3)
plot(1:length(fftalpha_baseOpen),abs(fftalpha_baseOpen))
title('Frequência Alpha 8-13Hz')

subplot(2,2,4)
plot(1:length(fftbeta_baseOpen),abs(fftbeta_baseOpen))
title('Frequência Beta 13-30Hz')

%SPECTROGRAM BASELINE OPEN
figure('Name','SPECTROGRAM Olhos abertos','NumberTitle','off')
subplot(2,2,1)
spectrogram(delta_baseOp)
title('Frequência Delta 0,5-4Hz')

subplot(2,2,2)
spectrogram(tetha_baseOp)
title('Frequência Tetha 4-8Hz')

subplot(2,2,3)
spectrogram(alpha_baseOp)
title('Frequência Alpha 8-13Hz')

subplot(2,2,4)
spectrogram(beta_baseOp)
title('Frequência Beta 13-30Hz')

% FFT DOS SINAIS MOVE 2 FISTS
fftbeta_mov2 = fftshift(fft(beta_mov2,160));
ffttetha_mov2 = fftshift(fft(tetha_mov2,160));
fftdelta_mov2 = fftshift(fft(delta_mov2,160));
fftalpha_mov2 = fftshift(fft(alpha_mov2,160));
fftgama_mov2 = fftshift(fft(gama_mov2,160));

figure('Name','Movendo 2 mãos','NumberTitle','off')
subplot(2,2,1)
plot(1:length(fftdelta_mov2),abs(fftdelta_mov2))
title('Frequência Delta 0,5-4Hz')

subplot(2,2,1)
plot(1:length(fftgama_mov2),abs(fftgama_mov2))
title('Frequência Gama 30-40Hz')

subplot(2,2,2)
plot(1:length(ffttetha_mov2),abs(ffttetha_mov2))
title('Frequência Tetha 4-8Hz')

subplot(2,2,3)
plot(1:length(fftalpha_mov2),abs(fftalpha_mov2))
title('Frequência Alpha 8-13Hz')

subplot(2,2,4)
plot(1:length(fftbeta_mov2),abs(fftbeta_mov2))
title('Frequência Beta 13-30Hz')

%SPECTROGRAM MOVE2 FISTS
figure('Name','SPECTROGRAM Movendo 2 mãos','NumberTitle','off')
subplot(2,2,1)
spectrogram(delta_mov2)
title('Frequência Delta 0,5-4Hz')

subplot(2,2,1)
spectrogram(gama_mov2)
title('Frequência Gama 30-40Hz')

subplot(2,2,2)
spectrogram(tetha_mov2)
title('Frequência Tetha 4-8Hz')

subplot(2,2,3)
spectrogram(alpha_mov2)
title('Frequência Alpha 8-13Hz')

subplot(2,2,4)
spectrogram(beta_mov2)
title('Frequência Beta 13-30Hz')

% SPECTROGRAM SINAL INTEIRO 
figure
spectrogram(baseClosed(1,:))
figure
spectrogram(baseOpen)
figure
spectrogram(mov2)

% run Plot_Diff.m