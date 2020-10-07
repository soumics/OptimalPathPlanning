function xnew=knlctrl(t,x)
K1=1; K2=-4;
xg=20; yg=20;

xrel=xg-x(1)
yrel=yg-x(2);
theta=x(3);

rho=sqrt(xrel^2+yrel^2);
beta=atan2(yrel,xrel);
alpha=-theta+beta;

v=K1*rho*cos(alpha);
w=-K1*sin(alpha)*cos(alpha)-K2*alpha;%Kalpha*alpha+Kbeta*beta;

xdot=v*cos(theta);
ydot=v*sin(theta);
thetadot=w;

xnew=[xdot;ydot;thetadot];