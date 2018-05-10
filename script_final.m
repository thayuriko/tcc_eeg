close all; clear all; clc;
addpath('./scripts');

% Defines
BLINK_DETECTION = true; %(resultados)
PRINT_FIGS = false; %(salva os plots)
BLINK_PLOTS = false; %plot do resultado da identificação

indNos = {'001' '002' '003' '004' '005' '006' '007' '008' '009' '010' ...
    '011' '012' '013' '014' '015' '016' '017' '018' '019' '020'};
%stateNo = '01'; %(open: 01; closed: 02)

% Declaração das variáveis
%[indNo, isBlinking?, numberBlinks, minPeak, maxPeak, threshold, isClosed?, closedFrequency]
resultTable = zeros(length(indNos),8);

for k=1:2
    if k==1
        stateNo = '01';
    else
        stateNo = '02';
    end
    
    for i=1:length(indNos)
        indNo = indNos{i};
        indNoInt = str2num(indNo);
        run blinkDetection.m

        %{
        if (indNoInt == 1) && ~PRINT_FIGS
            run plot_tempo_bipolar.m
        end
        %}

        resultTable(indNoInt,1) = indNoInt;
        if baselinePeak > 100
            resultTable(indNoInt,3) = find(endBlink(indNoInt,:),1,'last');
            fprintf('Indivíduo %s piscou %s vezes\n', num2str(indNoInt), num2str(resultTable(indNoInt,3)));
        end
        
        %clear avgPLeft avgPRight baseline_filt baselinePeak blink closedFrequency endBlink F blinkInterval lastEndBlink P S T startBlink thresholdP;
    end
end

close all; 

save 'tcc_result.mat' 'resultTable'