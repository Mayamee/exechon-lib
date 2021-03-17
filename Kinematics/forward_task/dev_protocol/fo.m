function [SOL] = fo(Q)
	q1 = Q(1);q2 = Q(2);q3 = Q(3);
	xA1 = -85;yA1 = 0;zA1 = 0;
	xA2 = 0;yA2 = 100;zA2 = 0;
	xA3 = 85;yA3 = 0;zA3 = 0;
	d_B1B3 = 130;de = 65;
	opts = optimoptions(@fsolve,'Display','iter','MaxFunEvals',25000000, 'MaxIter',25000000,'FunctionTolerance',1E-10);
	% x0 = [xe ye ze k2 k3 alf];
	x0 = [100 100 200 250 0.5 0.5];
    x0 = [290 290 290 250 0.5 0.5];
	f1 = @(x)[
	(xA1 - (x(1)-d_B1B3*cos(x(5))/2))^2 + (yA1 - (x(2)-d_B1B3*sin(x(6))*sin(x(5))/2))^2 + (zA1 - (x(3)+d_B1B3*cos(x(6))*sin(x(5))/2))^2 - q1^2;
	(xA2 - x(1))^2 + (yA2 - (x(2)+de*cos(x(6))))^2 + (zA2 - (x(3)+de*sin(x(6))))^2 - q2^2;
	(xA3 - (x(1)+d_B1B3*cos(x(5))/2))^2 + (yA3 - (x(2)+d_B1B3*sin(x(6))*sin(x(5))/2))^2 + (zA3 - (x(3)-d_B1B3*cos(x(6))*sin(x(5))/2))^2 - q3^2;
	x(2)^2+x(3)^2 - x(4)^2;
	(-x(2)/x(3)) - tan(x(6));
	(x(1)-xA2)/((x(3)-zA2)*cos(x(6))-(x(2)-yA2)*sin(x(6))) - tan(x(5));
];
	SOL = fsolve(f1,x0,opts);
    k2=SOL(4);k3=SOL(5);alf=SOL(6);
    T_pl = [
    cos(k3) 0 sin(k3) xe;
    sin(alf) * sin(k3) cos(alf) -sin(alf) * cos(k3) ye;
    -cos(alf) * sin(k3) sin(alf) cos(alf) * cos(k3) ze;
    0 0 0 1;
    ];%однородная матрица платформы
    
end