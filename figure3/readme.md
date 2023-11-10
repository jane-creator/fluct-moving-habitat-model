In this folder, you find all of the necessary content to create Figure 3 and Figure S1.

In order to recreate the plots like those of Figure 3 and Figure S1 you must first simulate the model dynamics with fbeICAlreadyLoaded.m. This code assumes that you can upload your initial condition containing the following items PIC = number of grid points in each subdomain, UIC = initial condition in vector form, yIC = computational domain, a = (a1, a2) = parameters related to the size of the computational domain, endPts = [-a1*l, (a2 + 1)*l] = the end points of the computational domain, minOmega0 = the minimum size of the spatial grid. More information on building an initial condition can be found in the last paragraph. 

The script then makes calls to the function criticalPatchSize (can be found in folder Figure 2), geometricProgressionREVISED.m, and the function referenceDomainFrwdBkwrdEuler2bothPeriodic. It outputs a large matrix where the columns correspond to a time and the numerical solution at that time.

This matrix can be used then to build the rest of the figures in the manuscript.  

The initial condition can be built with fbe.m which makes calls to the following functions: referenceDomainFrwdBkwrdEuler2TravellingPulse.m., geometricProgressionREVISED.m, and referenceDomainFrwdBkwrdEuler2.m. Before running the script you should define your model parameters as such: D = [D_1, D_2, D_0], where D_i is the diffusion coefficient for x < L_1, (unsuitable habitat in the direction of warmer climate), x > L_2 (unsuitable habitat in the direction of colder climate), L_1 < x < L_2 (the suitable habitat). Since this code runs for the scaled model you should take D_0 = 1. This initial condition will be a travelling pulse where both interfaces move at the same constant speed. 
