[strBaseClsd, baseOpen] = readEDF(['databases/S' indNo 'R01.edf']);
[strBaseClsd, baseClosed] = readEDF(['databases/S' indNo 'R02.edf']);

baseOpen = cell2mat(baseOpen)';
baseClosed = cell2mat(baseClosed)';
labels = strrep(strBaseClsd.labels,'.','');
clear strBaseClsd;

%% FILTRAGENS
for i=1:64 
    % 0,5-30Hz
    baseOpen(i,:) = filt0_30(baseOpen(i,:));
    baseClosed(i,:) = filt0_30(baseClosed(i,:));

    % BANDAS
    baseOpen_delta(i,:) = filtdelta(baseOpen(i,(1:9600)));
    baseClosed_delta(i,:) = filtdelta(baseClosed(i,(1:9600)));
    
    baseOpen_theta(i,:) = filttheta(baseOpen(i,(1:9600)));
    baseClosed_theta(i,:) = filttheta(baseClosed(i,(1:9600)));
    
    baseOpen_alpha(i,:) = filtalpha(baseOpen(i,(1:9600)));
    baseClosed_alpha(i,:) = filtalpha(baseClosed(i,(1:9600)));
    
    baseOpen_beta(i,:) = filtbeta(baseOpen(i,(1:9600)));
    baseClosed_beta(i,:) = filtbeta(baseClosed(i,(1:9600)));
end

%% Análise bipolar eletrodos Frontais (Anterior-posterior bipolar montage)
% Fp1 - 22      F3 - 32     C3 - 9      O1 - 61
% Fp2 - 24      F4 - 36     C4 - 13     O2 - 53

for i=1:9600
    %Left Parasigittal Open
    baseOpen_bip(6,i) = baseOpen(32,i)-baseOpen(22,i); %F3 - Fp1
    baseOpen_bip(5,i) = baseOpen(9,i)-baseOpen(32,i); %C3 - F3
    baseOpen_bip(4,i) = baseOpen(49,i)-baseOpen(9,i); %P3 - C3
    %baseOpen_bip(1,p) = baseOpen(61,p)-baseOpen(49,p); %O1 - P3
    
    %Right Parasagittal Open
    baseOpen_bip(3,i) = baseOpen(36,i)-baseOpen(24,i); %F4 - Fp2
    baseOpen_bip(2,i) = baseOpen(13,i)-baseOpen(36,i); %C4 - F4
    baseOpen_bip(1,i) = baseOpen(53,i)-baseOpen(13,i); %P4 - C4
    %baseOpen_bip(1,p) = baseOpen(63,p)-baseOpen(53,p); %O2 - P4
    
    %Left Parasigittal Closed
    baseClosed_bip(6,i) = baseClosed(32,i)-baseClosed(22,i); %F3 - Fp1
    baseClosed_bip(5,i) = baseClosed(9,i)-baseClosed(32,i); %C3 - F3
    baseClosed_bip(4,i) = baseClosed(49,i)-baseClosed(9,i); %P3 - C3
    %baseClosed_bip(1,p) = baseClosed(61,p)-baseClosed(49,p); %O1 - P3
    
    %Right Parasagittal Closed
    baseClosed_bip(3,i) = baseClosed(36,i)-baseClosed(24,i); %F4 - Fp2
    baseClosed_bip(2,i) = baseClosed(13,i)-baseClosed(36,i); %C4 - F4
    baseClosed_bip(1,i) = baseClosed(53,i)-baseClosed(13,i); %P4 - C4
    %baseClosed_bip(1,p) = baseClosed(63,p)-baseClosed(53,p); %O2 - P4
end  

clear i;

save(['workspaces/ind' indNo]);