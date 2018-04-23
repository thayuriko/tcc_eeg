%%SUJEITO 1
%{
testados: 109 - 96; 1 - 11

bons:
    109, 107, 105, 104, 102*, 098
    3, 4, 10
ruins:
    108, 106, 103, 101-099, 097, 096
    1, 2, 5-9, 11
%}
clear; clc; close all;

[strBaseOpen, baseOpen] = readEDF('DB2/S107R01.edf'); 
[strBaseClsd, baseClosed] = readEDF('DB2/S107R02.edf');
% [strMove1, mov1] = readEDF('DB2/S003/S003R03.edf');
% [strMove2, mov2] = readEDF('DB2/S003/S003R05.edf');

baseOpen = cell2mat(baseOpen)';
baseOpen_completo = baseOpen;
baseClosed = cell2mat(baseClosed)';
baseClosed_completo = baseClosed;
% mov1 = cell2mat(mov1)';
% mov1_completo = mov1;
% mov2 = cell2mat(mov2)';
% mov2_completo = mov2;

% tgtMov1 = strMove1.annotation.event;
% tgtMov2 = strMove2.annotation.event;
labels = strBaseClsd.labels;

%% FILTRAGEM 0,5-50Hz
for i=1:64 
    baseOpen_filt(i,:) = filt0_50(baseOpen_completo(i,(1:9600)));
    baseClosed_filt(i,:) = filt0_50(baseClosed_completo(i,(1:9600)));
    baseOpen_filt0_60(i,:) = filt0_60(baseOpen_completo(i,(1:9600)));
    baseClosed_filt0_60(i,:) = filt0_60(baseClosed_completo(i,(1:9600)));
%     mov1_filt(i,:) = filt0_50(mov1_completo(i,(1:19200)));
%     mov2_filt(i,:) = filt0_50(mov2_completo(i,(1:19200)));
end
%% FILTRAGEM DELTA 0,5-4Hz
for i=1:64
    baseOpen_delta(i,:) = filtdelta(baseOpen_filt(i,(1:9600)));
    baseClosed_delta(i,:) = filtdelta(baseClosed_filt(i,(1:9600)));
%     mov1_delta(i,:) = filtdelta(mov1_filt(i,(1:19200)));
%     mov2_delta(i,:) = filtdelta(mov2_filt(i,(1:19200)));
end
%% FILTRAGEM TETHA 4-8Hz
for i=1:64
    baseOpen_tetha(i,:) = filttetha(baseOpen_filt(i,(1:9600)));
    baseClosed_tetha(i,:) = filttetha(baseClosed_filt(i,(1:9600)));
%     mov1_tetha(i,:) = filttetha(mov1_filt(i,(1:19200)));
%     mov2_tetha(i,:) = filttetha(mov2_filt(i,(1:19200)));
end
%% FILTRAGEM ALPHA 8-13Hz
for i=1:64 
    baseOpen_alpha(i,:) = filtalpha(baseOpen_filt(i,(1:9600)));
    baseClosed_alpha(i,:) = filtalpha(baseClosed_filt(i,(1:9600)));
%     mov1_alpha(i,:) = filtalpha(mov1_filt(i,(1:19200)));
%     mov2_alpha(i,:) = filtalpha(mov2_filt(i,(1:19200)));
end
%% FILTRAGEM BETA 13-30Hz
for i=1:64 
    baseOpen_beta(i,:) = filtbeta(baseOpen_filt(i,(1:9600)));
    baseClosed_beta(i,:) = filtbeta(baseClosed_filt(i,(1:9600)));
%     mov1_beta(i,:) = filtbeta(mov1_filt(i,(1:19200)));
%     mov2_beta(i,:) = filtbeta(mov2_filt(i,(1:19200)));
end
%% FILTRAGEM GAMA 30-60Hz
% for i=1:64
%     baseOpen_gama(i,:) = filtgama(baseOpen_filt(i,(1:9600)));
%     baseClosed_gama(i,:) = filtgama(baseClosed_filt(i,(1:9600)));
%     mov1_gama(i,:) = filtgama(mov1_filt(i,(1:19200)));
%     mov2_gama(i,:) = filtgama(mov2_filt(i,(1:19200)));
% end

%% ANÁLISE FFTS
for j=1:7
    i=21+j;
    fftbaseOpen_filt(j,:) = fftshift(fft(baseOpen_filt(i,:),160));
    fftbaseClosed_filt(j,:) = fftshift(fft(baseClosed_filt(i,:),160));
