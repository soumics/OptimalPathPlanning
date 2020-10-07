clc;
t0 = 0; tf = 15;
x0=[0;0;pi];

[t,x] = ode23(@pathplan2d,[t0,tf],x0);
plot(x(:,1),x(:,2));

% figure(2)
% plot(t,x(:,1),t,x(:,2))
% figure(3)
% plot(t,x(:,3))

% x0=[pi atan2(0,0) 0];
% xf=[pi/4 atan2(20,20) 15];
% B=6; a=0.4;
% [b0 b1]=nparam(x0,xf,B,a)