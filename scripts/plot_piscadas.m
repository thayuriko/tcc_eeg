tempo = 0:5:60;
xSpacing = tempo(length(tempo))/(tempo(length(tempo))/(length(tempo)-1)); %12 para um passo de 5
maximum = max([abs(min(baseOpen_delta(3,:))) max(baseOpen_delta(3,:)) abs(min(baseOpen_delta(6,:))) max(baseOpen_delta(6,:))]);


figure
axes1 = axes('Position',[0.130520833333333 0.068462401795735 0.7325 0.206509539842873]);
hold(axes1,'on');
plot(T,avgPLeft,'Parent',axes1);
plot(T,avgPRight,'Parent',axes1);
plot(avgOpen*ones(1,60),'Parent',axes1); box(axes1,'on');
axis([1 59 min([avgPRight avgPLeft]) max([avgPRight avgPLeft])]);
grid(axes1,'on');
title('Densidade Espectral M�dia');
xlabel('Tempo (s)'); ylabel('Amplitude (dB)');
legend('Hemisf�rio Esquerdo', 'Hemisf�rio Direito', 'Limiar de Decis�o');

axes1 = axes('Position',[0.13 0.38637567240415 0.7325 0.209811278807309]);
hold(axes1,'on');
plot(baseOpen_delta(3,:),'Parent',axes1);
plot(baseOpen_delta(6,:),'Parent',axes1);
axis([0 9600 -maximum maximum]);
box(axes1,'on'); grid(axes1,'on');
set(gca,'xtick',0:9600/xSpacing:9600,'xticklabel',tempo);
title('Sinal original');
xlabel('Tempo (s)'); ylabel('Amplitude (\muV)');
legend('Hemisf�rio Esquerdo', 'Hemisf�rio Direito');

subplot(3,1,1)
spectrogram(baseOpen_delta(3,:),120,60,1024,160,'yaxis');
ylim([0 10]); xlabel('Tempo (s)'); ylabel('Frequ�ncia (Hz)');
%spectrogram(baseOpen_delta(3,:),120,60,160,160,'yaxis'); %sinal, 2*fmax, fmax, Nfft, fs
title(['Ind.' indNo ': Olhos Abertos - Banda Delta (0,5-4Hz)']);