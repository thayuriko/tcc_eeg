clear all; close all; clc;
%ruins: 2, 3, 5
%testados: 1 - 9
indNo = '001'; %definir o número do indivíduo a ter os gráficos gerados!
printFigure = 0;

addpath('./scripts'); %permite carregar as funções contidas nessa pasta

if exist(['workspaces/ind' indNo '.mat'], 'file') == 2
    load(['workspaces/ind' indNo '.mat']);
else
    run tratamento_thais.m;
end

%% Plota sinais 64 eletrodos filtrados de 0,5-05Hz
set(0, 'DefaultFigureWindowStyle', 'docked')
tempo = 0:5:60;
ySpacing = 700;
xSpacing = tempo(length(tempo))/(tempo(length(tempo))/(length(tempo)-1)); %12 para um passo de 5

scale = max([max(max(baseOpen)) abs(min(min(baseOpen))) max(max(baseClosed)) abs(min(min(baseClosed)))]);
scale = 2 - round(scale/ySpacing * 8)/8; %precisão de 12.5
fprintf('Escala plots 1-10: %s%%\n', num2str(scale*100));

fig = figure;
hold on
for i=1:64
    for j=1:9600
        electrode(i,j) = scale*baseOpen(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(0,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'Abertos','complete');
if printFigure print(fig,['prints/tempo_64elec_open_' indNo],'-dpng'); end


fig = figure;
hold on
for i=1:64
    for j=1:9600
        electrode(i,j) = scale*baseClosed(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(0,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'Fechados','complete');
if printFigure print(fig,['prints/tempo_64elec_closed_' indNo],'-dpng'); end
%% Plota sinais 64 eletrodos filtrados em DELTA 0,5-4Hz
fig = figure;
hold on
for i=1:64
    for j=1:9600
        electrode(i,j) = scale*baseOpen_delta(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(0,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'Abertos','delta');
if printFigure print(fig,['prints/tempo_delta_open_' indNo],'-dpng'); end

fig = figure;
hold on
for i=1:64
    for j=1:9600
        electrode(i,j) = scale*baseClosed_delta(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(0,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'Fechados','delta');
if printFigure print(fig,['prints/tempo_delta_closed_' indNo],'-dpng'); end

%% Plota sinais 64 eletrodos filtrados em TETHA 4-8Hz
fig = figure;
hold on
for i=1:64
    for j=1:9600
        electrode(i,j) = scale*baseOpen_theta(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(0,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'Abertos','theta');
if printFigure print(fig,['prints/tempo_theta_open_' indNo],'-dpng'); end

fig = figure;
hold on
for i=1:64
    for j=1:9600
        electrode(i,j) = scale*baseClosed_theta(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(0,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'Fechados','theta');
if printFigure print(fig,['prints/tempo_theta_closed_' indNo],'-dpng'); end
%% Plota sinais 64 eletrodos filtrados em ALPHA 8-13Hz
fig = figure;
hold on
for i=1:64
    for j=1:9600
        electrode(i,j) = scale*baseOpen_alpha(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(0,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'Abertos','alpha');
if printFigure print(fig,['prints/tempo_alpha_open_' indNo],'-dpng'); end

fig = figure;
hold on
for i=1:64
    for j=1:9600
        electrode(i,j) = scale*baseClosed_alpha(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(0,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'Fechados','alpha');
if printFigure print(fig,['prints/tempo_alpha_closed_' indNo],'-dpng'); end
%% Plota sinais 64 eletrodos filtrados em BETA 13-30Hz
fig = figure;
hold on
for i=1:64
    for j=1:9600
        electrode(i,j) = scale*baseOpen_beta(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(0,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'Abertos','beta')
if printFigure print(fig,['prints/tempo_beta_open_' indNo],'-dpng'); end

fig = figure;
hold on
for i=1:64
    for j=1:9600
        electrode(i,j) = scale*baseClosed_beta(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(0,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'Fechados','beta');
if printFigure print(fig,['prints/tempo_beta_closed_' indNo],'-dpng'); end
%% ANÁLISE BIPOLAR ELETRODOS FRONTAIS
set(0, 'DefaultFigureWindowStyle', 'normal')
ySpacing = 300;
tempo = 0:1:60;
ylabels = {'C4-P4','F4-C4','Fp2-F4','C3-P3','F3-C3','Fp1-F3'};

scale = max([max(max(baseOpen_bip)) abs(min(min(baseOpen_bip))) max(max(baseClosed_bip)) abs(min(min(baseClosed_bip)))]);

if round(scale/ySpacing * 8)/8 < 2
    scale = 2 - round(scale/ySpacing * 8)/8;
else
    scale = 0.325;
end

% baseOpen
fig = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(1,2,1)
hold on
for i=1:size(baseOpen_bip, 1)
    for j=1:9600
        bip_open(i,j) = scale*baseOpen_bip(i,j)+ySpacing*(i-1);
    end
    plot(bip_open(i,:))
end
hold off
setPlotProperties2(1,bip_open(1,:),ySpacing, ylabels, 9600/xSpacing, tempo, indNo, 'Abertos', 'complete');

% baseClosed
subplot(1,2,2)
hold on
for i=1:size(baseOpen_bip, 1)
    for j=1:9600
        bip_closed(i,j) = scale*baseClosed_bip(i,j)+ySpacing*(i-1);
    end
    plot(bip_closed(i,:))
end
hold off
setPlotProperties2(1,bip_closed(1,:),ySpacing, ylabels, 9600/xSpacing, tempo, indNo, 'Fechados', 'complete');
fprintf('Escala plot 11: %s%%\n', num2str(scale*100));
if printFigure print(fig,['prints/tempo_bipolar_' indNo],'-dpng'); end

run script_bandas.m
%% Spectrogram
run 'plot_spectrogram.m'