y_max = 0;
%% Plota FFT sinais 3 eletrodos (22-24) filtrados de 0,5-50Hz 
figure
% subplot(2,1,1)
title('FFT Individuo 107 baseOpen e baseClosed 0,5-50Hz')
hold on
for i=1:3
    mag = abs(fftbaseOpen_filt(i,(80:160)));
    plot(mag,':')
    if(y_max<max(mag))
        y_max = max(mag); 
    end
end
axis([1 50 0 y_max])
% legend('Fp1 open','Fpz open','Fp2 open')
% hold off

% subplot(2,1,2)
% title('FFT Individuo 107 baseClosed 0,5-50Hz')
hold on
for i=1:3
    mag = abs(fftbaseClosed_filt(i,(80:160)));
    plot(mag)
    if(y_max<max(mag))
        y_max = max(mag); 
    end
end
axis([1 50 0 y_max])
legend('Fp1 open','Fpz open','Fp2 open','Fp1 closed','Fpz closed','Fp2 closed')
ylabel('Magnitude(µV)','FontSize',12)
xlabel('Frequência(Hz)','FontSize',12)
hold off

%% Plota FFT sinais 3 eletrodos (22-24) filtrados em DELTA 0,5-4Hz 
figure
% subplot(2,1,1)
title('FFT Individuo 107 baseOpen e baseClosed Delta(0,5-4Hz)')
hold on
for i=1:3
    mag = abs(fftbaseOpen_delta(i,(80:160)));
    plot(mag,':')
    if(y_max<max(mag))
        y_max = max(mag); 
    end
end
axis([1 50 0 y_max])
% legend('Fp1 open','Fpz open','Fp2 open')
% hold off

% subplot(2,1,2)
% title('FFT Individuo 107 baseClosed Delta(0,5-4Hz)')
% hold on
for i=1:3
    mag = abs(fftbaseClosed_delta(i,(80:160)));
    plot(mag)
    if(y_max<max(mag))
        y_max = max(mag); 
    end
end
axis([1 50 0 y_max])
legend('Fp1 open','Fpz open','Fp2 open','Fp1 closed','Fpz closed','Fp2 closed')
ylabel('Magnitude(µV)','FontSize',12)
xlabel('Frequência(Hz)','FontSize',12)
hold off

%% Plota FFT sinais 3 eletrodos (22-24) filtrados em TETHA 4-8Hz 
figure
% subplot(2,1,1)
title('FFT Individuo 107 baseOpen baseClosed Tetha(4-8Hz)')
hold on
for i=1:3
    mag = abs(fftbaseOpen_tetha(i,(80:160)));
    plot(mag,':')
    if(y_max<max(mag))
        y_max = max(mag); 
    end
end
axis([1 50 0 y_max])
legend('Fp1 open','Fpz open','Fp2 open')
% hold off

% subplot(2,1,2)
% title('FFT Individuo 107 baseClosed Tetha(4-8Hz)')
% hold on
for i=1:3
    mag = abs(fftbaseClosed_tetha(i,(80:160)));
    plot(mag)
    if(y_max<max(mag))
        y_max = max(mag); 
    end
end
axis([1 50 0 y_max])
legend('Fp1 open','Fpz open','Fp2 open','Fp1 closed','Fpz closed','Fp2 closed')
ylabel('Magnitude(µV)','FontSize',12)
xlabel('Frequência(Hz)','FontSize',12)
hold off

%% Plota FFT sinais 3 eletrodos (22-24) filtrados em ALPHA 8-13Hz 
figure
% subplot(2,1,1)
title('FFT Individuo 107 baseOpen baseClosed Alpha(8-13Hz)')
hold on
for i=1:3
    mag = abs(fftbaseOpen_alpha(i,80:160));
    plot(mag,':')
    if(y_max<max(mag))
        y_max = max(mag); 
    end
