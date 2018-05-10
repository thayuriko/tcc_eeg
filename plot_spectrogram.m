digits(15);

fig = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(2,2,1)
spectrogram(baseopen_bip(6,1:2400),120,60,1024,160,'yaxis');
ylim([0 40]); xlabel('Tempo (s)'); ylabel('Frequência (Hz)');
title(['Ind.' indNo ': Olhos Abertos (Fp1-F3)']);

subplot(2,2,2)
spectrogram(baseline_bip(6,1:2400),120,60,1024,160,'yaxis');
ylim([0 40]); xlabel('Tempo (s)'); ylabel('Frequência (Hz)');
title(['Ind.' indNo ': Olhos Fechados (Fp1-F3)']);

subplot(2,2,3)
spectrogram(baseopen_bip(4,1:2400),120,60,1024,160,'yaxis');
ylim([0 40]); xlabel('Tempo (s)'); ylabel('Frequência (Hz)');
title(['Ind.' indNo ': Olhos Abertos (P3-C3)']);

subplot(2,2,4)
spectrogram(baseline_bip(4,1:2400),120,60,1024,160,'yaxis');
ylim([0 40]); xlabel('Tempo (s)'); ylabel('Frequência (Hz)');
title(['Ind.' indNo ': Olhos Fechados (P3-C3)']);

if printFigure print(fig,['prints/spectro_comparison_' indNo],'-dpng'); end

%% spectrogram + tempo
tempo = 0:2:15;

fig = figure('units','normalized','outerposition',[0 0 0.5 1]);
subplot(2,1,1)
spectrogram(baseopen_bip(6,1:2400),120,60,1024,160,'yaxis');
ylim([0 40]); xlabel('Tempo (s)'); ylabel('Frequência (Hz)');
title(['Ind.' indNo ': Olhos Abertos (Fp1-F3)'], 'FontSize', 12);
setPlotProperties2(2, baseopen_bip(6,1:2400),0,'Fp1-F3',160*2,tempo,indNo,'Abertos','electrode');
if printFigure print(fig,'prints/spectro_fp1f3_open','-dpng'); end


fig = figure('units','normalized','outerposition',[0 0 0.5 1]);
subplot(2,1,1)
spectrogram(baseClosed_bip(6,1:2400),120,60,1024,160,'yaxis');
ylim([0 40]); xlabel('Tempo (s)'); ylabel('Frequência (Hz)');
title(['Ind.' indNo ': Olhos Fechados (Fp1-F3)'], 'FontSize', 12);
setPlotProperties2(2, baseClosed_bip(6,1:2400),0,'Fp1-F3',160*2,tempo,indNo,'Fechados','electrode');
if printFigure print(fig,'prints/spectro_fp1f3_closed','-dpng'); end

fig = figure('units','normalized','outerposition',[0 0 0.5 1]);
subplot(2,1,1)
spectrogram(baseopen_bip(4,1:2400),120,60,1024,160,'yaxis');
ylim([0 40]); xlabel('Tempo (s)'); ylabel('Frequência (Hz)');
title(['Ind.' indNo ': Olhos Abertos (C3-P3)'], 'FontSize', 12);
setPlotProperties2(2, baseopen_bip(4,1:2400),0,'C3-P3',160*2,tempo,indNo,'Abertos','electrode');
if printFigure print(fig,'prints/spectro_c3p3_open','-dpng'); end

fig = figure('units','normalized','outerposition',[0 0 0.5 1]);
subplot(2,1,1)
spectrogram(baseClosed_bip(4,1:2400),120,60,1024,160,'yaxis');
ylim([0 40]); xlabel('Tempo (s)'); ylabel('Frequência (Hz)');
title(['Ind.' indNo ': Olhos Fechados (C3-P3)'], 'FontSize', 12);
setPlotProperties2(2, baseClosed_bip(4,1:2400),0,'C3-P3',160*2,tempo,indNo,'Fechados','electrode');
if printFigure print(fig,'prints/spectro_c3p3_closed','-dpng'); end

fig = figure('units','normalized','outerposition',[0 0 0.5 1]);
subplot(2,1,1)
spectrogram(baseopen_bip(3,1:2400),120,60,1024,160,'yaxis');
ylim([0 40]); xlabel('Tempo (s)'); ylabel('Frequência (Hz)');
title(['Ind.' indNo ': Olhos Abertos (Fp2-F4)'], 'FontSize', 12);
setPlotProperties2(2,baseopen_bip(3,1:2400),0,'Fp2-F4',160*2,tempo,indNo,'Abertos','electrode');
if printFigure print(fig,'prints/spectro_fp2f4_open','-dpng'); end

fig = figure('units','normalized','outerposition',[0 0 0.5 1]);
subplot(2,1,1)
spectrogram(baseClosed_bip(3,1:2400),120,60,1024,160,'yaxis');
ylim([0 40]); xlabel('Tempo (s)'); ylabel('Frequência (Hz)');
title(['Ind.' indNo ': Olhos Fechados (Fp2-F4)'], 'FontSize', 12);
setPlotProperties2(2,baseClosed_bip(3,1:2400),0,'Fp2-F4',160*2,tempo,indNo,'Fechados','electrode');
if printFigure print(fig,'prints/spectro_fp2f4_closed','-dpng'); end

fig = figure('units','normalized','outerposition',[0 0 0.5 1]);
subplot(2,1,1)
spectrogram(baseopen_bip(1,1:2400),120,60,1024,160,'yaxis');
ylim([0 40]); xlabel('Tempo (s)'); ylabel('Frequência (Hz)');
title(['Ind.' indNo ': Olhos Abertos (C4-P4)'], 'FontSize', 12);
setPlotProperties2(2,baseopen_bip(1,1:2400),0,'C4-P4',160*2,tempo,indNo,'Abertos','electrode');
if printFigure print(fig,'prints/spectro_c4p4_open','-dpng'); end

fig = figure('units','normalized','outerposition',[0 0 0.5 1]);
subplot(2,1,1)
spectrogram(baseClosed_bip(1,1:2400),120,60,1024,160,'yaxis');
ylim([0 40]); xlabel('Tempo (s)'); ylabel('Frequência (Hz)');
title(['Ind.' indNo ': Olhos Fechados (C4-P4)'], 'FontSize', 12);
setPlotProperties2(2,baseClosed_bip(1,1:2400),0,'C4-P4',160*2,tempo,indNo,'Fechados','electrode');
if printFigure print(fig,'prints/spectro_c4p4_closed','-dpng'); end