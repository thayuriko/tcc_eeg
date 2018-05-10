function plotBipolarBand(printFigure, baseOpen_band, baseClosed_band, band, indNo)
    ylabels = {'C4-P4','F4-C4','Fp2-F4','C3-P3','F3-C3','Fp1-F3'};
    tempo = 0:5:60;
    xSpacing = tempo(length(tempo))/(tempo(length(tempo))/(length(tempo)-1)); %12 para um passo de 5
    ySpacing = 300;
    tempo = 0:1:60;

    scale = max([max(max(baseOpen_band)) abs(min(min(baseOpen_band))) max(max(baseClosed_band)) abs(min(min(baseClosed_band)))]);

    if round(scale/ySpacing * 8)/8 < 2
        scale = 2 - round(scale/ySpacing * 8)/8;
    else
        scale = 0.325;
    end

    fprintf('Escala plot 11: %s%%\n', num2str(scale*100));

    % baseOpen
    fig = figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(1,2,1)
    hold on
    for i=1:size(baseOpen_band, 1)
        for j=1:9600
            bip_open(i,j) = scale*baseOpen_band(i,j)+ySpacing*(i-1);
        end
        plot(bip_open(i,:))
    end
    hold off
    setPlotProperties2(1,bip_open(1,:),ySpacing,ylabels,9600/xSpacing,tempo,indNo,'abertos',band);

    % baseClosed
    subplot(1,2,2)
    hold on
    for i=1:size(baseOpen_band, 1)
        for j=1:9600
            bip_closed(i,j) = scale*baseClosed_band(i,j)+ySpacing*(i-1);
        end
        plot(bip_closed(i,:))
    end
    hold off
    setPlotProperties2(1,bip_open(1,:),ySpacing,ylabels,9600/xSpacing,tempo,indNo,'fechados',band);
    if printFigure print(fig,['prints/tempo_bipolar_' band '_' indNo],'-dpng'); end