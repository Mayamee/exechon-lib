q1=30;q2=30;q3=30;q4=30;
q1 = deg2rad(q1);q2 = deg2rad(q2);q3 = deg2rad(q3); q4 = deg2rad(q4);
baseframe = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
A1 = 175; A2 = 236.28; A3 = 65; A4 = 250; A5_over = 150;
frame1 = baseframe * Pz(A1)*Py(-0.17) * ROx(q1);
frame2 = frame1 * Pz(A2) * ROy(-q2);
frame3 = frame2 * Pz(A3) * ROz(q3);
frame4 = frame3 * Pz(A4) * ROy(-q4);
frame5 = frame4 * Pz(A5_over);
% over потому что для работы достаточно 4 фрейма