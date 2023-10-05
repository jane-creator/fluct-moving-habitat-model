% figure out if we should go down or up 
AmpID = AmpIDStar; % index for amplitude vector
Amp = [CurrAmpVector(AmpID), -CurrAmpVector(AmpID)];   
% Amp = [Amp1, Amp2] = amplitude of interface L1 and L2, respectively

%% Loop calling to scheme
n = 0; % starting index for loop within scheme
t = n*k;
periodIndex = 1; % index of vector to save sequence of eigenvalue approximation
lam = -ones(numP, 1); % vector to save sequence of eigenvalue approximation
notconverged = 1;
tic
while t < T && notconverged % looping on time, stop once t = T
    N = periodIndex*numStepPerP; % N*k is the final time for loop in scheme, start at last end time 
    if n == 0 % if it's the first iteration
        [U,n] = refDomFBE2bothPeriodicLINEAR(UIC, N, n, c, Amp,BP, D, m, kaph, kbet, L, P, H, k, y); %call to scheme on reference domain
        % U = density curve at time N*k
        % n = new starting index for next loop within scheme (= N)
        lam(periodIndex) = max(abs(U));
        U = U/lam(periodIndex); % scale U with L_infinity norm
        periodIndex = periodIndex + 1;

    else
        [U,n] = refDomFBE2bothPeriodicLINEAR(U, N, n, c, Amp,BP, D, m, kaph, kbet, L, P, H, k, y); %call to scheme on reference domain
        % U = density curve at time N*k
        % n = new starting index for next loop within scheme
        lam(periodIndex) = max(abs(U));
        if abs(lam(periodIndex-1)-lam(periodIndex)) < 1e-6
            notconverged = 0;
        end
        U = U/lam(periodIndex); % scale U with L_infinity norm
        %U = U/max(abs(U)); % scale U with L_infinity norm
        periodIndex = periodIndex + 1;
    end
    t = n*k;
end
toc % done sequence
evalApprox(AmpID,cVectorID) = lam(periodIndex-1); % eigenvalue approximated by the scaling factor
evalApproxSeq{AmpID,cVectorID} = lam(1:periodIndex-1); % eigenvalue sequence
if lam(periodIndex -1) <= 1 
    direction = -1; % go down in amplitude value
   
else
    direction = 1; % go up in amplitude value
    evalApprox(1:AmpID, cVectorID) = lam(periodIndex -1); % save all spots below this approximation as "green"
end

AmpID = AmpID + direction; 

if direction == -1
    while AmpID >= 0
        Amp = [CurrAmpVector(AmpID), -CurrAmpVector(AmpID)];   
        % Amp = [Amp1, Amp2] = amplitude of interface L1 and L2, respectively

        %% Loop calling to scheme
        n = 0; % starting index for loop within scheme
        t = n*k;
        periodIndex = 1; % index of vector to save sequence of eigenvalue approximation
        lam = -ones(numP, 1); % vector to save sequence of eigenvalue approximation
        notconverged = 1;
        tic
        while t < T && notconverged% looping on time, stop once t = T
            N = periodIndex*numStepPerP; % N*k is the final time for loop in scheme, start at last end time 
            if n == 0 % if it's the first iteration
                [U,n] = refDomFBE2bothPeriodicLINEAR(UIC, N, n, c, Amp,BP, D, m, kaph, kbet, L, P, H, k, y); %call to scheme on reference domain
                % U = density curve at time N*k
                % n = new starting index for next loop within scheme (= N)
                lam(periodIndex) = max(abs(U));
                U = U/lam(periodIndex); % scale U with L_infinity norm
                periodIndex = periodIndex + 1;

            else
                [U,n] = refDomFBE2bothPeriodicLINEAR(U, N, n, c, Amp,BP, D, m, kaph, kbet, L, P, H, k, y); %call to scheme on reference domain
                % U = density curve at time N*k
                % n = new starting index for next loop within scheme
                lam(periodIndex) = max(abs(U));
                if abs(lam(periodIndex-1)-lam(periodIndex)) < 1e-6
                    notconverged = 0;
                end
                U = U/lam(periodIndex); % scale U with L_infinity norm
                %U = U/max(abs(U)); % scale U with L_infinity norm
                periodIndex = periodIndex + 1;
            end
            t = n*k;
        end
        toc % done sequence
        evalApprox(AmpID,cVectorID) = lam(periodIndex-1); % eigenvalue approximated by the scaling factor
        evalApproxSeq{AmpID,cVectorID} = lam(1:periodIndex-1); % eigenvalue sequence
        if lam(periodIndex -1) > 1 
            evalApprox(1:AmpID, cVectorID) = lam(periodIndex -1); % make sure all smaller amp values get marked as green
            AmpIDStar = AmpID +1;
            break
        else
            AmpID = AmpID + direction; 
        end
    end
else
    while AmpID <= max(size(CurrAmpVector))
        Amp = [CurrAmpVector(AmpID), -CurrAmpVector(AmpID)];   
        % Amp = [Amp1, Amp2] = amplitude of interface L1 and L2, respectively

        %% Loop calling to scheme
        n = 0; % starting index for loop within scheme
        t = n*k;
        periodIndex = 1; % index of vector to save sequence of eigenvalue approximation
        lam = -ones(numP, 1); % vector to save sequence of eigenvalue approximation
        notconverged = 1;
        tic
        while t < T && notconverged % looping on time, stop once t = T
            N = periodIndex*numStepPerP; % N*k is the final time for loop in scheme, start at last end time 
            if n == 0 % if it's the first iteration
                [U,n] = refDomFBE2bothPeriodicLINEAR(UIC, N, n, c, Amp,BP, D, m, kaph, kbet, L, P, H, k, y); %call to scheme on reference domain
                % U = density curve at time N*k
                % n = new starting index for next loop within scheme (= N)
                lam(periodIndex) = max(abs(U));
                U = U/lam(periodIndex); % scale U with L_infinity norm
                periodIndex = periodIndex + 1;

            else
                [U,n] = refDomFBE2bothPeriodicLINEAR(U, N, n, c, Amp,BP, D, m, kaph, kbet, L, P, H, k, y); %call to scheme on reference domain
                % U = density curve at time N*k
                % n = new starting index for next loop within scheme
                lam(periodIndex) = max(abs(U));
                if abs(lam(periodIndex-1)-lam(periodIndex)) < 1e-6
                    notconverged = 0;
                end
                U = U/lam(periodIndex); % scale U with L_infinity norm
                %U = U/max(abs(U)); % scale U with L_infinity norm
                periodIndex = periodIndex + 1;
            end
            t = n*k;
        end
        toc % done sequence
        evalApprox(AmpID,cVectorID) = lam(periodIndex -1); % eigenvalue approximated by the scaling factor
        evalApproxSeq{AmpID,cVectorID} = lam(1:periodIndex-1); % eigenvalue sequence
        if lam(periodIndex -1) <= 1 
            AmpIDStar = AmpID;
            break
        else
            AmpID = AmpID + direction; 
        end
    end
end
cVectorID = cVectorID + 1;