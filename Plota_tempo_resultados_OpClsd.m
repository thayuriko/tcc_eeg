%% Plota sinais 64 eletrodos filtrados de 0,5-05Hz
tempo = 0:5:60;
interv = 0:160:96000;

figure
hold on
for i=1:64
    for j=1:9600
        impr(i,j) = baseOpen_filt(i,j)+700*(i-1);
    end
    plot(impr(i,:));
end
hold off
set(gca,'ytick',0:700:44100,'yticklabel',labels,'FontSize',6);
set(gca,'xtick',0:800:9600,'xticklabel',tempo,'FontSize',6);
ylabel('Eletrodos','FontSize',12)
xlabel('Tempo (s)','FontSize',12)
title('Individuo 1 olhos abertos 0,5-50Hz','FontSize',12)
axis ([0 9600 -600 44700])

figure
hold on
for i=1:64
    for j=1:9600
        impr(i,j) = baseClosed_filt(i,j)+700*(i-1);
    end
    plot(impr(i,:));
end
hold off
set(gca,'ytick',0:700:44100,'yticklabel',labels,'FontSize',6);
set(gca,'xtick',0:800:9600,'xticklabel',tempo,'FontSize',6);
ylabel('Eletrodos','FontSize',12)
xlabel('Tempo (s)','FontSize',12)
title('Individuo 1 olhos fechados 0,5-50Hz','FontSize',12)
axis ([0 9600 -600 44700])

%% Plota sinais 64 eletrodos filtrados em DELTA 0,5-4Hz
figure
hold on
for i=1:64
    for j=1:9600
        impr(i,j) = baseOpen_delta(i,j)+700*(i-1);
    end
    plot(impr(i,:));
end
hold off
set(gca,'ytick',0:700:44100,'yticklabel',labels,'FontSize',6);
set(gca,'xtick',0:800:9600,'xticklabel',tempo,'FontSize',6);
ylabel('Eletrodos','FontSize',12)
xlabel('Tempo (s)','FontSize',12)
title('Individuo 1 baseOpen Delta (0,5-4Hz)','FontSize',12)

figure
hold on
for i=1:64
    for j=1:9600
        impr(i,j) = baseClosed_delta(i,j)+700*(i-1);
    end
    plot(impr(i,:));
end
hold off
set(gca,'ytick',0:700:44100,'yticklabel',labels,'FontSize',6);
set(gca,'xtick',0:800:9600,'xticklabel',tempo,'FontSize',6);
ylabel('Eletrodos','FontSize',12)
xlabel('Tempo (s)','FontSize',12)
title('Individuo 1 baseClosed Delta (0,5-4Hz)','FontSize',12)

%% Plota sinais 64 eletrodos filtrados em TETHA 4-8Hz
figure
hold on
for i=1:64
    for j=1:9600
        impr(i,j) = baseOpen_tetha(i,j)+700*(i-1);
    end
    plot(impr(i,:));
end
hold off
set(gca,'ytick',0:700:44100,'yticklabel',labels,'FontSize',6);
set(gca,'xtick',0:800:9600,'xticklabel',tempo,'FontSize',6);
ylabel('Eletrodos','FontSize',12)
xlabel('Tempo (s)','FontSize',12)
title('Individuo 1 baseOpen Tetha (4-8Hz)','FontSize',12)

figure
hold on
for i=1:64
    for j=1:9600
        impr(i,j) = baseClosed_tetha(i,j)+700*(i-1);
    end
    plot(impr(i,:));
end
hold off
set(gca,'ytick',0:700:44100,'yticklabel',labels,'FontSize',6);
set(gca,'xtick',0:800:9600,'xticklabel',tempo,'FontSize',6);
ylabel('Eletrodos','FontSize',12)
xlabel('Tempo (s)','FontSize',12)
title('Individuo 1 baseClosed Tetha (4-8Hz)','FontSize',12)

%% Plota sinais 64 eletrodos filtrados em ALPHA 8-13Hz
figure
hold on
for i=1:64
    for j=1:9600
        impr(i,j) = baseOpen_alpha(i,j)+700*(i-1);
    end
    plot(impr(i,:));
end
hold off
set(gca,'ytick',0:700:44100,'yticklabel',labels,'FontSize',6);
set(gca,'xtick',0:800:9600,'xticklabel',tempo,'FontSize',6);
ylabel('Eletrodos','FontSize',12)
xlabel('Tempo (s)','FontSize',12)
title('Individuo 1 baseOpen Alpha (8-13Hz)','FontSize',12)

figure
hold on
for i=1:64
    for j=1:9600
        impr(i,j) = baseClosed_alpha(i,j)+700*(i-1);
    end
    plot(impr(i,:));
