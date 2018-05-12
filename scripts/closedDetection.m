function closedFreq = closedDetection(baselineLeft, baselineRight, lastBlink, now)
    %{
    baselineLeft = baseline_bip(1,:);
    baselineRight = baseline_bip(4,:);
    %}
    [S,F,T,Pl] = spectrogram(baselineLeft,64,32,160,160,'yaxis');
    [S,F,T,Pr] = spectrogram(baselineRight,64,32,160,160,'yaxis');
    
    freqL = 6; freqR = 6; closedFreq = 0;
    avgLeft = mean(Pl(6,:));
    avgRight = mean(Pr(6,:));

    for i = 4:length(Pl(:,1))  
        if mean(Pl(i,:)) > avgLeft
            avgLeft = mean(Pl(i,:));
            freqL = i;
        end

        if mean(Pr(i,:)) > avgRight
            avgRight = mean(Pr(i,:));
            freqR = i;
        end
    end

    closedFreq = max([freqL freqR]);
end