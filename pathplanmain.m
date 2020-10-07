clc;
t0 = 0; tf = 30;
x0=[1;1;1;1.5708;11;0.7854;15.5563];
hold on;

[t,x] = ode23(@pathplan,[t0,tf],x0);
plot3(x(:,1),x(:,2),x(:,3));
grid on;
% [t,x] = ode23(@pathplan1,[t0,tf],x0);
% plot3(x(:,1),x(:,2),x(:,3));
% [t,x] = ode23(@pathplan2,[t0,tf],x0);
% plot3(x(:,1),x(:,2),x(:,3));
