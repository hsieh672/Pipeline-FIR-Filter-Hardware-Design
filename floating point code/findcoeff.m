clear;
clc;

eqnum = firceqrip('minorder',[0.375 0.5],[0.01 0.01]); % eqnum = vec of coeffs
fvtool(eqnum) % Visualize filter