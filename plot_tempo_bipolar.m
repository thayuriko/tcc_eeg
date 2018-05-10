%% Plota sinais 64 eletrodos filtrados de 0,5-05Hz
set(0, 'DefaultFigureWindowStyle', 'docked')

baseopen_bip = baseline_bip;
baseopen = baseline;

if exist(['workspaces/ind' indNo '_state02.mat'], 'file') == 2
    load(['workspaces/ind' indNo '_state02.mat']);
else
    stateNo = '02';
    run tratamento_thais.m;
end

for i=1:6
    closedbip_delta(i,:) = filtdelta(baseline_bip(i,:));    
    closedbip_alpha(i,:) = filtalpha(baseline_bip(i,:));
    openbip_delta(i,:) = filtdelta(baseopen_bip(i,:));    
    openbip_alpha(i,:) = filtalpha(baseopen_bip(i,:));
end

for i=1:18 %Fp1 ao F8
    baseline_delta(i,:) = filtdelta(baseline(i+21,1:9600));    
    baseline_theta(i,:) = filttheta(baseline(i+21,1:9600));
    baseline_alpha(i,:) = filtalpha(baseline(i+21,1:9600));
    baseline_beta(i,:) = filtbeta(baseline(i+21,1:9600));
    
    baseopen_delta(i,:) = filtdelta(baseopen(i+21,1:9600));    
    baseopen_theta(i,:) = filttheta(baseopen(i+21,1:9600));
    baseopen_alpha(i,:) = filtalpha(baseopen(i+21,1:9600));
    baseopen_beta(i,:) = filtbeta(baseopen(i+21,1:9600));
end

tempo = 0:5:60;
ySpacing = 700;
xSpacing = tempo(length(tempo))/(tempo(length(tempo))/(length(tempo)-1)); %12 para um passo de 5

scale1 = max([max(max(baseline)) abs(min(min(baseline))) max(max(baseopen)) abs(min(min(baseopen)))]);
scale1 = 2 - round(scale1/ySpacing * 8)/8; %precisão de 12.5
fprintf('Escala plots 1-10: %s%%\n', num2str(scale1*100));

fig = figure;
hold on
for i=1:64
    for j=1:9600
        electrode(i,j) = scale1*baseline(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(0,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'fechados','complete');
if ~PRINT_FIGS print(fig,['prints/tempo_64elec_' indNo '_closed'],'-dpng'); end

fig = figure;
hold on
for i=1:64
    for j=1:9600
        electrode(i,j) = scale1*baseopen(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(0,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'abertos','complete');
if ~PRINT_FIGS print(fig,['prints/tempo_64elec_' indNo '_open'],'-dpng'); end

%% Plota sinais 64 eletrodos filtrados em DELTA 0,5-4Hz
fig = figure;
subplot(1,2,1)
hold on
for i=1:18
    for j=1:9600
        electrode(i,j) = scale1*baseopen_delta(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(3,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'abertos','delta');

subplot(1,2,2)
hold on
for i=1:18
    for j=1:9600
        electrode(i,j) = scale1*baseline_delta(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(3,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'fechados','delta');
if ~PRINT_FIGS print(fig,['prints/tempo_16elec_delta_' indNo],'-dpng'); end


fig = figure;
subplot(1,2,1)
hold on
for i=1:18
    for j=1:9600
        electrode(i,j) = scale1*baseopen_theta(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(3,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'abertos','theta');

subplot(1,2,2)
hold on
for i=1:18
    for j=1:9600
        electrode(i,j) = scale1*baseline_theta(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(3,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'fechados','theta');
if ~PRINT_FIGS print(fig,['prints/tempo_16elec_theta_' indNo],'-dpng'); end


fig = figure;
subplot(1,2,1)
hold on
for i=1:18
    for j=1:9600
        electrode(i,j) = scale1*baseopen_alpha(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(3,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'abertos','alpha');

subplot(1,2,2)
hold on
for i=1:18
    for j=1:9600
        electrode(i,j) = scale1*baseline_alpha(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(3,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'fechados','alpha');
if ~PRINT_FIGS print(fig,['prints/tempo_16elec_alpha_' indNo],'-dpng'); end


fig = figure;
subplot(1,2,1)
hold on
for i=1:18
    for j=1:9600
        electrode(i,j) = scale1*baseopen_beta(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(3,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'abertos','beta');

subplot(1,2,2)
hold on
for i=1:18
    for j=1:9600
        electrode(i,j) = scale1*baseline_beta(i,j)+ySpacing*(i-1);
    end
    plot(electrode(i,:));
end

hold off
setPlotProperties2(3,electrode(1,:),ySpacing,labels,9600/xSpacing,tempo,indNo,'fechados','beta');
if ~PRINT_FIGS print(fig,['prints/tempo_16elec_beta_' indNo],'-dpng'); end


set(0, 'DefaultFigureWindowStyle', 'normal')
ySpacing = 300; tempo = 0:1:60; bip_closed = zeros(6,9600); bip_open = zeros(6,9600);
ylabels = {'C4-P4','F4-C4','Fp2-F4','C3-P3','F3-C3','Fp1-F3'};
scale2 = max([max(max(baseopen_bip)) abs(min(min(baseopen_bip)))]);
scale2 = max([max(max(baseline)) abs(min(min(baseline))) scale2]);

if round(scale2/ySpacing * 8)/8 < 2
    scale2 = 2 - round(scale2/ySpacing * 8)/8;
else
    scale2 = 0.325;
end

fig = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(1,2,1); hold on;
for i=1:size(baseopen_bip, 1)
    for j=1:9600
        bip_open(i,j) = scale2*baseopen_bip(i,j)+ySpacing*(i-1);
    end

    plot(bip_open(i,:));
end
hold off;
setPlotProperties2(1,bip_open(1,:),ySpacing, ylabels, 9600/xSpacing, tempo, indNo, 'abertos', 'complete');

subplot(1,2,2); hold on;
for i=1:size(baseline_bip, 1)
    for j=1:9600
        bip_closed(i,j) = scale2*baseline_bip(i,j)+ySpacing*(i-1);
    end

    plot(bip_closed(i,:)); 
end
hold off;

setPlotProperties2(1,bip_closed(1,:),ySpacing, ylabels, 9600/xSpacing, tempo, indNo, 'fechados', 'complete');

fprintf('Escala plot 11: %s%%\n', num2str(scale2*100));
if ~PRINT_FIGS print(fig,['prints/tempo_bipolar_' indNo],'-dpng'); end

set(0, 'DefaultFigureWindowStyle', 'normal')
plotBipolarBand(~PRINT_FIGS, openbip_alpha, closedbip_alpha, 'alpha', indNo);
plotBipolarBand(~PRINT_FIGS, openbip_delta, closedbip_delta, 'delta', indNo);