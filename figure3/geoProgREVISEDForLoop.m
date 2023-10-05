%%%%%%%%%%% builds mesh using geometric progression %%%%%%%%%%55
% returns: 
% x = mesh 
% H = vector of step sizes
% pi = number of nodes on closure(Omega_i)
% p = total number of nodes in computational domain
% x(j+1) = x(j) + h(j)

function [y, H, p1, p0, p2, tGeometricProgression] = geoProgREVISEDForLoop(interf, endPts, hstar)
tic
%  % build internal mesh
h0star = hstar(1); % scale factor of geometric progression in Omega0
h1star = hstar(2); % scale factor of geometric progression in Omega1
h2star = hstar(3); % scale factor of geometric progression in Omega2
h0L = h0star; % first value of vector of stepsizes within Omegao0
h0R = h0star; % last value of vector of stepsizes within Omega0                
r0left = 1; % common ratio within Omega0 to the left of the midpoint of Omega0. MUST BE >= 1
r0right = 1; % common ratio within Omega0 to the right of the midpoint of Omega0. MUST BE >= 1
x0L = interf(1); % left most mesh point on closure(Omega0), builds to be the mesh vector on Omega0
x0R = interf(2); % right most mesh point on closure(Omega0), builds from right to midpoint of Omega0
S0L = x0L; % pointer on real line, indicates where the mesh is building from in left half of Omega0 within the loop. 
S0R = interf(2); % pointer on real line, indicates where the mesh is buidling from in right half of Omega_0 within the loop
midpoint0 = (interf(2) + interf(1))/2; % midpoint of Omega0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h1 = h1star;  % last value of vector of stepsizes within  Omega1 
r1 = 1.005; % common ratio witin Omega1. MUST BE >= 1
x1 = interf(1); % right most mesh point on closure(Omega1), builds to be the mesh vector on Omega1
S1 = x1; % pointer on real line, indicates where the mesh is building from in Omega1 within the loop.Used to indicate when mesh in Omega1 is complete and geometric progression within should stop. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h2 = h2star; % first value in sequence within Omega2
r2 = 1.005; % common ratio within Omega2. MUST BE >= 1
x2 = interf(2); % first value of vector of stepsizes within Omega2
S2 = x2; % pointer on real line, indicates where the mesh is building from in Omega2 within the loop. Used to indicate when mesh in Omega2 is complete and geometric progression within should stop. 
leftNotDone = 1; 
rightNotDone = 1;
while S0R ~= S0L || S1 > endPts(1) || S2 < endPts(2)% while mesh is not yet complete
    if leftNotDone % if mesh within left half side of Omega0 is incomplete
        if S0L + h0L(end) > midpoint0 - h0star/2 % if the next step size brings pointer into midpoint0neighbourhood
            h0L(end) = []; % do not add a next step
            leftNotDone = 0; % left is done
        else
            x0L = [x0L, x0L(end) + h0L(end)]; % add next mesh point to the vector NB: this vector is built from left to right.
        end
        S0L = x0L(end);% move pointer to last added mesh point.
        if leftNotDone % if pointer is still left of the midpoint
            h0L = [h0L, h0L(end)*r0left]; % add next step size to step size vector 
        end
    elseif rightNotDone
        if S0R - h0R(1) > midpoint0 + h0star/2 % if adding another step does not bring the next node into midpoint0 neighbourhood
            x0R = [x0R(1) - h0R(1), x0R]; % add mesh point buidling right to left
            S0R = x0R(1); % move pointer to left most node
            h0R = [h0R(1)*r0right, h0R]; % add new step size to h
        else % if taking another step does bring the next node into midpoint0neighbourhood
            h0R(1) = S0R - x0L(end); % take the step size to be between last node added in left half of Omega0 and first node to the right of midpoint, add no additional node
            rightNotDone = 0; % right is done
            S0R = S0L; % move pointer to the midpoint
        end
    end
    if S1 > endPts(1) % if S1 is still pointing to the right of the left endpoint of computational domain (i.e. if mesh within Omega1 is incomplete)
        x1 = [x1(1) - h1(1), x1]; % add next mesh point to the vector NB: this vector is built from right to left.
        h1 = [h1(1)*r1, h1]; % save step sizes between mesh points, add next step size to step size vector.
        S1 = x1(1); % move pointer to last addded mesh point. 
    end
    if S2 < endPts(2) % if S2 is still pointing to the left of the right endpoint of computational domain (i.e. if mesh within Omega2 is incomplete)
        x2 = [x2, x2(end) + h2(end)]; % add next mesh point to the vector. NB this vector is built from left to right
        h2 = [h2, h2(end)*r2]; % save step sizes between mesh points, add next step size to step size vector.
        S2 = x2(end); % move pointer to last added mesh point.
    end
end
h1(1) = []; % elimante first entry in vector h1 since it is never used to create a mesh point
h2(end) = []; % elimante last entry in vector h2 since it is never used to create a mesh point
p1 = size(x1,2); % number of mesh points on closure(Omega1)
p0 = size(horzcat(x0L,x0R), 2); % number of mesh points on closure(Omega0)
p2 = size(x2, 2); % number of mesh points on closure(Omega2)
H = [h1, 0, h0L, h0R, 0, h2]; % vector of all step sizes
y = [x1, x0L, x0R, x2]; % vector of all mesh points


%%%%%%%% for uniform mesh one can use
% y1 = interf(1):-h1star:endPts(1);  % build Omega1 from the trailing interface to the left computational endpoint
% y1 = y1(end:-1:1); % reverse y1 so that the nodal points are in increasing order
% y0 = interf(1):h0star:interf(2); % build Omega0 from the trailing interface to the leading interface, NOTE: h0star SHOULD DIVIDE |y0| EQUALLY SO THAT THERE ARE NODES EXACTLY ON BOTH THE INTERFACES
% y2 = interf(2):h2star:endPts(2); % build Omega2 from the leading interface to the right computational endpoint
% y = horzcat(y1, y0, y2); % concatenate the yi's to make a mesh over complete comutational domain
% p1 = max(size(y1,2)); % number of mesh points on closure(Omega1)
% p0 = size(y0, 2); % number of mesh points on closure(Omega0)
% p2 = size(y2, 2); % number of mesh points on closure(Omega2)
% H = diff(y); % vector of step sizes, NOTE: H(p1) = 0 = H(p1+p0)


toc
tGeometricProgression = toc;





