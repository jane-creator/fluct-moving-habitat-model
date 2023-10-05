% plot A^* and L^* vs c

% load first the approximations of the critical amplitudes - previously
% calculated

load('freq1bisect.mat')

AmpStarBisectFreq1 = AmpStarBisect;

clearvars -except AmpStarBisectFreq1

load('freq4bisect.mat')

AmpStarBisectFreq4 = AmpStarBisect;

clearvars -except AmpStarBisectFreq1 AmpStarBisectFreq4

load('freq1bisectANTI.mat')

AmpStarBisectFreq1_ANTI = AmpStarBisect;

clearvars -except AmpStarBisectFreq1 AmpStarBisectFreq4 AmpStarBisectFreq1_ANTI

load('freq4bisectANTI.mat')

AmpStarBisectFreq4_ANTI = AmpStarBisect;

% for every c calculate corresponding critical patch sizes.

lStarVector = zeros(size(cVector));

for loopID = 1:size(cVector, 2)
    lStarVector(loopID) = criticalPatchSize(cVector(loopID), proba, D, m);
end

% plot the critical amplitudes and critical patch sizes against c

figure(1);
xlabel('average speed of shift', 'FontSize', 16)
hold on
yyaxis left 
plot(cVector, AmpStarBisectFreq1, 'LineWidth', 1.5, ...
    'LineStyle', ':','DisplayName', "\omega = 2\pi, constant patch-size")
plot(cVector, AmpStarBisectFreq4, 'LineWidth', 1.5,...
    'LineStyle', ':','Marker', "o", 'DisplayName', "\omega = \pi/4, constant patch-size")
plot(cVector, AmpStarBisectFreq1_ANTI, 'LineWidth', 1.5, ...
    'LineStyle', '--','DisplayName', "\omega = 2\pi, varying patch-size")
plot(cVector, AmpStarBisectFreq4_ANTI, 'LineWidth', 1.5,...
    'LineStyle', '--','Marker', "o", 'DisplayName', "\omega = \pi/4, varying patch-size")
ylabel('critical amplitude', 'FontSize', 16)

yyaxis right 
plot(cVector, lStarVector, 'LineWidth', 1.5)
ylabel('minimal niche size', 'FontSize', 16)
