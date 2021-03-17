clc;clear;init();
OUTPOINT = [-150;100;470];
disp = 'off';% iter or off
W = xoy_inverse(OUTPOINT,disp)
% L1 L2 L3 Q1 Q4(in radians)
V = forward(W,disp)