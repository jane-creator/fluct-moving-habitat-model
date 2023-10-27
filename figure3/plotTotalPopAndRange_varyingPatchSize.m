% plotTotalPop&Range
load('c5m1Amp4FreqQuarterPi.mat')
% 

Gamma1 = @(myVar) c(1)*myVar + Amp(1)*sin(BP(1)*myVar);
Gamma2 = @(myVar) c(2)*myVar + Amp(3)*sin(BP(3)*myVar) + L(2);

% totalPop
endJ = size(BigU, 2);
totalPop = zeros(1, size(BigU,2));
for j = 1:endJ
    % note the transformation back to the physical frame
    scaledH = H*(Gamma2(sT(j))-Gamma1(sT(j)))/L(2);
    totalPop(j) = trapezoidalRule(scaledH, BigU(2:p+1, j), P);
end
figure(8)
subplot(2,1,1)
hold on
plot(BigU(1,1:end), totalPop, 'LineWidth', 1, ...
    'DisplayName', strcat('Amp = ', num2str(Amp(1)), ', B = ' , num2str(BP(1)), ', c = ', num2str(c(1))),...
    'LineStyle', '-', 'color', [34, 136, 51]/255); % green

%range

range = zeros(1, size(BigU,2));
rangeThreshold = 0.05;
for j = 1:endJ
    % find indices where denisty exceeds the rangeThreshold
    rangeTest = BigU(2:end, j) - rangeThreshold;
    rangeTest = rangeTest > 0;
    rangeID = find(rangeTest);
    % find the length of the range (note the transformation to the physical frame)
    phiy = y*(Gamma2(sT(j))-Gamma1(sT(j)))/L(2) + Gamma1(j);
    range(j) = phiy(rangeID(end)) - phiy(rangeID(1));
end
figure(8)
subplot(2,1,2)
hold on
plot(BigU(1,1:end), range, 'LineWidth', 1, 'DisplayName', strcat('Amp = ', num2str(Amp(1)), ', B = ' , num2str(BP(1)), ', c = ', num2str(c(1))),...
    'LineStyle', '-', 'color', [34, 136, 51]/255); % green

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
load('c1m1Amp4FreqQuarterPi')

Gamma1 = @(myVar) c(1)*myVar + Amp(1)*sin(BP(1)*myVar);
Gamma2 = @(myVar) c(2)*myVar + Amp(3)*sin(BP(3)*myVar) + L(2);

% totalPop
endJ = size(BigU, 2);
totalPop = zeros(1, size(BigU,2));
for j = 1:endJ
    scaledH = H*(Gamma2(sT(j))-Gamma1(sT(j)))/L(2);
    totalPop(j) = trapezoidalRule(scaledH, BigU(2:p+1, j), P);
end
figure(7)
hold on
subplot(2,1,1)
plot(BigU(1,1:end), totalPop, 'LineWidth', 1, ...
    'DisplayName', strcat('Amp = ', num2str(Amp(1)), ', B = ' , num2str(BP(1)), ', c = ', num2str(c(1))),...
    'LineStyle', '-', 'color', [34, 136, 51]/255); % green

%range

range = zeros(1, size(BigU,2));
rangeThreshold = 0.05;
for j = 1:endJ
    % find indices where denisty exceeds the rangeThreshold
    rangeTest = BigU(2:end, j) - rangeThreshold;
    rangeTest = rangeTest > 0;
    rangeID = find(rangeTest);
    % find the length of the range (note the transformation to the physical frame)
    phiy = y*(Gamma2(sT(j))-Gamma1(sT(j)))/L(2) + Gamma1(j);
    range(j) = phiy(rangeID(end)) - phiy(rangeID(1));
end
figure(7)
subplot(2,1,2)
hold on
plot(BigU(1,1:end), range, 'LineWidth', 1, 'DisplayName', strcat('Amp = ', num2str(Amp(1)), ', B = ' , num2str(BP(1)), ', c = ', num2str(c(1))),...
    'LineStyle', '-',  'color', [34, 136, 51]/255); % green

figure(7)
subplot(2,1,1)
xlabel('TIME')
ylabel('TP_{A,\omega}', 'FontSize', 14)

