function xdot=pathplan1(t,x)
N1=1.5; N2=5;
C1=0; C2=0;
K=1;
r=[x(1);x(2);x(3)];
rd=[1;12;12];
v_r=K*sqrt((r(1)-rd(1))^2+(r(2)-rd(2))^2+(r(3)-rd(3))^2);
sigma_xy=x(4);
r_gr=x(5);
sigma_rz=x(6);
rho_gr=x(7);

si_r=N1*sigma_xy+C1;
phi_r=N2*sigma_rz+C2;

xdot_r=v_r*cos(phi_r)*cos(si_r);
ydot_r=v_r*cos(phi_r)*sin(si_r);
zdot_r=v_r*sin(phi_r);

v1=v_r*cos(phi_r);

rdot_gr=-v1*cos(si_r-sigma_xy);
sigmadot_xy=-(v1/r_gr)*sin(si_r-sigma_xy);

del_xy=phi_r-sigma_xy;
rhodot_gr=v_r*(cos(phi_r)*cos(sigma_rz)*cos(del_xy)+sin(phi_r)*sin(sigma_rz));
sigmadot_rz=-(v_r/rho_gr)*(sin(phi_r)*cos(sigma_rz)-cos(del_xy)*cos(phi_r)*sin(sigma_rz));

xdot=[xdot_r;ydot_r;zdot_r;rdot_gr;sigmadot_xy;rhodot_gr;sigmadot_rz];