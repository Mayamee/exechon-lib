syms xA1 yA1 zA1 xA2 yA2 zA2 xA3 yA3 zA3
syms xe ye ze
syms q1 q2
syms L
% xA1 = -85;
% yA1 = 0;
% zA1 = 0;
% xA2 = 0;
% yA2 = 100;
% zA2 = 0;
% xA3 = 85;
% yA3 = 0;
% zA3 = 0;
% L = 125;
k2 = sqrt(ye^2 + ze^2);
alf = atan(-ye / ze);
k3 = atan((xe - xA2) / ((ze - zA2) * cos(alf) - (ye - yA2) * sin(alf)));
T_pl = [
    cos(k3) 0 sin(k3) xe;
    sin(alf) * sin(k3) cos(alf) -sin(alf) * cos(k3) ye;
    -cos(alf) * sin(k3) sin(alf) cos(alf) * cos(k3) ze;
    0 0 0 1;
	];
A_EndEff_FIRST = [
	cos(q1) -sin(q1) 0 0;
	sin(q1) cos(q1) 0 0;
	0 0 1 L;
	0 0 0 1;
	];
A_First_Second = [
	1 0 0 0;
	0 cos(q2) -sin(q2) 0;
	0 sin(q2) cos(q2) 0;
	0 0 0 1;
	]
ye_out = 150;
E_out = [0;ye_out;0;1;]
Ae = [
1 0 0 E_out(1);
0 1 0 E_out(2);
0 0 1 E_out(3);
0 0 0 1;
]
T_out = T_pl * A_EndEff_FIRST * A_First_Second * Ae;
PX = T_out(1,4)
PY = T_out(2,4)
PZ = T_out(3,4)
FX = T_out(1,3)
FY = T_out(2,3)
FZ = T_out(3,3)