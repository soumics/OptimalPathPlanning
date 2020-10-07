function xnew=pathplan3d(t,x)
% K=.5; B=6; b0=7.0861; a=0.4;
% xg=20; yg=20;
% 
% xrel=xg-x(1);
% yrel=yg-x(2);
% theta=x(3);
% 
% r=sqrt(xrel^2+yrel^2);
% del=atan2(yrel,xrel);
% 
% v=K*r;
% 
% rdot=-v*cos(theta-del);
% deldot=-(v/r)*sin(theta-del);
% 
% xdot=-rdot*cos(del)+r*sin(del)*deldot;
% ydot=-(rdot*sin(del)+r*cos(del)*deldot);
% thetadot=B*deldot-a*b0*exp(-a*t);
% 
% xnew=[xdot;ydot;thetadot];

K=.001; N1=1.25; N2=1.5; b1=-2.5589; b2=3.0112; d1=0.4; d2=0.4;

xg=0; yg=0; zg=5;
xr=x(1); yr=x(2); zr=x(3); si_r=x(4); phi_r=x(5);

xgr=xg-xr;
ygr=yg-yr;
zgr=zg-zr;
rgr=sqrt(xgr^2+ygr^2);
rhogr=sqrt(rgr^2+zgr^2);
sigmaxy=atan2(ygr,xgr);
sigmarz=atan2(rgr,zgr);

vr=K*rhogr;
v1=vr*cos(phi_r);
delxy=si_r-sigmaxy;

rgrdot=-v1*cos(si_r-sigmaxy);
sigmaxydot=-(v1/rgr)*sin(si_r-sigmaxy);
rhogrdot=-vr*(cos(phi_r)*cos(sigmarz)*cos(delxy)+sin(phi_r)*sin(sigmarz));
sigmarzdot=-vr*(sin(phi_r)*cos(sigmarz)-cos(delxy)*cos(phi_r)*sin(sigmarz));

xgrdot=rgrdot*cos(sigmaxy)-rgr*sin(sigmaxy)*sigmaxydot;
ygrdot=rgrdot*cos(sigmaxy)+rgr*cos(sigmaxy)*sigmaxydot;
zgrdot=rhogrdot*sin(sigmarz)+rhogr*cos(sigmarz)*sigmarzdot;

xrdot=-xgrdot;
yrdot=-ygrdot;
zrdot=-zgrdot;
si_rdot=N1*sigmaxydot-b1*d1*exp(-d1*t);
phi_rdot=N2*sigmarzdot-b2*d2*exp(-d2*t);

xnew=[xrdot;yrdot;zrdot;si_rdot;phi_rdot];
