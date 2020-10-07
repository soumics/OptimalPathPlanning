function xnew=pathplan2d(t,x)
K=.5; B=6; b0=7.0861; a=0.4;
xg=20; yg=20;

xrel=xg-x(1);
yrel=yg-x(2);
theta=x(3);

r=sqrt(xrel^2+yrel^2);
del=atan2(yrel,xrel);

v=K*r;

rdot=-v*cos(theta-del);
deldot=-(v/r)*sin(theta-del);

xdot=-rdot*cos(del)+r*sin(del)*deldot;
ydot=-(rdot*sin(del)+r*cos(del)*deldot);
thetadot=B*deldot-a*b0*exp(-a*t);

xnew=[xdot;ydot;thetadot];