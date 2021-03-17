syms q4 q5 xe ye ze 
syms xA1 yA1 zA1 
syms xA2 yA2 zA2 
syms xA3 yA3 zA3 
syms L1 L2
%second part of mech
% L1 = 125;
% L2 = 150;
%base init
% xA1 = -85;
% yA1 = 0;
% zA1 = 0;

% xA2 = 0;
% yA2 = 100;
% zA2 = 0;

% xA3 = 85;
% yA3 = 0;
% zA3 = 0;
%base init
A1 = [xA1;yA1;zA1;];
A2 = [xA2;yA2;zA2;];
A3 = [xA3;yA3;zA3;];
% Define the intermediate variables that are needed for calculations
k2 = sqrt(ye^2 + ze^2);
alf = atan(-ye / ze);
k3 = atan((xe - xA2) / ((ze - zA2) * cos(alf) - (ye - yA2) * sin(alf)));
% Let's make a homogeneous matrix for the platform
T_pl = [
    cos(k3) 0 sin(k3) xe;
    sin(alf) * sin(k3) cos(alf) -sin(alf) * cos(k3) ye;
    -cos(alf) * sin(k3) sin(alf) cos(alf) * cos(k3) ze;
    0 0 0 1;
    ]
% Let's make a homogeneous matrix for a small mechanism
% q4-rotation of the first Joint
A_EndEff_FIRST = [
            cos(q4) -sin(q4) 0 0;
            sin(q4) cos(q4) 0 0;
            0 0 1 L1;
            0 0 0 1;
            ]
% q5-rotate the first Joint
A_First_Second = [
            1 0 0 0;
            0 cos(q5) -sin(q5) 0;
            0 sin(q5) cos(q5) 0;
            0 0 0 1;
            ]
E_out = [0;L2;0;1;]
Ae = [
    1 0 0 E_out(1);
    0 1 0 E_out(2);
    0 0 1 E_out(3);
    0 0 0 1;
    ]
T_out = T_pl * A_EndEff_FIRST * A_First_Second * Ae;
F_11 = T_out(1,1);
F_12 = T_out(1,2);
F_21 = T_out(2,1);
F_22 = T_out(2,2)
P_1 = T_out(1,4);
P_2 = T_out(2,4);
P_3 = T_out(3,4);
