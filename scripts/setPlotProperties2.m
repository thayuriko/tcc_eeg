function setPlotProperties2(plotType,signal,ySpacing,ylabels,xSpacing,xlabels,indNo,eyeState,titleParam)
if plotType == 0 %64 eletrodos
    yValue = 65;
    fontSize = 6;
    
    set(gca,'ytick',0:ySpacing:(yValue-1)*ySpacing,'yticklabel',ylabels,'FontSize',6);
    axis ([0 9600 (0-ySpacing) (64*ySpacing-100)]);
elseif plotType == 1 %plot bipolar
    yValue = 6;
    fontSize = 12;
    
    set(gca,'ytick',0:ySpacing:(yValue-1)*ySpacing,'yticklabel',ylabels,'FontSize',8);
    axis([0 3200 -ySpacing (yValue*ySpacing+100)])
    
elseif plotType == 2 %spectrogram
    fontSize = 10;
    plotPosition = double(vpa([0.128958333333333 0.11 0.688369432846208 0.341162790697673]));
    
    axes1 = axes('Position', plotPosition); hold(axes1,'on'); box(axes1,'on'); grid on;
    plot(signal,'Parent',axes1);
    xlabel('Tempo (s)'); ylabel('Amplitude (\muV)');
    maximum = max([abs(min(signal)) max(signal)]);
    axis([0 2400 -maximum maximum]);
end

set(gca,'xtick',0:xSpacing:length(signal),'xticklabel',xlabels,'FontSize',fontSize);
ylabel('Eletrodos','FontSize',12); xlabel('Tempo (s)','FontSize',12);

if plotType == 2 %spectrogram
    ylabel('Amplitude (\muV)');
end

switch titleParam
    case 'alpha'
        title(['Ind.' indNo ': Olhos ' eyeState ' - Banda Alpha (8-13Hz)'],'FontSize',12);
    case 'beta'
        title(['Ind.' indNo ': Olhos ' eyeState ' - Banda Beta (13-30Hz)'],'FontSize',12);
    case 'delta'
        title(['Ind.' indNo ': Olhos ' eyeState ' - Banda Delta (0,5-4Hz)'],'FontSize',12);
    case 'theta'
        title(['Ind.' indNo ': Olhos ' eyeState ' - Banda Theta (4-8Hz)'],'FontSize',12);
    case 'complete'
        title(['Ind.' indNo ': Olhos ' eyeState ' - Sinal completo (0,5-30 Hz)'],'FontSize',12);
    case 'electrode'
        title(['Ind.' indNo ': Olhos ' eyeState ' (' ylabels ')'],'FontSize',12);
end

grid on;