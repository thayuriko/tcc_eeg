timeAxis = 0:5:60;
xSpacing = timeAxis(length(timeAxis))/(timeAxis(length(timeAxis))/(length(timeAxis)-1));
maxVal = max([abs(min(min(baseline_filt))) max(max(baseline_filt))]);

figure
% subplot 1
subplot(3,1,1)
spectrogram(baseline_filt(1,:),120,60,1024,160,'yaxis');
ylim([0 10]); xlabel('Tempo (s)'); ylabel('Frequência (Hz)');
title(['Ind.' indNo ': Olhos Abertos (1-6Hz)']);

% subplot 2
axes1 = axes('Position',[0.130520833333333 0.068462401795735 0.7325 0.206509539842873]);
hold(axes1,'on');
plot(T,avgPLeft,'Parent',axes1);
plot(T,avgPRight,'Parent',axes1);
plot(avgOpen*ones(1,60),'Parent',axes1); box(axes1,'on');
axis([1 59 min([avgPRight avgPLeft]) max([avgPRight avgPLeft])]);
box(axes1,'on'); grid(axes1,'on');

title('Média da Densidade Espectral de Potência');
xlabel('Tempo (s)'); ylabel('Amplitude (dB/Hz)');
legend('Hemisfério Esquerdo', 'Hemisfério Direito', 'Limiar de Decisão');

% subplot 3
axes1 = axes('Position',[0.13 0.38637567240415 0.7325 0.209811278807309]);
hold(axes1,'on');
plot(baseline_filt(1,:),'Parent',axes1);
plot(baseline_filt(2,:),'Parent',axes1);
axis([0 9600 -maxVal maxVal]);
box(axes1,'on'); grid(axes1,'on');
set(gca,'xtick',0:9600/xSpacing:9600,'xticklabel',timeAxis);
title('Sinal original no tempo');
xlabel('Tempo (s)'); ylabel('Amplitude (\muV)');
legend('Hemisfério Esquerdo', 'Hemisfério Direito');