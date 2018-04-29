close all; clear all; clc;
load('workspaces/ind001');

y_max = zeros(1,10);
printFigure = 0;
set(0, 'DefaultFigureWindowStyle', 'normal')

for i=1:16
    j = 1;
    baseOpen_fft(i,:) = abs(fft(baseOpen(i+21,:),160));
    baseClosed_fft(i,:) = abs(fft(baseClosed(i+21,:),160));
    if y_max(j) < max(baseOpen_fft(i,:))
        y_max(j) = max(baseOpen_fft(i,:));
    end
    j = j + 1;

    if y_max(j) < max(baseClosed_fft(i,:))
        y_max(j) = max(baseClosed_fft(i,:));
    end
    j = j + 1;
    
    figure('units','normalized','outerposition',[0 0 0.5 1]);
    figure(1); 
    subplot(2,1,1); hold on;
    plot(baseOpen_fft(i,:)); hold off;
    subplot(2,1,2); hold on;
    plot(baseClosed_fft(i,:)); hold off;
    
    figure('units','normalized','outerposition',[0 0 0.5 1]);
    figure(2); hold on;
    open = abs(fftshift(fft(baseOpen_alpha(i,:),160)));
    if y_max(j) < max(open)
        y_max(j) = max(open);
    end
    j = j + 1;
    closed = abs(fftshift(fft(baseClosed_alpha(i,:),160)));
    if y_max(j) < max(closed)
        y_max(j) = max(closed);
    end
    j = j + 1;
    subplot(2,1,1); hold on;
    plot(open(80:160)); hold off;
    subplot(2,1,2); hold on;
    plot(closed(80:160)); hold off;

    figure('units','normalized','outerposition',[0 0 0.5 1]);
    figure(3);
    open = abs(fftshift(fft(baseOpen_beta(i,:),160)));
    if y_max(j) < max(open)
        y_max(j) = max(open);
    end
    j = j + 1;
    closed = abs(fftshift(fft(baseClosed_beta(i,:),160)));
    if y_max(j) < max(closed)
        y_max(j) = max(closed);
    end
    j = j + 1;
    subplot(2,1,1); hold on;
    plot(open(80:160)); hold off;
    subplot(2,1,2); hold on;
    plot(closed(80:160)); hold off;

    figure('units','normalized','outerposition',[0 0 0.5 1]);
    figure(4); hold on;
    open = abs(fftshift(fft(baseOpen_theta(i,:),160)));
    if y_max(j) < max(open)
        y_max(j) = max(open);
    end
    j = j + 1;
    closed = abs(fftshift(fft(baseClosed_theta(i,:),160)));
    if y_max(j) < max(closed)
        y_max(j) = max(closed);
    end
    j = j + 1;
    subplot(2,1,1); hold on;
    plot(open(80:160)); hold off;
    subplot(2,1,2); hold on;
    plot(closed(80:160)); hold off;
    
    figure('units','normalized','outerposition',[0 0 0.5 1]);
    figure(5); hold on;
    open = abs(fftshift(fft(baseOpen_delta(i,:),160)));
    if y_max(j) < max(open)
        y_max(j) = max(open);
    end
    j = j + 1;
    closed = abs(fftshift(fft(baseClosed_delta(i,:),160)));
    if y_max(j) < max(closed)
        y_max(j) = max(closed);
    end

    subplot(2,1,1); hold on;
    plot(open(80:160)); hold off;
    subplot(2,1,2); hold on;
    plot(closed(80:160)); hold off;
end

%% Plota FFT sinais 3 eletrodos (22-24) filtrados de 0,5-50Hz 
fig = figure(1);
subplot(2,1,1)
title(['Ind. ' indNo ': Olhos Abertos - Sinal Completo (0,5-30Hz)']);
axis([1 50 0 y_max(1)]);
ylabel('Magnitude (µV)','FontSize',12); xlabel('Frequência (Hz)','FontSize',12);
grid on;
subplot(2,1,2)
title(['Ind. ' indNo ': Olhos Fechados - Sinal Completo (0,5-30Hz)']);
axis([1 50 0 y_max(2)]);
ylabel('Magnitude (µV)','FontSize',12); xlabel('Frequência (Hz)','FontSize',12);
grid on;
if printFigure print(fig,['prints/fft_completo' indNo],'-dpng'); end

fig = figure(2)
subplot(2,1,1)
title(['Ind. ' indNo ': Olhos Abertos - Banda Alpha (8-13Hz)'])
axis([1 50 0 y_max(3)]);
ylabel('Magnitude (µV)','FontSize',12); xlabel('Frequência (Hz)','FontSize',12);
grid on;
subplot(2,1,2)
title(['Ind. ' indNo ': Olhos Fechados - Banda Alpha (8-13Hz)'])
axis([1 50 0 y_max(4)]);
ylabel('Magnitude (µV)','FontSize',12); xlabel('Frequência (Hz)','FontSize',12);
grid on;
if printFigure print(fig,['prints/fft_alpha' indNo],'-dpng'); end

fig = figure(3)
subplot(2,1,1)
title(['Ind. ' indNo ': Olhos Abertos - Banda Beta (13-30Hz)'])
axis([1 50 0 y_max(5)]);
ylabel('Magnitude (µV)','FontSize',12); xlabel('Frequência (Hz)','FontSize',12);
grid on;
subplot(2,1,2)
title(['Ind. ' indNo ': Olhos Fechados - Banda Beta (13-30Hz)'])
axis([1 50 0 y_max(6)]);
ylabel('Magnitude (µV)','FontSize',12); xlabel('Frequência (Hz)','FontSize',12);
grid on;
if printFigure print(fig,['prints/fft_beta' indNo],'-dpng'); end

fig = figure(4)
subplot(2,1,1)
title(['Ind. ' indNo ': Olhos Abertos - Banda Theta (4-8Hz)'])
ylabel('Magnitude (µV)','FontSize',12); xlabel('Frequência (Hz)','FontSize',12);
grid on;
axis([1 50 0 y_max(7)]);
subplot(2,1,2)
title(['Ind. ' indNo ': Olhos Fechados - Banda Theta (4-8Hz)'])
ylabel('Magnitude (µV)','FontSize',12); xlabel('Frequência (Hz)','FontSize',12);
grid on;
axis([1 50 0 y_max(8)]);
if printFigure print(fig,['prints/fft_theta' indNo],'-dpng'); end

fig = figure(5)
subplot(2,1,1)
title(['Ind. ' indNo ': Olhos Abertos - Banda Delta (0,5-4Hz)'])
ylabel('Magnitude (µV)','FontSize',12); xlabel('Frequência (Hz)','FontSize',12);
grid on;
axis([1 50 0 y_max(9)]);
subplot(2,1,2)
title(['Ind. ' indNo ': Olhos Fechados - Banda Delta (0,5-4Hz)'])
ylabel('Magnitude (µV)','FontSize',12); xlabel('Frequência (Hz)','FontSize',12);
grid on;
axis([1 50 0 y_max(10)]);
if printFigure print(fig,['prints/fft_delta' indNo],'-dpng'); end