end
hold off
set(gca,'ytick',0:700:44100,'yticklabel',labels,'FontSize',6);
set(gca,'xtick',0:800:9600,'xticklabel',tempo,'FontSize',6);
ylabel('Eletrodos','FontSize',12)
xlabel('Tempo (s)','FontSize',12)
title('Individuo 1 baseClosed Alpha (8-13Hz)','FontSize',12)

%% Plota sinais 64 eletrodos filtrados em BETA 13-30Hz
figure
hold on
for i=1:64
    for j=1:9600
        impr(i,j) = baseOpen_beta(i,j)+700*(i-1);
    end
    plot(impr(i,:));
end
hold off
set(gca,'ytick',0:700:44100,'yticklabel',labels,'FontSize',6);
set(gca,'xtick',0:800:9600,'xticklabel',tempo,'FontSize',6);
ylabel('Eletrodos','FontSize',12)
xlabel('Tempo (s)','FontSize',12)
title('Individuo 1 baseOpen Beta (13-30Hz)','FontSize',12)

figure
hold on
for i=1:64
    for j=1:9600
        impr(i,j) = baseClosed_beta(i,j)+700*(i-1);
    end
    plot(impr(i,:));
end
hold off
set(gca,'ytick',0:700:44100,'yticklabel',labels,'FontSize',6);
set(gca,'xtick',0:800:9600,'xticklabel',tempo,'FontSize',6);
ylabel('Eletrodos','FontSize',12)
xlabel('Tempo (s)','FontSize',12)
title('Individuo 1 baseClosed Beta (13-30Hz)','FontSize',12)

%% ANÁLISE BIPOLAR ELETRODOS FRONTAIS - DELTA
ref = zeros(1,9600);
% baseOpen
figure
subplot(1,2,1)
hold on
for i=1:6
    for j=1:9600
        bip_open(i,j) = baseOpen_bip(i,j)+300*(i-1);
        reff(1,j) = ref(1,j)+300*(i-1);
    end
    plot(bip_open(i,:))
    plot(reff(1,:),':k');
end
hold off
axis([0 3200 -300 1900])
% set(gca,'ytick',0:300:2700,'yticklabel',{'P4-O2','C4-P4','F4-C4','Fp2-F4',...
%     'Cz-Pz','Fz-Cz','P3-O1','C3-P3','F3-C3','Fp1-F3'},...
%     'FontSize',8);
%set(gca,'ytick',0:300:2100,'yticklabel',{'P4-O2','C4-P4','F4-C4','Fp2-F4',...
%    'P3-O1','C3-P3','F3-C3','Fp1-F3'},...
%    'FontSize',8);
set(gca,'ytick',0:300:1500,'yticklabel',{'C4-P4','F4-C4','Fp2-F4',...
    'C3-P3','F3-C3','Fp1-F3'},...
    'FontSize',8);
set(gca,'xtick',0:800:9600,'xticklabel',tempo,'FontSize',12);
% legend('Fp1-F3','','F3-C3','','Fp2-F4','','F4-C4','')
title('Individuo 1 BaseOpen(0,5-4Hz)')

% baseClosed
subplot(1,2,2)
hold on
for i=1:6 %menos eletrodos
    for j=1:9600
        bip_closed(i,j) = baseClosed_bip(i,j)+300*(i-1);
        reff(1,j) = ref(1,j)+300*(i-1);
    end
    plot(bip_closed(i,:))
    plot(reff(1,:),':k');
end
hold off
axis([0 3200 -300 1900])
% set(gca,'ytick',0:300:2700,'yticklabel',{'P4-O2','C4-P4','F4-C4','Fp2-F4',...
%     'Cz-Pz','Fz-Cz','P3-O1','C3-P3','F3-C3','Fp1-F3'},...
%     'FontSize',8);
%set(gca,'ytick',0:300:2100,'yticklabel',{'P4-O2','C4-P4','F4-C4','Fp2-F4',...
%    'P3-O1','C3-P3','F3-C3','Fp1-F3'},...
%    'FontSize',8);
set(gca,'ytick',0:300:1500,'yticklabel',{'C4-P4','F4-C4','Fp2-F4',...
    'C3-P3','F3-C3','Fp1-F3'},...
    'FontSize',8);
set(gca,'xtick',0:800:9600,'xticklabel',tempo,'FontSize',12);
% legend('Fp1-F3','','F3-C3','','Fp2-F4','','F4-C4','')
title('Individuo 1 baseClosed(0,5-4Hz)')

figure
% spectrogram(baseOpen_bip(4,:),[],[],[],160,'yaxis')
[S,F,T,P] = spectrogram(baseOpen_bip(4,:),120,60,160,160,'yaxis');
spectrogram(baseOpen_bip(4,(1:3200)),120,60,160,160,'yaxis');
% plot(T,P) % frequency-time Plot of the signal
ylim([0 50])
xlabel('Time (secs)')
ylabel('Frequency (Hz)')
figure
spectrogram(baseClosed_bip(4,(1:3200)),120,60,160,160,'yaxis');
ylim([0 50])
