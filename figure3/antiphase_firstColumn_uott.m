% loop on amplitude
AmpID = 1; % index for amplitude vector
for currAmp = CurrAmpVector
    Amp = [currAmp, -currAmp] 
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
        %display(n)
        if n == 0 % if it's the first iteration
            [U,n] = refDomFBE2bothPeriodicLINEAR(UIC, N, n, c, Amp,BP, D, m, kaph, kbet, L, P, H, k, y); %call to scheme on reference domain
            % U = density curve at time N*k
            % n = new starting index for next loop within scheme (= N)
            lam(periodIndex) = max(abs(U)); % eigenvalue approximation at period = periodIndex
            U = U/lam(periodIndex); % scale U with L_infinity norm
            periodIndex = periodIndex + 1;
            %display(periodIndex)
        else
            [U,n] = refDomFBE2bothPeriodicLINEAR(U, N, n, c, Amp,BP, D, m, kaph, kbet, L, P, H, k, y); %call to scheme on reference domain
            % U = density curve at time N*k
            % n = new starting index for next loop within scheme
            lam(periodIndex) = max(abs(U));
            if abs(lam(periodIndex-1)-lam(periodIndex)) < 1e-6
                notconverged = 0
            end
            U = U/lam(periodIndex); % scale U with L_infinity norm
            %U = U/max(abs(U)); % scale U with L_infinity norm
            periodIndex = periodIndex + 1;
            %display(periodIndex)
        end
        t = n*k;
    end
    toc
    evalApprox(AmpID,cVectorID) = lam(periodIndex-1); % eigenvalue approximated by the scaling factor
    evalApproxSeq{AmpID,cVectorID} = lam(1:periodIndex -1);
    if lam(periodIndex -1) <= 1 % if for the currAmp the approximated eigenvalue is <= 1
        AmpIDStar = AmpID; % save index for which amplitude value this happened
        break % stop looping through the amplitude
    else
    AmpID = AmpID + 1; % else keep looping through the amplitude
    end
end
cVectorID = cVectorID + 1; % go to next c value