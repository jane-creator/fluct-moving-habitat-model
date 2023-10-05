function Uinterp = mySplineInterpolate(yold, Uold, Pold, y, P)
%interpolate data Uold onto grid y

% see more simple examples on piecewise 
% interpolation at
% https://octave.org/doc/v4.0.1/One_002ddimensional-Interpolation.html#XREFspline
p1old = Pold(1);
p0old = Pold(2);
%p2ref = Ph1(3);
pold = Pold(4);

p1new = P(1);
p0new = P(2);
%p2coarse = Ph1(3);
pnew = P(4);


% old onto new
Uinterp = spline(yold(1:p1old), Uold(1:p1old), y(1:p1new)); 
Uinterp = horzcat(Uinterp, spline(yold(p1old+1:p1old+p0old), Uold(p1old+1:p1old+p0old), y(p1new+1:p1new+p0new)));
Uinterp = horzcat(Uinterp, spline(yold(p1old+p0old+1:pold), Uold(p1old+p0old+1:pold), y(p1new+p0new+1:pnew))); 
Uinterp = transpose(Uinterp);


% % data to interpolate, here on a coarse grid
% x=0:1:10;
% y=sin(x);
% 
% % fine grid on which we want to interpolate
% xi=0:0.001:10;
% 
% % piecewise linear interpolate - graph looks like plot(x,y)
% yi=interp1(x,y,xi);
% 
% % cubic spline (one of many flavors)
% yii=spline(x,y,xi);
% 
% % exact function
% ye=sin(xi);

%plot(xi,ye,'k',xi,yi,'b',xi,yii,'r')