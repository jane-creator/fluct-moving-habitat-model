% performing bisection on the dotplot
load('freq4proba5D1m14a80_60lratio15dotPlot7_h03125_e3REDO.mat');

%myMatFile for initial conditions
load('ICproba5D1m14a80_60lratio15_varyc.mat') % loads cell array ICproba5D1m14a80_60lratio15_varyc.mat

% model paramters
BP = 0.5*[pi,pi]; % BP affects the period. The period of interface i is 2pi/|BP(i)|, i.e. large BP = short period
D = [1, 1];% = [D_1, D_2]
m = [1.4, 1.4]; % = [m_1, m_2]
proba = [0.5, 0.5]; % =[aph, bet]
period = 2*pi/BP(1); % = size of the period

% define jump factors
kaph = proba(1)*D(1)^0.5/(1 - proba(1));
kbet = proba(2)*D(2)^0.5/(1 - proba(2));

% BP = [BP1, BP2] = period divisor of interface L1 and L2, respectively
% D = vector of diffusion rates, D(1) = D1, D(2) = D2,
% m = vector of mortality rates outside of suitbable habitat m(i) = m_i
% proba = vector of individuals probabilty of moving left or right at interfaces, proba(1) = alpha, proba(2) = beta 
%
% kaph = measure of density jump across L1
% kbet = measure of density jump across L2
% period = period of interface 1

%% Temporal
numP = 200; % number of periods
T = numP*period; % final time
% k = 1e-1/4;
numStepPerP = ceil(period/k); % number of steps per periods
% NP = number of periods
% T = final time to approximate the eigenvalue size (larger or smaller than 1)
% k = temporal step

a = [80,60];
% a = controls for approximate size of computational domain = [-a(1)l, l(a(2) + 1)]
%hstar = [0.25e-3, 0.25e-3, 0.25e-3];

cVector = 0:0.25:1.9;
AmpVector = 0:0.1:4; % increasing amplitude

evalApproxBisect = -ones(1, max(size(cVector))); % saving the final approximation of the eigenvalue
evalApproxSeqBisect = cell(1, max(size(cVector))); % saving the sequence for each eigenvalue approximation
AmpStarBisect = -ones(1, max(size(cVector))); % saving the final A* associated with the eigenvalue

