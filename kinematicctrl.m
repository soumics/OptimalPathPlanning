function xnew=kinematicctrl(t,x)
Krho=3; Kalpha=8; Kbeta=10;
xg=20; yg=20;

xrel=xg-x(1)
yrel=yg-x(2);
theta=x(3);

rho=sqrt(xrel^2+yrel^2);
beta=atan2(yrel,xrel);
alpha=-theta+beta;

v=Krho*rho;
w=Kalpha*alpha+Kbeta*beta;

xdot=v*cos(theta);
ydot=v*sin(theta);
thetadot=w;

xnew=[xdot;ydot;thetadot];