if exist(['workspaces/ind' indNo '_state' stateNo '.mat'], 'file') == 2
    load(['workspaces/ind' indNo '_state' stateNo '.mat']);
else
    run tratamento_thais.m;
end

clear avgPLeft avgPRight thresholdP baseline_filt baselinePeak ...
    blink lastEndBlink closedFrequency startBlink endBlink blinkInterval P S T F resultTable;