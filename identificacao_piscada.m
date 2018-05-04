%{
    P4 - C4;   C4 - F4;    F4 - Fp2;    //1     2     3
    P3 - C3;   C3 - F3;    F3 - Fp1     //4     5     6
%}

BLINK_INTERVAL = 20;

if exist(['workspaces/ind' indNo '.mat'], 'file') == 2
    load(['workspaces/ind' indNo '.mat']);
else
    run tratamento_thais.m;
end

clear baseOpen baseClosed;
clear baseOpen_theta baseOpen_delta baseOpen_alpha baseOpen_beta; 
clear baseClosed_theta baseClosed_delta baseClosed_alpha baseClosed_beta;
clear j S T F P xSpacing axes1 tempo identificacao;

% Filtragem na banda
baseOpen_delta(1,:) = filtdelta(baseOpen_bip(3,(1:9600)));
baseOpen_delta(2,:) = filtdelta(baseOpen_bip(6,(1:9600)));

% Determinação do limiar de decisão de piscada
[S,F,T,P] = spectrogram(baseOpen_delta(1,:),120,60,160,160,'yaxis'); %sinal, 2*fmax, fmax, Nfft, fs
avgPLeft = mean(P);

[S,F,T,P] = spectrogram(baseOpen_delta(2,:),120,60,160,160,'yaxis'); %sinal, 2*fmax, fmax, Nfft, fs
avgPRight = mean(P);

if mean(avgPRight) < mean (avgPLeft)
    avgOpen = (max(avgPRight) - mean(avgPRight))/8;
else
    avgOpen = (max(avgPLeft) - mean(avgPLeft))/8;
end

% Registro dos parâmetros na matriz
result(indNoInt,3) = min([baseOpen_delta(1,:) baseOpen_delta(2,:)]);
result(indNoInt,4) = max([baseOpen_delta(1,:) baseOpen_delta(2,:)]);
result(indNoInt,5) = avgOpen;

run plot_piscadas.m

%% Identificação das piscadas
j = 1;
blink = 0;

if result(indNoInt,4) > 100
    for i=1:length(P)
        if (avgPRight(i) > avgOpen) && (avgPLeft(i) > avgOpen)
            if ~blink                   %flag que indica se acabou a piscada
                startBlink(indNoInt,j) = T(i);
                blink = 1;

                if j == 1
                    lastEndBlink = 0;
                else
                    lastEndBlink = endBlink(indNoInt,j-1);
                end

                blinkInterval = startBlink(indNoInt,j) - lastEndBlink;

                if blinkInterval > BLINK_INTERVAL
                    if identifica_fechado(baseOpen_bip(1,(1:9600)), baseOpen_bip(4,(1:9600)), startBlink(indNoInt,j), lastEndBlink)
                        eyeStateClosed(indNoInt,1) = endBlink(indNoInt,j-1);
                        eyeStateClosed(indNoInt,2) = startBlink(indNoInt,j);
                        eyeStateClosed(indNoInt,3) = blinkInterval;
                    end
                end
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
    if identifica_fechado(baseOpen_bip(1,(1:9600)), baseOpen_bip(4,(1:9600)), 60, 1)
        eyeStateClosed(indNoInt,1) = 0;
        eyeStateClosed(indNoInt,2) = 60;
        eyeStateClosed(indNoInt,3) = 60;
    end
end