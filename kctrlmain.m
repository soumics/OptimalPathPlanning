clc;
t0 = 0; tf = 15;
x0=[0;0;0];
hold on

[t,x] = ode23(@kinematicctrl,[t0,tf],x0);

plot(0,0,'g*')
plot(20,20,'r*')

for i=1:length(t)
    plot(x(i,1),x(i,2),'o')
    pause(.1)
end
hold on
figure(2)
plot(t,x(:,1),t,x(:,2));