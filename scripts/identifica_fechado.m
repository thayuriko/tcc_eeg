function isClosed = identifica_fechado(baselineLeft, baselineRight, now, lastBlink)
    [S,F,T,Pl] = spectrogram(baselineLeft,64,32,160,160,'yaxis');
    [S,F,T,Pr] = spectrogram(baselineRight,64,32,160,160,'yaxis');
    
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
end