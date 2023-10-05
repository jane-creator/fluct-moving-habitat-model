Here you find the necessary files to run the simulations to create the .mat files found in Folder figure2. 

The critical amplitudes are found via the linear system and calculating the corresponding eigenvalue associated to the system when looked at as a discrete-time dynamical system. For multiple shifting speeds c, we loop through a vector of amplitude values A_1, A_2, ..., A_n. Using the power method, we calculate the dominant eigenvalue. When the eigenvalue goes from being greater than one at A_j to being less than one at A_{j+1}, then we've found an interval for the critical amplitude, [A_j, A_{j+1}]. Then we bisect within this interval. 

How to recreate freq1bisect.mat:

First run getDotData_uott_freq1.m. This will loop through many different grids so that you can see the convergence for your eigenvalues. The last file created will give you your first intervals on amplitudes. 

Then you can bisect on these amplitudes using bisectForAstar.m. 
