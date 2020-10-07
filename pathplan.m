function xdot=pathplan(t,x)
N1=1.5; N2=2;
C1=0; C2=0;
K=1; t0=0;
d1=1; d2=1;

r=[x(1);x(2);x(3)];
rd=[1;12;12];

sigma_xy=x(4);
r_gr=x(5);
sigma_rz=x(6);
rho_gr=x(7);

v_r=K*rho_gr;

si_r_t0=0.7854;
sigma_xy_t0=1.5708;
phi_r_t0=1.4429;
sigma_rz_t0=0.7854;

B1=si_r_t0-N1*sigma_xy_t0-C1
B2=phi_r_t0-N2*sigma_rz_t0-C1

si_r=N1*sigma_xy+C1+B1*exp(-d1*(t-t0));
phi_r=N2*sigma_rz+C2+B2*exp(-d2*(t-t0));

v1=v_r*cos(phi_r);

rdot_gr=-v1*cos(si_r-sigma_xy);
sigmadot_xy=-(v1/r_gr)*sin(si_r-sigma_xy);

del_xy=phi_r-sigma_xy;
rhodot_gr=v_r*(cos(phi_r)*cos(sigma_rz)*cos(del_xy)+sin(phi_r)*sin(sigma_rz));
sigmadot_rz=-(v_r/rho_gr)*(sin(phi_r)*cos(sigma_rz)-cos(del_xy)*cos(phi_r)*sin(sigma_rz));

% rdot_gr
% rhodot_gr*cos(sigmadot_rz)

xdot_r=rdot_gr*cos(sigmadot_xy);
ydot_r=rdot_gr*sin(sigmadot_xy);
zdot_r=rhodot_gr*sin(sigmadot_rz);

xdot=[xdot_r;ydot_r;zdot_r;rdot_gr;sigmadot_xy;rhodot_gr;sigmadot_rz];
% qw