The rest of the figures are made essentially with the function: referenceDomainFrwdBkwrdEuler2bothPeriodic(U, N, n, c, Amp,BP, D, m, kaph, kbet, L, P, H, k, y). Parameters descrbied in preamble of function code. 

Figure 3, S1 and 6 are created by finding first a grid-independent solution (i.e. refining numerical parameters). Once satisfied with the numerical parameters the function is then used to build a large matrix where the columns correspond to the solution through time. We can then use the trapezoidal rule to determine the total population (abundance) for each saved solution in time. we determine the range by using the built in function find where we can determine the first and last occurance where the population is above the threshold. 

Figures 4 and 5 are built with the function by first finding a grid-independent solution. Then with these numerical parameters, we find the asymptotic profile, that is the periodic travelling pulse. This numerical solution is saved in a matrix where the first column corresponds to the profile at the beginning of the period and the following columns correspond to the profile at times within the period. The asymptotic profile is said to be found when two such matrices do not change, as determined by (U1(:, 1) - U2(:, 2))/k < 10^{-3}, Where k is the time step a U1 and U2 correspond to matrices holding numerical solutions of two sequential periods. Once we find the asymptotic profile we use it to determine the total population (abundance) for every saved time in the period with the trapezoidal rule. We then extract the maximum and minimum values from this result which we can then use to determine the relative difference from the corresponding travelling pulse. This process is repeated for multiple values of amplitude and frequencies, for which we can then build Figures 4 and 5. 

Numerical parameters:
k = temporal step;
h_0 = minimum spatial step (we use geometric spacing as described in MacDonald et al Math BioSci 2021);
[a_1, a_2] = parameters for reference frame where the reference frame is [-a_1*L, L(1 + a_2)], where L is the length of the niche at the initial time. 

To recreate the figures with our numerical parameters use:

Figure 3 and S1: 
Constand niche size - green curves (period T = 8): k = 0.005, h_0 = 0.005, a = [20, 5]; - blue curve figure 3: (period T = 1): k = 5e-5; h_0 = 0.005, a = [20, 5]; blue curve figure S1: (period T = 1): k = 1e-4; h_0 = 0.0025, a = [20, 5];
Varying niche size - green curves (period T = 8): k = 0.0125, h_0 = 0.01, a = [80, 60]; - blue curves (period T = 1): k =1.15625e-3, h_0 = 0.0025, a = [80, 60].

Figure 4: 

Constant niche size: c = 1, a = [20,5]:
|Amplitude | Period T = 8: (k, h_0) | Period T = 4: (k, h_0) | Period T = 2: (k, h_0) | Period T = 1: (k, h_0) |
| --- | --- |--- | --- | --- |
| 1 | (0.01, 0.01)| (0.005, 0.005)| (0.005, 0.005)| (5e-4, 0.001)| 
| 2 | (0.005, 0.005) | (0.005, 0.005) | (5e-4, 0.001) | (5e-4, 0.001) |
| 3 | (0.005, 0.005) | (5e-4, 0.001) | (5e-4, 0.001) | (5e-5, 0.001) |
| 4 | (0.005, 0.005) | (5e-4, 0.001) | (5e-4, 0.001) | (5e-5, 0.001) |
| 5 | (0.0005, 0.001)| (5e-4, 0.001)| (5e-5, 0.001)| (5e-5, 0.001)| 

Varying niche size: c = 1
|Amplitude | Period T = 8: (k, h_0) | Period T = 4: (k, h_0) | Period T = 2: (k, h_0) | Period T = 1: (k, h_0) |
| --- | --- |--- | --- | --- |
| 0.5 | (0.1, 0.08)| (0.1, 0.08)| (0.05, 0.001)| (0.01, 0.01)| 
| 1 | (0.1, 0.08)| (0.05, 0.04)| (1.25e-3, 0.02)| (0.01, 0.01)| 
| 1.5 | (0.05, 0.04) | (0.025, 0.02) | (1.25e-3, 0.02) | (0.005, 0.005) |
| 2 | (0.05, 0.04)| (0.025, 0.02)| (6.25e-3, 0.01)| (0.01, 0.01)| 
| 2.5 | (0.025, 0.02) | (1.25e-2, 0.01) | (3.125e-3, 0.005) | (0.005, 0.005) |
| 3 | (0.025, 0.02)| (1.25e-2, 0.01)| (3.125e-3, 0.005)| (0.01, 0.01)| 
| 3.5 | (0.025, 0.02) | (6.25e-3, 0.005) | (3.125e-3, 0.005) | (0.005, 0.005) |
| 4 | (1.25e-2, 0.01)| (6.25e-3, 0.005)| (1.5625e-3, 2.5e-3)| (0.01, 0.01)| 
| 4.5 | (1.25e-2, 0.01)| (3.125e-3, 2.5e-3)| (7.8125e-4, 1.25e-3)| (0.01, 0.01)| 
| 5 | (6.25e-3, 0.005)| (1.5625e-3, 1.25e-3)| (3.90625, 6.25e-4)| (0.0005, 0.001)| 

Constant niche size: c = 0.5
|Amplitude | Period T = 8: (k, h_0) | Period T = 4: (k, h_0) | Period T = 2: (k, h_0) | Period T = 1: (k, h_0) |
| --- | --- |--- | --- | --- |
| 1 | (0.1, 0.1)| (0.1, 0.1)| (0.001, 0.005)| (5e-4, 0.001)| 
| 2 | (0.1, 0.1) | (0.005, 0.005) | (5e-4, 0.001) | (5e-4, 0.001) |
| 3 | (0.005, 0.005) | (0.005, 0.005) | (5e-4, 0.001) | (1e-4, 0.001) |
| 4 | (0.005, 0.005) | (0.001, 0.001) | (5e-4, 0.001) | (5e-5, 0.001) |
| 5 | (0.005, 0.005)| (5e-4, 0.001)| (5e-4, 0.001)| (5e-5, 0.001)| 

Varying niche size: c = 0.5
|Amplitude | Period T = 8: (k, h_0) | Period T = 4: (k, h_0) | Period T = 2: (k, h_0) | Period T = 1: (k, h_0) |
| --- | --- |--- | --- | --- |
| 1 | (0.01, 0.01)| (0.01, 0.01)| (0.01, 0.01)| (0.01, 0.01)| 
| 2 | (0.005, 0.005) | (0.005, 0.005) | (0.005, 0.005) | (0.005, 0.005) |
| 3 | (0.005, 0.005) | (0.005, 0.005) | (0.005, 0.005) | (0.005, 0.005) |
| 4 | (0.005, 0.005) | (0.005, 0.005) | (0.005, 0.005) | (0.005, 0.005) |
| 5 | (0.0005, 0.001)| (0.0005, 0.001)| (0.0005, 0.001)| (0.0005, 0.001)| 