%     fftmov1_filt(j,:) = fftshift(fft(mov1_filt(i,:),160));
%     fftmov2_filt(j,:) = fftshift(fft(mov2_filt(i,:),160));
    
    fftbaseOpen_delta(j,:) = fftshift(fft(baseOpen_delta(i,:),160));
    fftbaseClosed_delta(j,:) = fftshift(fft(baseClosed_delta(i,:),160));
%     fftmov1_delta(j,:) = fftshift(fft(mov1_delta(i,:),160));
%     fftmov2_delta(j,:) = fftshift(fft(mov2_delta(i,:),160));
    
    fftbaseOpen_tetha(j,:) = fftshift(fft(baseOpen_tetha(i,:),160));
    fftbaseClosed_tetha(j,:) = fftshift(fft(baseClosed_tetha(i,:),160));
%     fftmov1_tetha(j,:) = fftshift(fft(mov1_tetha(i,:),160));
%     fftmov2_tetha(j,:) = fftshift(fft(mov2_tetha(i,:),160));
    
    fftbaseOpen_alpha(j,:) = fftshift(fft(baseOpen_alpha(i,:),160));
    fftbaseClosed_alpha(j,:) = fftshift(fft(baseClosed_alpha(i,:),160));
%     fftmov1_alpha(j,:) = fftshift(fft(mov1_alpha(i,:),160));
%     fftmov2_alpha(j,:) = fftshift(fft(mov2_alpha(i,:),160));
    
    fftbaseOpen_beta(j,:) = fftshift(fft(baseOpen_beta(i,:),160));
    fftbaseClosed_beta(j,:) = fftshift(fft(baseClosed_beta(i,:),160));
%     fftmov1_beta(j,:) = fftshift(fft(mov1_beta(i,:),160));
%     fftmov2_beta(j,:) = fftshift(fft(mov2_beta(i,:),160));
    
%     fftbaseOpen_gama(j,:) = fftshift(fft(baseOpen_gama(i,:),160));
%     fftbaseClosed_gama(j,:) = fftshift(fft(baseClosed_gama(i,:),160));
%     fftmov1_gama(j,:) = fftshift(fft(mov1_gama(i,:),160));
%     fftmov2_gama(j,:) = fftshift(fft(mov2_gama(i,:),160));
end

%% Análise bipolar eletrodos Frontais - DELTA (Anterior-posterior bipolar montage)
% Fp1 - 22      F3 - 32     C3 - 9
% Fp2 - 24      F4 - 36     C4 - 13
for i=1:64 
    baseOpen_filt0_60(i,:) = filt0_30(baseOpen_completo(i,(1:9600)));
    baseClosed_filt0_60(i,:) = filt0_30(baseClosed_completo(i,(1:9600)));
end

for p=1:9600
    %Left Parasigittal Open
    baseOpen_Fp1_F3(1,p) = -baseOpen_filt0_60(22,p)+baseOpen_filt0_60(32,p);
    baseOpen_F3_C3(1,p) = -baseOpen_filt0_60(32,p)+baseOpen_filt0_60(9,p);
    baseOpen_C3_P3(1,p) = -baseOpen_filt0_60(9,p)+baseOpen_filt0_60(49,p);
    baseOpen_P3_O1(1,p) = -baseOpen_filt0_60(49,p)+baseOpen_filt0_60(61,p);
    
    %Midline Open