subplot(2,1,2)
xlabel('TIME')
ylabel('R_{A,\omega}', 'FontSize', 14)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('c1m1Amp25Freq2Pi.mat')

Gamma1 = @(myVar) c(1)*myVar + Amp(1)*sin(BP(1)*myVar);
Gamma2 = @(myVar) c(2)*myVar + Amp(3)*sin(BP(3)*myVar) + L(2);

% totalPop
endJ = size(BigU, 2);
totalPop = zeros(1, size(BigU,2));
for j = 1:endJ
    scaledH = H*(Gamma2(sT(j))-Gamma1(sT(j)))/L(2);
    totalPop(j) = trapezoidalRule(scaledH, BigU(2:p+1, j), P);
end
figure(7)
subplot(2,1,1)
hold on
plot(BigU(1,1:end), totalPop, 'LineWidth', 1, ...
    'DisplayName', strcat('Amp = ', num2str(Amp(1)), ', B = ' , num2str(BP(1)), ', c = ', num2str(c(1))),...
    'LineStyle', '-', 'color', [68, 119, 170]/255); % blue

%range

range = zeros(1, size(BigU,2));
rangeThreshold = 0.05;
for j = 1:endJ
    % find indices where denisty exceeds the rangeThreshold
    rangeTest = BigU(2:end, j) - rangeThreshold;
    rangeTest = rangeTest > 0;
    rangeID = find(rangeTest);
    % find the length of the range (note the transformation to the physical frame)
    phiy = y*(Gamma2(sT(j))-Gamma1(sT(j)))/L(2) + Gamma1(j);
    range(j) = phiy(rangeID(end)) - phiy(rangeID(1));
end
figure(7)
subplot(2,1,2)
hold on
plot(BigU(1,1:end), range, 'LineWidth', 1, 'DisplayName', strcat('Amp = ', num2str(Amp(1)), ', B = ' , num2str(BP(1)), ', c = ', num2str(c(1))),...
    'LineStyle', '-', 'color',[68, 119, 170]/255); % blue

% [34, 136, 51]/255  green
% [68, 119, 170]/255  blue

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('c5m1Amp25Freq2Pi.mat')

Gamma1 = @(myVar) c(1)*myVar + Amp(1)*sin(BP(1)*myVar);
Gamma2 = @(myVar) c(2)*myVar + Amp(3)*sin(BP(3)*myVar) + L(2);

% totalPop
endJ = size(BigU, 2);
totalPop = zeros(1, size(BigU,2));
for j = 1:endJ
    % note the transformation back to the physical frame
    scaledH = H*(Gamma2(sT(j))-Gamma1(sT(j)))/L(2);
    totalPop(j) = trapezoidalRule(scaledH, BigU(2:p+1, j), P);
end
figure(8)
hold on
subplot(2,1,1)
plot(BigU(1,1:end), totalPop, 'LineWidth', 1, ...
    'DisplayName', strcat('Amp = ', num2str(Amp(1)), ', B = ' , num2str(BP(1)), ', c = ', num2str(c(1))),...
    'LineStyle', '-', 'color', [68, 119, 170]/255); % blue

% range

range = zeros(1, size(BigU,2));
rangeThreshold = 0.05;
for j = 1:endJ
    %find indices where denisty exceeds the rangeThreshold
    rangeTest = BigU(2:end, j) - rangeThreshold;
    rangeTest = rangeTest > 0;
    rangeID = find(rangeTest);
    %find the length of the range (note the transformation to the physical frame)
    phiy = y*(Gamma2(sT(j))-Gamma1(sT(j)))/L(2) + Gamma1(j);
    range(j) = phiy(rangeID(end)) - phiy(rangeID(1));
end
figure(8)
subplot(2,1,2)
hold on
plot(BigU(1,1:end), range, 'LineWidth', 1, 'DisplayName', strcat('Amp = ', num2str(Amp(1)), ', B = ' , num2str(BP(1)), ', c = ', num2str(c(1))),...
    'LineStyle', '-', 'color', [68, 119, 170]/255); %blue

figure(8)
subplot(2,1,1)
xlabel('TIME')
ylabel('TP_{A,B}')

subplot(2,1,2)
xlabel('TIME')
ylabel('R_{A,B}')
% 
% 
% %%
% %%
% %%
