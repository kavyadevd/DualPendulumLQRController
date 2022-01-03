%% Part D(b) - Non-Linear Calculations
%clearing all previous outputs
clear all
clc
y0 = [1, 0, 20, 0, 10, 0];
tspan = 0:0.01:5000;%defining the timespan
[t1,y1] = ode45(@nonlinear,tspan,y0);
%for non-linear systems
plot(t1,y1)
grid on

