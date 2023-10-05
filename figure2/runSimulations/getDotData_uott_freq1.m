

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TEST1
% Temporal
clear all

display('Test 1')
tic
k = 1e-1;

hstar = [0.125e-2, 0.125e-2, 0.125e-2];

AmpIDStart = 0;

createManyDotPlots_uott_freq1
cpuTest1 = toc;

save('freq1ANTIproba5D1m14a80_60lratio15dotPlot1_h0125_e2.mat')

clearvars -except AmpIDStart

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TEST2
%% Temporal
display('Test 2')
tic
k = 0.5e-1;

hstar = [0.125e-2, 0.125e-2, 0.125e-2];

createManyDotPlots_uott_freq1
cpuTest2 = toc;

save('freq1ANTIproba5D1m14a80_60lratio15dotPlot2_h0125_e2.mat')

clearvars -except AmpIDStart

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TEST3
%% Temporal
display('Test 3')
tic
k = 0.1e-1;

hstar = [0.125e-2, 0.125e-2, 0.125e-2];

createManyDotPlots_uott_freq1

cpuTest3 = toc;

save('freq1ANTIproba5D1m14a80_60lratio15dotPlot3_h0125_e2.mat')

clearvars -except AmpIDStart

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TEST4
%% Temporal
display('Test 4')
tic
k = 0.5e-2;

hstar = [0.125e-2, 0.125e-2, 0.125e-2];

createManyDotPlots_uott_freq1
cpuTest4 = toc;

save('freq1ANTIproba5D1m14a80_60lratio15dotPlot4_h0125_e2.mat')

clearvars -except AmpIDStart


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TEST5
%% Temporal
display('Test 5')
tic
k = 0.1e-2;

hstar = [0.125e-2, 0.125e-2, 0.125e-2];

createManyDotPlots_uott_freq1
cpuTest5 = toc;

save('freq1ANTIproba5D1m14a80_60lratio15dotPlot5_h0125_e2.mat')

clearvars -except AmpIDStart

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TEST6
%% Temporal
display('Test 6')
tic
k = 0.5e-3;

hstar = [0.125e-2, 0.125e-2, 0.125e-2];

createManyDotPlots_uott_freq1
cpuTest6 = toc;

save('freq1ANTIproba5D1m14a80_60lratio15dotPlot6_h0125_e2.mat')

clearvars -except AmpIDStart

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TEST7
%% Temporal
display('Test 7')
tic
k = 0.1e-3;

hstar = [0.625e-3, 0.625e-3, 0.625e-3];

createManyDotPlots_uott_freq1
cpuTest7 = toc;

save('freq1ANTIproba5D1m14a80_60lratio15dotPlot7_h0625_e3.mat')

clearvars -except AmpIDStart
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TEST8
display('Test 8')
%% Temporal
tic
k = 0.5e-4;

hstar = [0.3125e-3, 0.3125e-3, 0.3125e-3];

createManyDotPlots_uott_freq1
cpuTest8 = toc;

save('freq1ANTIproba5D1m14a80_60lratio15dotPlot7_h03125_e3.mat')

clearvars -except AmpIDStart
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TEST9
% display('Test 9')
% %% Temporal
% tic
% k = 0.390625e-3;
% 
% hstar = [0.1953125e-4, 0.1953125e-3, 0.1953125e-3];
% 
% createManyDotPlots_uott
% cpuTest9 = toc;
% 
% save('freq2dotPlot9AntiPhase')
% 
% clearvars -except AmpIDStart