end
axis([1 50 0 y_max])
% legend('Fp1 open','Fpz open','Fp2 open')
% hold off

% subplot(2,1,2)
% title('FFT Individuo 107 baseClosed Alpha(8-13Hz)')
% hold on
for i=1:3
    mag = abs(fftbaseClosed_alpha(i,80:160));
    plot(mag)
    if(y_max<max(mag))
        y_max = max(mag); 
    end
end
axis([1 50 0 y_max])
legend('Fp1 open','Fpz open','Fp2 open','Fp1 closed','Fpz closed','Fp2 closed')
ylabel('Magnitude(µV)','FontSize',12)
xlabel('Frequência(Hz)','FontSize',12)
hold off

%% Plota FFT sinais 3 eletrodos (22-24) filtrados em BETA 13-30Hz 
figure
% subplot(2,1,1)
title('FFT Individuo 107 baseOpen baseClosed Beta(13-30Hz)')
hold on
for i=1:3
    mag = abs(fftbaseOpen_beta(i,80:160));
    plot(mag,':')
    if(y_max<max(mag))
        y_max = max(mag); 
    end
end
axis([1 50 0 y_max])
% legend('Fp1 open','Fpz open','Fp2 open')
% hold off

% subplot(2,1,2)
% title('FFT Individuo 107 baseClosed Beta(13-30Hz)')
% hold on
for i=1:3
    mag = abs(fftbaseClosed_beta(i,80:160));
    plot(mag)
    if(y_max<max(mag))
        y_max = max(mag); 
    end
end
axis([1 50 0 y_max])
legend('Fp1 open','Fpz open','Fp2 open','Fp1 closed','Fpz closed','Fp2 closed')
ylabel('Magnitude(µV)','FontSize',12)
xlabel('Frequência(Hz)','FontSize',12)
hold off

%% Plota FFT sinais 3 eletrodos (22-24) filtrados em GAMA 30-60Hz 
% figure
% subplot(2,1,1)
% title('FFT Individuo 107 baseOpen Gama(30-60Hz)')
% hold on
% for i=1:3
%     plot((1:length(fftbaseOpen_gama)),abs(fftbaseOpen_gama(i,:)));
% end
% % axis([0 160 0 1500])
% legend('Fp1','Fpz','Fp2')
% hold off
% 
% subplot(2,1,2)
% title('FFT Individuo 107 baseClosed Gama(30-60Hz)')
% hold on
% for i=1:3
%     plot((1:length(fftbaseClosed_gama)),abs(fftbaseClosed_gama(i,:)));
% end
% % axis([0 160 0 1500])
% legend('Fp1','Fpz','Fp2')
% hold off

%% FFT SINAIS BIPOLARES ELETRODOS FRONTAIS - DELTA
y_max = max(abs(fftbaseOpen_Fp1_F3));

% baseOpen
figure
hold on
plot(abs(fftbaseOpen_Fp1_F3(80:160)));
% plot(abs(fftbaseOpen_F3_C3(80:160)));
plot(abs(fftbaseOpen_Fp2_F4(80:160)));
% plot(abs(fftbaseOpen_F4_C4(80:160)));
% hold off
axis([1 50 0 y_max+100])
% legend('Fp1-F3','','F3-C3','','Fp2-F4','','F4-C4','')
% title('FFT Individuo 7 BaseOpen(0,5-4Hz)')

% baseClosed
% figure
% hold on
plot(abs(fftbaseClosed_Fp1_F3(80:160)));
% plot(abs(fftbaseClosed_F3_C3(80:160)));
plot(abs(fftbaseClosed_Fp2_F4(80:160)));
% plot(abs(fftbaseClosed_F4_C4(80:160)));
hold off
axis([1 50 0 y_max+100])
legend('Fp1-F3 open','Fp2-F4 open','Fp1-F3 closed','Fp2-F4 closed')
title('FFT Individuo 7 Delta(0,5-4Hz)')