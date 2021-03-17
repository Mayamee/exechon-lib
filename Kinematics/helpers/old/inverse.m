function [Q] = inverse(F2,P_real)
F1 = [1;1;1;];
F3 = [1;1;1;];
R_real = [F1 F2 F3];
T_real = [R_real P_real; 0 0 0 1];
opts = optimoptions(@fsolve,'Display','off','MaxFunEvals',25000000, 'MaxIter',25000000,'TolFun',1E-10,'TolX',1E-10);
f = @(x)[
     x(1) - (150*cos(x(5))*sin(x(4)))/(x(1)^2/(x(3)/(x(2)^2/x(3)^2 + 1)^(1/2) + (x(2)*(x(2) - 100))/(x(3)*(x(2)^2/x(3)^2 + 1)^(1/2)))^2 + 1)^(1/2) + (x(1)*(150*sin(x(5)) + 125))/((x(1)^2/(x(3)/(x(2)^2/x(3)^2 + 1)^(1/2) + (x(2)*(x(2) - 100))/(x(3)*(x(2)^2/x(3)^2 + 1)^(1/2)))^2 + 1)^(1/2)*(x(3)/(x(2)^2/x(3)^2 + 1)^(1/2) + (x(2)*(x(2) - 100))/(x(3)*(x(2)^2/x(3)^2 + 1)^(1/2)))) - T_real(1, 4);
     x(2) + (150*cos(x(4))*cos(x(5)))/(x(2)^2/x(3)^2 + 1)^(1/2) + (x(2)*(150*sin(x(5)) + 125))/(x(3)*(x(1)^2/(x(3)/(x(2)^2/x(3)^2 + 1)^(1/2) + (x(2)*(x(2) - 100))/(x(3)*(x(2)^2/x(3)^2 + 1)^(1/2)))^2 + 1)^(1/2)*(x(2)^2/x(3)^2 + 1)^(1/2)) + (150*x(1)*x(2)*cos(x(5))*sin(x(4)))/(x(3)*(x(1)^2/(x(3)/(x(2)^2/x(3)^2 + 1)^(1/2) + (x(2)*(x(2) - 100))/(x(3)*(x(2)^2/x(3)^2 + 1)^(1/2)))^2 + 1)^(1/2)*(x(3)/(x(2)^2/x(3)^2 + 1)^(1/2) + (x(2)*(x(2) - 100))/(x(3)*(x(2)^2/x(3)^2 + 1)^(1/2)))*(x(2)^2/x(3)^2 + 1)^(1/2)) - T_real(2, 4);
     x(3) + (150*sin(x(5)) + 125)/((x(1)^2/(x(3)/(x(2)^2/x(3)^2 + 1)^(1/2) + (x(2)*(x(2) - 100))/(x(3)*(x(2)^2/x(3)^2 + 1)^(1/2)))^2 + 1)^(1/2)*(x(2)^2/x(3)^2 + 1)^(1/2)) - (150*x(2)*cos(x(4))*cos(x(5)))/(x(3)*(x(2)^2/x(3)^2 + 1)^(1/2)) + (150*x(1)*cos(x(5))*sin(x(4)))/((x(1)^2/(x(3)/(x(2)^2/x(3)^2 + 1)^(1/2) + (x(2)*(x(2) - 100))/(x(3)*(x(2)^2/x(3)^2 + 1)^(1/2)))^2 + 1)^(1/2)*(x(3)/(x(2)^2/x(3)^2 + 1)^(1/2) + (x(2)*(x(2) - 100))/(x(3)*(x(2)^2/x(3)^2 + 1)^(1/2)))*(x(2)^2/x(3)^2 + 1)^(1/2)) - T_real(3, 4);
    (x(1)*sin(x(5)))/((x(1)^2/(x(3)/(x(2)^2/x(3)^2 + 1)^(1/2) + (x(2)*(x(2) - 100))/(x(3)*(x(2)^2/x(3)^2 + 1)^(1/2)))^2 + 1)^(1/2)*(x(3)/(x(2)^2/x(3)^2 + 1)^(1/2) + (x(2)*(x(2) - 100))/(x(3)*(x(2)^2/x(3)^2 + 1)^(1/2)))) - (cos(x(5))*sin(x(4)))/(x(1)^2/(x(3)/(x(2)^2/x(3)^2 + 1)^(1/2) + (x(2)*(x(2) - 100))/(x(3)*(x(2)^2/x(3)^2 + 1)^(1/2)))^2 + 1)^(1/2) - T_real(1, 2);
    (cos(x(4))*cos(x(5)))/(x(2)^2/x(3)^2 + 1)^(1/2) + (x(2)*sin(x(5)))/(x(3)*(x(1)^2/(x(3)/(x(2)^2/x(3)^2 + 1)^(1/2) + (x(2)*(x(2) - 100))/(x(3)*(x(2)^2/x(3)^2 + 1)^(1/2)))^2 + 1)^(1/2)*(x(2)^2/x(3)^2 + 1)^(1/2)) + (x(1)*x(2)*cos(x(5))*sin(x(4)))/(x(3)*(x(1)^2/(x(3)/(x(2)^2/x(3)^2 + 1)^(1/2) + (x(2)*(x(2) - 100))/(x(3)*(x(2)^2/x(3)^2 + 1)^(1/2)))^2 + 1)^(1/2)*(x(3)/(x(2)^2/x(3)^2 + 1)^(1/2) + (x(2)*(x(2) - 100))/(x(3)*(x(2)^2/x(3)^2 + 1)^(1/2)))*(x(2)^2/x(3)^2 + 1)^(1/2)) - T_real(2, 2);];
x0 = [100 100 200 0.5 0.5];
SOL = fsolve(f,x0,opts);
xe = SOL(1);
ye = SOL(2);
ze = SOL(3);
xA1 = -85;
yA1 = 0;
zA1 = 0;
A1 = [xA1;yA1;zA1;];
xA2 = 0;
yA2 = 100;
zA2 = 0;
A2 = [xA2;yA2;zA2;];
xA3 = 85;
yA3 = 0;
zA3 = 0;
A3 = [xA3;yA3;zA3;];
d_B1B3 = 130;
de = 65;
alf = atan(-ye/ze);
k3 = atan((xe-xA2)/((ze-zA2)*cos(alf)-(ye-yA2)*sin(alf)));
B1 = [
    xe-d_B1B3*cos(k3)/2;
    ye-d_B1B3*sin(alf)*sin(k3)/2;
    ze+d_B1B3*cos(alf)*sin(k3)/2;
];
B3 = [
    xe+d_B1B3*cos(k3)/2;
    ye+d_B1B3*sin(alf)*sin(k3)/2;
    ze-d_B1B3*cos(alf)*sin(k3)/2;
];
B2 = [
    xe;
    ye+de*cos(alf);
    ze+de*sin(alf);
];
Q1= sqrt((A1(1)-B1(1))^2+(A1(2)-B1(2))^2+(A1(3)-B1(3))^2);
Q2= sqrt((A2(1)-B2(1))^2+(A2(2)-B2(2))^2+(A2(3)-B2(3))^2);
Q3= sqrt((A3(1)-B3(1))^2+(A3(2)-B3(2))^2+(A3(3)-B3(3))^2);
Q4 = SOL(4);
Q5 = SOL(5);
Q = [Q1 Q2 Q3 Q4 Q5];
end
