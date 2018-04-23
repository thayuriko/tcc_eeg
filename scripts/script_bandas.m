clear baseOpen_delta, clear baseClosed_delta;
clear baseOpen_theta; clear baseClosed_theta;
clear baseOpen_alpha; clear baseClosed_alpha;
clear baseOpen_beta; clear baseClosed_beta;

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
%%
set(0, 'DefaultFigureWindowStyle', 'normal')
plotBipolarBand(printFigure, baseOpen_alpha, baseClosed_alpha, 'alpha', indNo);
plotBipolarBand(printFigure, baseOpen_beta, baseClosed_beta, 'beta', indNo);
plotBipolarBand(printFigure, baseOpen_delta, baseClosed_delta, 'delta', indNo);
plotBipolarBand(printFigure, baseOpen_theta, baseClosed_theta, 'theta', indNo);