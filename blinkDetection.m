%{
    P4 - C4;   C4 - F4;    F4 - Fp2;    //1     2     3
    P3 - C3;   C3 - F3;    F3 - Fp1     //4     5     6
%}

if exist(['workspaces/ind' indNo '_state' stateNo '.mat'], 'file') == 2
    load(['workspaces/ind' indNo '_state' stateNo '.mat']);
else
    run tratamento_thais.m;
end

startBlink = zeros(length(indNos));
endBlink = zeros(length(indNos));


% Filtragem passa-banda
baseline_filt(1,:) = filtdelta(baseline_bip(3,:));
baseline_filt(2,:) = filtdelta(baseline_bip(6,:));


% Determinação do limiar de decisão de piscada
[S,F,T,P] = spectrogram(baseline_filt(1,:),120,60,160,160,'yaxis'); %sinal, 2*fmax, fmax, Nfft, fs
avgPLeft = mean(P);

[S,F,T,P] = spectrogram(baseline_filt(2,:),120,60,160,160,'yaxis'); %sinal, 2*fmax, fmax, Nfft, fs
avgPRight = mean(P);

baselinePeak = max(max(baseline_filt));

if BLINK_PLOTS
    %run plotBlink.m
end
%% Algoritmo de Identificação de Piscadas e Olhos Fechados
j = 1; blink = 0;

if baselinePeak > 100
    if mean(avgPRight) < mean(avgPLeft)
        thresholdP = (max(avgPRight) - mean(avgPRight))/8;
    else
        thresholdP = (max(avgPLeft) - mean(avgPLeft))/8;
    end

    for i=1:length(P)
        if (avgPRight(i) > thresholdP) && (avgPLeft(i) > thresholdP)
            if ~blink       %flag para detecção da piscada
                startBlink(indNoInt,j) = T(i);
                blink = 1;

                if j == 1
                    lastEndBlink = 0;
                else
                    lastEndBlink = endBlink(indNoInt,j-1);
                end

                blinkInterval = startBlink(indNoInt,j) - lastEndBlink;
            end
        else
            if blink
                blink = 0;
                endBlink(indNoInt,j) = T(i);
                j = j + 1;
            end
        end
    end
else
    closedFreq = closedDetection(baseline_bip(1,:), baseline_bip(4,:), 60, 1);
    
    if closedFreq > 0
        resultTable(indNoInt,7) = 1;
    end
    
    resultTable(indNoInt,8) = closedFreq;
end

% Registro dos parâmetros na matriz
%[indNo, isBlinking?, numberBlinks, minPeak, maxPeak, threshold, isClosed?, closedFrequency]
if baselinePeak > 100
    resultTable(indNoInt,2) = 1;
    resultTable(indNoInt,4) = min(min(baseline_filt));
    resultTable(indNoInt,5) = max(max(baseline_filt));
    resultTable(indNoInt,6) = thresholdP;
else
    resultTable(indNoInt,2:6) = 0;
end