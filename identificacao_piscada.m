%{
ruins: 2, 3, 5
testados: 1 - 9

[   P4 - C4;   C4 - F4;    F4 - Fp2;    //1     2     3
    P3 - C3;   C3 - F3;    F3 - Fp1     //4     5     6
%}

if exist(['workspaces/ind' indNo '.mat'], 'file') == 2
    load(['workspaces/ind' indNo '.mat']);
else
    run tratamento_thais.m;
end

clear baseOpen baseClosed;
clear baseOpen_theta baseOpen_delta baseOpen_alpha baseOpen_beta; 
clear baseClosed_theta baseClosed_delta baseClosed_alpha baseClosed_beta;

for i=1:6 
    % BANDAS
    baseOpen_delta(i,:) = filtdelta(baseOpen_bip(i,(1:9600)));
    baseClosed_delta(i,:) = filtdelta(baseClosed_bip(i,(1:9600)));
    
    baseOpen_theta(i,:) = filttheta(baseOpen_bip(i,(1:9600)));
    baseClosed_theta(i,:) = filttheta(baseClosed_bip(i,(1:9600)));
    
    baseOpen_alpha(i,:) = filtalpha(baseOpen_bip(i,(1:9600)));
    baseClosed_alpha(i,:) = filtalpha(baseClosed_bip(i,(1:9600)));
    
    baseOpen_beta(i,:) = filtbeta(baseOpen_bip(i,(1:9600)));
    baseClosed_beta(i,:) = filtbeta(baseClosed_bip(i,(1:9600)));
end

[S,F,T,P] = spectrogram(baseOpen_delta(3,:),120,60,160,160,'yaxis'); %sinal, 2*fmax, fmax, Nfft, fs
avgPLeft = mean(P);

[S,F,T,P] = spectrogram(baseOpen_delta(6,:),120,60,160,160,'yaxis'); %sinal, 2*fmax, fmax, Nfft, fs
avgPRight = mean(P);

if mean(avgPRight) < mean (avgPLeft)
    avgOpen = (max(avgPRight) - mean(avgPRight))/8;
else
    avgOpen = (max(avgPLeft) - mean(avgPLeft))/8;
end

result(indNoInt,3) = min([baseOpen_delta(3,:) baseOpen_delta(6,:)]);
result(indNoInt,4) = max([baseOpen_delta(3,:) baseOpen_delta(6,:)]);
result(indNoInt,5) = avgOpen;

run plot_piscadas.m

%% Identificação
j = 1;
blink = 0;

for i=1:length(P)
    if (avgPRight(i) > avgOpen) && (avgPLeft(i) > avgOpen)
        if ~blink                   %flag que indica se acabou a piscada
            startBlink(indNoInt,j) = T(i);
            blink = 1;
        end
    else
        if blink
            blink = 0;
            endBlink(indNoInt,j) = T(i);
            j = j + 1;
        end
    end
end