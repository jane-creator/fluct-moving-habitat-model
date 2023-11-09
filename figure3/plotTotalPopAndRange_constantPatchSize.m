% % % plotTotalPop&Range
% 
 load('c1LeftUpperCorner.mat')
% load('m1c05A55Density')
% 
% BigU is a matrix with saved numerical solutions along the columns with the first entry in each column indicating the time that the solution is saved at. 
% totalPop
endJ = size(BigU, 2);
totalPop = zeros(1, size(BigU,2));
for j = 1:endJ
    % note the transformation back to the physical frame
    totalPop(j) = trapezoidalRule(H, BigU(2:p+1, j), P);
end
figure(8)
subplot(2,1,1)
hold on
plot(BigU(1,1:end), totalPop, 'LineWidth', 1, ...
    'DisplayName', strcat('Amp = ', num2str(Amp(1)), ', B = ' , num2str(BP(1)), ', c = ', num2str(c(1))),...
    'LineStyle', '-', 'color', [34, 136, 51]/255);

%range

range = zeros(1, size(BigU,2));
rangeThreshold = 0.05;
for j = 1:endJ
    % find indices where denisty exceeds the rangeThreshold
    rangeTest = BigU(2:end, j) - rangeThreshold;
    rangeTest = rangeTest > 0;
    rangeID = find(rangeTest);
    % find the length of the range (note the transformation to the physical frame)
    range(j) = y(rangeID(end)) - y(rangeID(1));
end
figure(8)
subplot(2,1,2)
hold on
plot(BigU(1,1:end), range, 'LineWidth', 1, 'DisplayName', strcat('Amp = ', num2str(Amp(1)), ', B = ' , num2str(BP(1)), ', c = ', num2str(c(1))),...
    'LineStyle', '-', 'color', [34, 136, 51]/255);
% 
load('c1FirstRowFourthColumn.mat')

% totalPop
endJ = size(BigU, 2);
totalPop = zeros(1, size(BigU,2));
for j = 1:endJ
    % note the transformation back to the physical frame
    totalPop(j) = trapezoidalRule(H, BigU(2:p+1, j), P);
end
figure(8)
hold on
subplot(2,1,1)
plot(BigU(1,1:end), totalPop, 'LineWidth', 1, ...
    'DisplayName', strcat('Amp = ', num2str(Amp(1)), ', B = ' , num2str(BP(1)), ', c = ', num2str(c(1))),...
    'LineStyle', '-', 'color', [68, 119, 170]/255);

%range

range = zeros(1, size(BigU,2));
rangeThreshold = 0.05;
for j = 1:endJ
    % find indices where denisty exceeds the rangeThreshold
    rangeTest = BigU(2:end, j) - rangeThreshold;
    rangeTest = rangeTest > 0;
    rangeID = find(rangeTest);
    % find the length of the range (note the transformation to the physical frame)
    range(j) = y(rangeID(end)) - y(rangeID(1));
end
figure(8)
subplot(2,1,2)
hold on
plot(BigU(1,1:end), range, 'LineWidth', 1, 'DisplayName', strcat('Amp = ', num2str(Amp(1)), ', B = ' , num2str(BP(1)), ', c = ', num2str(c(1))),...
    'LineStyle', '-',  'color', [68, 119, 170]/255); % blue
% 
figure(7)
subplot(2,1,1)
xlabel('TIME')
ylabel('TP_{A,\omega}', 'FontSize', 14)

subplot(2,1,2)
xlabel('TIME')
ylabel('R_{A,\omega}', 'FontSize', 14)


%%%
%%%
%%%

load('c05LastRowLastColumn.mat')
% totalPop
endJ = size(BigU, 2);
totalPop = zeros(1, size(BigU,2));
for j = 1:endJ
    % note the transformation back to the physical frame
    totalPop(j) = trapezoidalRule(H, BigU(2:p+1, j), P);
end
figure(7)
subplot(2,1,1)
hold on
plot(BigU(1,1:end), totalPop, 'LineWidth', 1, ...
    'DisplayName', strcat('Amp = ', num2str(Amp(1)), ', B = ' , num2str(BP(1)), ', c = ', num2str(c(1))),...
    'LineStyle', '-', 'color', [34, 136, 51]/255);

%range

range = zeros(1, size(BigU,2));
rangeThreshold = 0.05;
for j = 1:endJ
    % find indices where denisty exceeds the rangeThreshold
    rangeTest = BigU(2:end, j) - rangeThreshold;
    rangeTest = rangeTest > 0;
    rangeID = find(rangeTest);
    % find the length of the range (note the transformation to the physical frame)
    range(j) = y(rangeID(end)) - y(rangeID(1));
end
figure(7)
subplot(2,1,2)
hold on
plot(BigU(1,1:end), range, 'LineWidth', 1, 'DisplayName', strcat('Amp = ', num2str(Amp(1)), ', B = ' , num2str(BP(1)), ', c = ', num2str(c(1))),...
    'LineStyle', '-', 'color', [34, 136, 51]/255);
% 
load('c05FirstLastColumn.mat')
% 
% totalPop
endJ = size(BigU, 2);
totalPop = zeros(1, size(BigU,2));
for j = 1:endJ
    % note the transformation back to the physical frame
    totalPop(j) = trapezoidalRule(H, BigU(2:p+1, j), P);
end
figure(7)
hold on
subplot(2,1,1)
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
    range(j) = y(rangeID(end)) - y(rangeID(1));
end
figure(7)
subplot(2,1,2)
hold on
plot(BigU(1,1:end), range, 'LineWidth', 1, 'DisplayName', strcat('Amp = ', num2str(Amp(1)), ', B = ' , num2str(BP(1)), ', c = ', num2str(c(1))),...
    'LineStyle', '-', 'color', [68, 119, 170]/255); %blue

figure(7)
subplot(2,1,1)
xlabel('TIME')
ylabel('TP_{A,B}')

subplot(2,1,2)
xlabel('TIME')
ylabel('R_{A,B}')


%%
%%
%%
