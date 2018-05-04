[strBase, baseline] = readEDF(['databases/S' indNo 'R' stateNo '.edf']); %state (02: closed, 01: open)

baseline = cell2mat(baseline)';
labels = strrep(strBase.labels,'.','');
clear strBase;

%% FILTRAGENS
for i=1:64 
    % 0,5-30Hz
    baseline(i,:) = filt0_30(baseline(i,:));
    baseClosed(i,:) = filt0_30(baseClosed(i,:));
    
    if ~identificacao
        % BANDAS
        baseOpen_delta(i,:) = filtdelta(baseline(i,(1:9600)));
        baseClosed_delta(i,:) = filtdelta(baseClosed(i,(1:9600)));

        baseOpen_theta(i,:) = filttheta(baseline(i,(1:9600)));
        baseClosed_theta(i,:) = filttheta(baseClosed(i,(1:9600)));

        baseOpen_alpha(i,:) = filtalpha(baseline(i,(1:9600)));
        baseClosed_alpha(i,:) = filtalpha(baseClosed(i,(1:9600)));

        baseOpen_beta(i,:) = filtbeta(baseline(i,(1:9600)));
        baseClosed_beta(i,:) = filtbeta(baseClosed(i,(1:9600)));
    end
end

%% An�lise bipolar eletrodos Frontais (Anterior-posterior bipolar montage)
% Fp1 - 22      F3 - 32     C3 - 9      O1 - 61
% Fp2 - 24      F4 - 36     C4 - 13     O2 - 53

%Left Parasigittal Open
baseOpen_bip(6,:) = baseline(32,1:9600)-baseline(22,1:9600); %F3 - Fp1
baseOpen_bip(5,:) = baseline(9,1:9600)-baseline(32,1:9600); %C3 - F3
baseOpen_bip(4,:) = baseline(49,1:9600)-baseline(9,1:9600); %P3 - C3

%Right Parasagittal Open
baseOpen_bip(3,:) = baseline(36,1:9600)-baseline(24,1:9600); %F4 - Fp2
baseOpen_bip(2,:) = baseline(13,1:9600)-baseline(36,1:9600); %C4 - F4
baseOpen_bip(1,:) = baseline(53,1:9600)-baseline(13,1:9600); %P4 - C4

if ~identificacao
    %Left Parasigittal Closed
    baseClosed_bip(6,:) = baseClosed(32,1:9600)-baseClosed(22,i); %F3 - Fp1
    baseClosed_bip(5,:) = baseClosed(9,1:9600)-baseClosed(32,i); %C3 - F3
    baseClosed_bip(4,:) = baseClosed(49,1:9600)-baseClosed(9,i); %P3 - C3

    %Right Parasagittal Closed
    baseClosed_bip(3,:) = baseClosed(36,1:9600)-baseClosed(24,1:9600); %F4 - Fp2
    baseClosed_bip(2,:) = baseClosed(13,1:9600)-baseClosed(36,1:9600); %C4 - F4
    baseClosed_bip(1,:) = baseClosed(53,1:9600)-baseClosed(13,1:9600); %P4 - C4
end

save(['workspaces/ind' indNo '_state' stateNo]);