close all; clear all; clc;
addpath('./scripts'); %permite carregar as funções contidas nessa pasta
set(0, 'DefaultFigureWindowStyle', 'docked')
indNos = {'002'};% '002' '003' '004' '005' '006' '007' '008' '009' '010' '011' '012' '013' '014' '015' '016' '017' '018' '019' '020'};

% Declaração das variáveis
startBlink = zeros(length(indNos));
endBlink = zeros(length(indNos));
eyeStateClosed = zeros(4); %[from, to, duration]
result = zeros(length(indNos),5); %[indNo, numberBlinks, minPeak, maxPeak, threshold]
identificacao = 1;

indNo = indNos{1};
indNoInt = str2num(indNo);

if exist(['workspaces/ind' indNo '.mat'], 'file') == 2
    load(['workspaces/ind' indNo '.mat']);
else
    run tratamento_thais.m;
end

clear baseOpen baseClosed;
clear baseOpen_theta baseOpen_delta baseOpen_alpha baseOpen_beta; 
clear baseClosed_theta baseClosed_delta baseClosed_alpha baseClosed_beta;
clear j S T F P xSpacing axes1 tempo identificacao;

baselineLeft = baseOpen_bip(1,(1:9600));
baselineRight = baseOpen_bip(4,(1:9600));
lastBlink = 1;
now = 60;

[S,F,T,Pl] = spectrogram(baseOpen_bip(1,(1:9600)),64,32,160,160,'yaxis');
[S,F,T,Pr] = spectrogram(baseOpen_bip(4,(1:9600)),64,32,160,160,'yaxis');

figure; spectrogram(baselineLeft,64,32,160,160,'yaxis');
freqL = 0; freqR = 0; isClosed = 0;
avgLeft = mean(Pl(1,lastBlink*3:now*3));
avgRight = mean(Pr(1,lastBlink*3:now*3));

for i = 2:length(Pl(:,1))  
    if mean(Pl(i,lastBlink*3:now*3)) > avgLeft
        avgLeft = mean(Pl(i,:));
        freqL = i;
    end

    if mean(Pr(i,lastBlink*3:now*3)) > avgRight
        avgRight = mean(Pr(i,:));
        freqR = i;
    end
end

if (freqL >= 8)&&(freqL <= 13)
    if (freqR >= 8)&&(freqR <= 13)
        isClosed = 1;
    end
end