cVectorID = 0;
for currC = cVector 
    bisectID = 1:8;
    cVectorID = cVectorID + 1;
    c = [currC, currC]; % c = vector of speed of interface L1 and L2

    % calculate lStar
    myLstar = criticalPatchSize(c(1), proba, D, m);
    lratio = 1.5;
    l = lratio*myLstar; % make length of suitable habitat bigger than critical patch-size
    interf = [0,l];
    % l is the length of Omega_0
    % interf = vector with location of interfaces

    %% NUMERICAL PARAMETERS

    %% SPATIAL

    endPts = [-l*a(1), l*(1+a(2))];
    [y, H, p1, p0, p2, tGeometricProgression] = geoProgREVISEDForLoop(interf, endPts, hstar);
    p = p1 + p0 +p2;
    %[minOmega0, minIndex0] = min(H(p1+1:p1+p0-1));

    % endPts = approximate truncation of computational domain NOTE: see
    %           geometricProgression to see why approximate *******
    % y = computational grid over REFERENCE domain, dimensions 1xp
    % H = vector of step sizes, dimensions 1x(p-1). NB: y(j+1) = y(j) + H(j),  
    %       EXCEPTION: y(p_1) = y(p_1 + 1) and y(p1 + p0) = y(p1 + p0 + 1),
    %       i.e. H(p1) = 0 & H(p1 + p0) = 0;
    % p1 = number of nodes on closure of Omega_1
    % p0 = number of nodes on closure of Omega_0
    % p2 = number of nodes on closure of Omega_2
    % p = total number of nodes
    % [minOmega0, minIndex0] = [minimum value of step size,location of first minimum step size]
    % tGeometricProgression = CPU time to build mesh

    trunc1 = y(1);
    trunc2 = y(end);
    l1 = interf(1) - trunc1;
    l2 = trunc2 - interf(2);
    %
    % trunc1 = left end point of REFERENCE domain
    % trunc2 = right end point of REFERENCE domain
    % l1 = length of Omega1
    % l2 = length of Omega2

    P = [p1, p0, p2, p];
    L = [l1, l, l2];
    %
    % P = vector containing number of nodes in closure of each
    % Omegai, including the union of all 
    % L = vector containing the length of each Omegai


    UIC = ICproba5D1m14a80_60lratio15_varyc{cVectorID+1, 1};
    PIC = ICproba5D1m14a80_60lratio15_varyc{cVectorID+1, 2};
    yIC = ICproba5D1m14a80_60lratio15_varyc{cVectorID+1, 3};

    if size(UIC,2) > size(UIC,1) % if U is not a column vector
     UIC = transpose(UIC); % make U a column vector
    end

    UIC = mySplineInterpolate(yIC, UIC, PIC, y, P); % interpolate onto mesh

    UIC = UIC/max(abs(UIC)); % scale the initial condition

    AbID = find(evalApprox(:, cVectorID) < 1,1); % find index of initial Ab;
    Aa = AmpVector(AbID - 1);
    Ab = AmpVector(AbID);
    Amp = [(Aa + Ab)/2,(Aa + Ab)/2];
    Amp(1)
    
    for bisect = bisectID
        bisect
        %% Loop calling to scheme
        n = 0; % starting index for loop within scheme
        t = n*k;
        periodIndexBisect = 1; % index of vector to save sequence of eigenvalue approximation
        lam = -ones(numP, 1); % vector to save sequence of eigenvalue approximation
        notconverged = 1;
        tic
        while t < T && notconverged % looping on time, stop once t = T
            N = periodIndexBisect*numStepPerP; % N*k is the final time for loop in scheme, start at last end time 
            if n == 0 % if it's the first iteration
                [U,n] = refDomFBE2bothPeriodicLINEAR(UIC, N, n, c, Amp,BP, D, m, kaph, kbet, L, P, H, k, y); %call to scheme on reference domain
                % U = density curve at time N*k
                % n = new starting index for next loop within scheme (= N)
                lam(periodIndexBisect) = max(abs(U));
                U = U/lam(periodIndexBisect); % scale U with L_infinity norm
                periodIndexBisect = periodIndexBisect + 1;
        
            else
                [U,n] = refDomFBE2bothPeriodicLINEAR(U, N, n, c, Amp,BP, D, m, kaph, kbet, L, P, H, k, y); %call to scheme on reference domain
                % U = density curve at time N*k
                % n = new starting index for next loop within scheme
                lam(periodIndexBisect) = max(abs(U));
                if abs(lam(periodIndexBisect-1)-lam(periodIndexBisect)) < 1e-6
                    notconverged = 0;
                end
                U = U/lam(periodIndexBisect); % scale U with L_infinity norm
                periodIndexBisect = periodIndexBisect + 1;
            end
            t = n*k;
        end
        toc % done sequence
        if abs(lam(periodIndexBisect-1)-1) < 0.5*1e-4 || bisect == bisectID(end)% if we are close enough to 1
            if lam(periodIndexBisect - 1) < 1
                AmpStar = Amp(1);
            else 
                AmpStar = Ab;
            end
            break
        end
        if lam(periodIndexBisect-1) < 1
            Ab = Amp(1);
        else 
            Aa = Amp(1);
        end
        Amp = [(Aa + Ab)/2, (Aa + Ab)/2];
    end
    evalApproxBisect(cVectorID) = lam(periodIndexBisect-1); % saving the final approximation of the eigenvalue
    evalApproxSeqBisect{cVectorID} = lam(1:periodIndexBisect-1); % saving the sequence for each eigenvalue approximation
    AmpStarBisect(cVectorID) = AmpStar; % saving the final A* associated with the eigenvalue
end

save('freq4bisect.mat')

