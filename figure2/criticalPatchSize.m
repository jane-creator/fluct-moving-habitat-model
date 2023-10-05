%% CALCULATE THE CRITICAL PATCH SIZE

function myLstar = criticalPatchSize(c, proba, D, m)

%% MODEL PARAMETERS 
c = c(1);

% define jump factors
kaph = proba(1)*D(1)^0.5/(1 - proba(1));
kbet = proba(2)*D(2)^0.5/(1 - proba(2));

gamma_zero_alpha = (c + sqrt(c^2 + 4*m(1)*D(1)))/(2*kaph);
gamma_zero_beta = (c - sqrt(c^2 + 4*m(2)*D(2)))/(2*kbet);

myGuesses = 0:0.01:10;
guessIndex = 1:1:max(size(myGuesses));
Lstar = zeros(size(myGuesses));

if c < 2 
    caseExpression = 1;
else 
    caseExpression = 2;
end

switch caseExpression
    case 1
        z0 = sqrt(4 - c^2)/2;
        myLHS = @(myVar) sin(z0*myVar)*(z0^2 + ((c/2) - gamma_zero_alpha)*((c/2) - gamma_zero_beta));
        myRHS = @(myVar) cos(z0*myVar)*z0*(gamma_zero_alpha - gamma_zero_beta);
        myFunction = @(myVar) myLHS(myVar) - myRHS(myVar);
        for myGuess = myGuesses
            Lstar(guessIndex) = fzero(myFunction,myGuess);
            guessIndex = guessIndex +1;
        end
        myPositiveValues = find(Lstar > 0);
        Lstar = Lstar([myPositiveValues]);
        myLstar = min(Lstar);
       
    case 2
        s0 = sqrt(c^2 - 4)/(2);
        myLHS = @(myVar) sinh(s0*myVar)*(s0^2 + (gamma_zero_beta - c/2)*((c/2) - gamma_zero_alpha));
        myRHS = @(myVar) cosh(s0*myVar)*(s0)*(gamma_zero_beta - gamma_zero_alpha);
        myFunction = @(myVar) myLHS(myVar) - myRHS(myVar);
        for myGuess = myGuesses
            Lstar(guessIndex) = fzero(myFunction,myGuess);
            guessIndex = guessIndex +1;
        end
        myPositiveValues = find(Lstar > 0);
        Lstar = Lstar([myPositiveValues]);
        myLstar = min(Lstar);
end

%
% c is speed of interfaces
% amp is the inverse amplication of the oscillations on the speed of
% interface 2
%
% D = vector of diffusion rates, D(1) = D1, D(2) = D2,
% m = vector of mortality rates outside of suitbable habitat m(i) = m_i
% proba = vector of individuals probabilty of moving left or right at interfaces, proba(1) = alpha, proba(2) = beta 
% l is the length of Omega_0
%
% kaph = measure of density jump across L1
% kbet = measure of density jump across L2
%