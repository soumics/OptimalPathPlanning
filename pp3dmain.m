clc;
t0 = 0; tf = 15;
x0=[12;12;12;pi/2;0];

[t,x] = ode23(@pathplan3d,[t0,tf],x0);
plot3(x(:,1),x(:,2),x(:,3));
grid on;

% figure(2)
% plot(t,x(:,1),t,x(:,2))
% figure(3)
% plot(t,x(:,3))

% x0=[pi/2 atan2(12,12*sqrt(2)) 0];
% xf=[0 atan2(5,0) 15];
% B=1.5; a=0.4;
% [b0 b1]=nparam(x0,xf,B,a)