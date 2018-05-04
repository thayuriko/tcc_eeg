close all; clear all; clc;
load('workspaces/ind001');

printFigure = 0;
set(0, 'DefaultFigureWindowStyle', 'normal')

max(max(baseOpen_fft));

for i=1:16
    j = 1;
    baseOpen_fft(i,:) = abs(fft(baseOpen(i+21,:),160));
    baseClosed_fft(i,:) = abs(fft(baseClosed(i+21,:),160));

    baseOpen_alpha(i,:) = abs(fftshift(fft(baseOpen_alpha(i,:),160)));
    baseClosed_alpha(i,:) = abs(fftshift(fft(baseClosed_alpha(i,:),160)));
    baseOpen_beta(i,:) = abs(fftshift(fft(baseOpen_beta(i,:),160)));
    baseClosed_beta(i,:) = abs(fftshift(fft(baseClosed_beta(i,:),160)));
    baseOpen_delta(i,:) = abs(fftshift(fft(baseOpen_delta(i,:),160)));
    baseClosed_delta(i,:) = abs(fftshift(fft(baseClosed_delta(i,:),160)));
    baseOpen_theta(i,:) = abs(fftshift(fft(baseOpen_theta(i,:),160)));
    baseClosed_theta(i,:) = abs(fftshift(fft(baseClosed_theta(i,:),160)));
end

fig = figure(1);
subplot(2,1,1);
plot(baseOpen_fft(1:16,80:160));
title(['Ind. ' indNo ': Olhos Abertos - Sinal Completo (0,5-30Hz)']);
ylabel('Magnitude (µV)'); xlabel('Frequência (Hz)');
y_max = max(max(baseOpen_fft(1:16,:)));
axis([1 50 0 y_max]); grid on;

subplot(2,1,2);
plot(baseClosed_fft(1:16,80:160));
title(['Ind. ' indNo ': Olhos Fechados - Sinal Completo (0,5-30Hz)']);
ylabel('Magnitude (µV)'); xlabel('Frequência (Hz)');
y_max = max(max(baseClosed_fft(1:16,:)));
axis([1 50 0 y_max]); grid on;
if printFigure print(fig, ['prints/fft_completo_' indNo],'-dpng'); end


fig = figure(2);
subplot(2,1,1);
plot(baseOpen_alpha(1:16,80:160));
title(['Ind. ' indNo ': Olhos Abertos - Banda Alpha (8-13Hz)']);
ylabel('Magnitude (µV)'); xlabel('Frequência (Hz)');
y_max = max(max(baseOpen_alpha(1:16,:)));
axis([1 50 0 y_max]); grid on;

subplot(2,1,2);
plot(baseClosed_alpha(1:16,80:160));
title(['Ind. ' indNo ': Olhos Fechados - Banda Alpha (8-13Hz)']);
ylabel('Magnitude (µV)'); xlabel('Frequência (Hz)');
y_max = max(max(baseClosed_alpha(1:16,:)));
axis([1 50 0 y_max]); grid on;
if printFigure print(fig,['prints/fft_alpha' indNo],'-dpng'); end


fig = figure(3);
subplot(2,1,1);
plot(baseOpen_beta(1:16,80:160));
title(['Ind. ' indNo ': Olhos Abertos - Banda Beta (13-30Hz)']);
ylabel('Magnitude (µV)'); xlabel('Frequência (Hz)');
y_max = max(max(baseOpen_beta(1:16,:)));
axis([1 50 0 y_max]); grid on;

subplot(2,1,2);
plot(baseClosed_beta(1:16,80:160));
title(['Ind. ' indNo ': Olhos Fechados - Banda Beta (13-30Hz)']);
ylabel('Magnitude (µV)'); xlabel('Frequência (Hz)');
y_max = max(max(baseClosed_beta(1:16,:)));
axis([1 50 0 y_max]); grid on;
if printFigure print(fig,['prints/fft_beta' indNo],'-dpng'); end


fig = figure(4);
subplot(2,1,1);
plot(baseOpen_delta(1:16,80:160));
title(['Ind. ' indNo ': Olhos Abertos - Banda Theta (4-8Hz)']);
ylabel('Magnitude (µV)'); xlabel('Frequência (Hz)');
y_max = max(max(baseOpen_delta(1:16,:)));
axis([1 50 0 y_max]); grid on;

subplot(2,1,2);
plot(baseClosed_delta(1:16,80:160));
title(['Ind. ' indNo ': Olhos Fechados - Banda Theta (4-8Hz)']);
ylabel('Magnitude (µV)'); xlabel('Frequência (Hz)');
y_max = max(max(baseClosed_delta(1:16,:)));
axis([1 50 0 y_max]); grid on;
if printFigure print(fig,['prints/fft_theta' indNo],'-dpng'); end


fig = figure(5);
subplot(2,1,1);
plot(baseOpen_theta(1:16,80:160));
title(['Ind. ' indNo ': Olhos Abertos - Banda Delta (0,5-4Hz)']);
ylabel('Magnitude (µV)'); xlabel('Frequência (Hz)');
y_max = max(max(baseOpen_theta(1:16,:)));
axis([1 50 0 y_max]); grid on;

subplot(2,1,2);
plot(baseClosed_theta(1:16,80:160));
title(['Ind. ' indNo ': Olhos Fechados - Banda Delta (0,5-4Hz)']);
ylabel('Magnitude (µV)'); xlabel('Frequência (Hz)');
y_max = max(max(baseClosed_theta(1:16,:)));
axis([1 50 0 y_max]); grid on;
if printFigure print(fig,['prints/fft_delta' indNo],'-dpng'); end