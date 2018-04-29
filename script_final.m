close all; clear all; clc;
addpath('./scripts'); %permite carregar as funções contidas nessa pasta
set(0, 'DefaultFigureWindowStyle', 'docked')
indNos = {'001' '002' '003' '004' '005' '006' '007' '008' '009' '010' '011' '012' '013' '014' '015' '016' '017' '018' '019' '020'};

% Declaração das variáveis
startBlink = zeros(length(indNos));
endBlink = zeros(length(indNos));
result = zeros(length(indNos),5); %[indNo, numberBlinks, minPeak, maxPeak, threshold]

for i=1:length(indNos)
    indNo = indNos{i};
    indNoInt = str2num(indNo);
    run identificacao_piscada.m
    
    result(indNoInt,1) = indNoInt;
    result(indNoInt,2) = find(endBlink(indNoInt,:),1,'last');
    fprintf('Indivíduo %s piscou %s vezes\n', num2str(indNoInt), num2str(result(indNoInt,2)));
end

clear i j axes1 blink S F 

%save 'tcc_result.mat' 'result'