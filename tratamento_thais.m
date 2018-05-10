[strBase,baseline] = readEDF(['databases/S' indNo 'R' stateNo '.edf']); %state (02: closed, 01: open)

baseline = cell2mat(baseline)';
labels = strrep(strBase.labels,'.','');
clear strBase;

%% FILTRAGENS
for i=1:64 
    baseline(i,:) = filt0_30(baseline(i,:));
end

%% Análise bipolar eletrodos Frontais (Anterior-posterior bipolar montage)
% Fp1 - 22      F3 - 32     C3 - 9     P3 - 49
% Fp2 - 24      F4 - 36     C4 - 13    P4 - 53

%Left Parasigittal Open
baseline_bip(6,:) = baseline(32,1:9600)-baseline(22,1:9600); %F3 - Fp1
baseline_bip(5,:) = baseline(9,1:9600)-baseline(32,1:9600); %C3 - F3
baseline_bip(4,:) = baseline(49,1:9600)-baseline(9,1:9600); %P3 - C3

%Right Parasagittal Open
baseline_bip(3,:) = baseline(36,1:9600)-baseline(24,1:9600); %F4 - Fp2
baseline_bip(2,:) = baseline(13,1:9600)-baseline(36,1:9600); %C4 - F4
baseline_bip(1,:) = baseline(53,1:9600)-baseline(13,1:9600); %P4 - C4


save(['workspaces/ind' indNo '_state' stateNo]);