%     baseOpen_Fz_Cz(1,p) = baseOpen_filt0_30(34,p)-baseOpen_filt0_30(11,p);
%     baseOpen_Cz_Pz(1,p) = baseOpen_filt0_30(11,p)-baseOpen_filt0_30(51,p);
    
    %Right Parasagittal Open
    baseOpen_Fp2_F4(1,p) = -baseOpen_filt0_60(24,p)+baseOpen_filt0_60(36,p);
    baseOpen_F4_C4(1,p) = -baseOpen_filt0_60(36,p)+baseOpen_filt0_60(13,p);
    baseOpen_C4_P4(1,p) = -baseOpen_filt0_60(13,p)+baseOpen_filt0_60(53,p);
    baseOpen_P4_O2(1,p) = -baseOpen_filt0_60(53,p)+baseOpen_filt0_60(63,p);
    
    %Left Parasigittal Closed
    baseClosed_Fp1_F3(1,p) = -baseClosed_filt0_60(22,p)+baseClosed_filt0_60(32,p);
    baseClosed_F3_C3(1,p) = -baseClosed_filt0_60(32,p)+baseClosed_filt0_60(9,p);
    baseClosed_C3_P3(1,p) = -baseClosed_filt0_60(9,p)+baseClosed_filt0_60(49,p);
    baseClosed_P3_O1(1,p) = -baseClosed_filt0_60(49,p)+baseClosed_filt0_60(61,p);
    
    %Midline Open
    baseClosed_Fz_Cz(1,p) = -baseClosed_filt0_60(34,p)+baseClosed_filt0_60(11,p);
    baseClosed_Cz_Pz(1,p) = -baseClosed_filt0_60(11,p)+baseClosed_filt0_60(51,p);
    
    %Right Parasagittal Open
    baseClosed_Fp2_F4(1,p) = -baseClosed_filt0_60(24,p)+baseClosed_filt0_60(36,p);
    baseClosed_F4_C4(1,p) = -baseClosed_filt0_60(36,p)+baseClosed_filt0_60(13,p);
    baseClosed_C4_P4(1,p) = -baseClosed_filt0_60(13,p)+baseClosed_filt0_60(53,p);
    baseClosed_P4_O2(1,p) = -baseClosed_filt0_60(53,p)+baseClosed_filt0_60(63,p);
end  
%baseOpen_bip = [baseOpen_P4_O2;baseOpen_C4_P4;baseOpen_F4_C4;baseOpen_Fp2_F4];
baseOpen_bip = [baseOpen_C4_P4;baseOpen_F4_C4;baseOpen_Fp2_F4];
% baseOpen_bip = [baseOpen_F4_C4;baseOpen_Fp2_F4];
% baseOpen_bip = [baseOpen_bip;baseOpen_Cz_Pz;baseOpen_Fz_Cz];
%baseOpen_bip = [baseOpen_bip;baseOpen_P3_O1;baseOpen_C3_P3;baseOpen_F3_C3;baseOpen_Fp1_F3];
baseOpen_bip = [baseOpen_bip;baseOpen_C3_P3;baseOpen_F3_C3;baseOpen_Fp1_F3];
% baseOpen_bip = [baseOpen_bip;baseOpen_F3_C3;baseOpen_Fp1_F3];

%baseClosed_bip = [baseClosed_P4_O2;baseClosed_C4_P4;baseClosed_F4_C4;baseClosed_Fp2_F4];
baseClosed_bip = [baseClosed_C4_P4;baseClosed_F4_C4;baseClosed_Fp2_F4];
% baseClosed_bip = [baseClosed_F4_C4;baseClosed_Fp2_F4];
% baseClosed_bip = [baseClosed_bip;baseClosed_Cz_Pz;baseClosed_Fz_Cz];
%baseClosed_bip = [baseClosed_bip;baseClosed_P3_O1;baseClosed_C3_P3;baseClosed_F3_C3;baseClosed_Fp1_F3];
baseClosed_bip = [baseClosed_bip;baseClosed_C3_P3;baseClosed_F3_C3;baseClosed_Fp1_F3];
% baseClosed_bip = [baseClosed_bip;baseClosed_F3_C3;baseOpen_Fp1_F3];

%Filtra em delta
for i=1:6
    baseOpen_bip_delta(i,:) = filtdelta(baseOpen_bip(i,:));
    baseClosed_bip_delta(i,:) = filtdelta(baseClosed_bip(i,:));
end

% FFT
fftbaseOpen_Fp1_F3 = fftshift(fft(baseOpen_Fp1_F3(1,:),160));
fftbaseOpen_F3_C3 = fftshift(fft(baseOpen_F3_C3(1,:),160));
fftbaseClosed_Fp1_F3 = fftshift(fft(baseClosed_Fp1_F3(1,:),160));
fftbaseClosed_F3_C3 = fftshift(fft(baseClosed_F3_C3(1,:),160));

fftbaseOpen_Fp2_F4 = fftshift(fft(baseOpen_Fp2_F4(1,:),160));
fftbaseOpen_F4_C4 = fftshift(fft(baseOpen_F4_C4(1,:),160));
fftbaseClosed_Fp2_F4 = fftshift(fft(baseClosed_Fp2_F4(1,:),160));
fftbaseClosed_F4_C4 = fftshift(fft(baseClosed_F4_C4(1,:),160));


