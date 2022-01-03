% Set system parameters
syms M m1 m2 g l1 l2 s t 
A=[0 1 0 0 0 0; 
    0 0 -(m1*g)/M 0 -(m2*g)/M 0;
    0 0 0 1 0 0;
    0 0 -((M+m1)*g)/(M*l1) 0 -(m2*g)/(M*l1) 0;
    0 0 0 0 0 1;
    0 0 -(m1*g)/(M*l2) 0 -(g*(M+m2))/(M*l2) 0];


% B matrix :
B=[0; 1/M; 0; 1/(M*l1); 0; 1/(M*l2)];

M = 1000;
m1 = 100;
m2 = 100;
l1 = 20;
l2 = 10;
g = 10;

A = double(subs(A));

B = double(subs(B));
disp(A);
disp(B);

%% LQR Design
%%

Q=[10000 0 0 0 0 0;
   0 100 0 0 0 0;
   0 0 10 0 0 0;
   0 0 0 1000 0 0;
   0 0 0 0 10 0;
   0 0 0 0 0 1000];
R=0.01;

%% LQR output
Kr = lqr(A,B,Q,R);
disp(Kr);


%% Lyapunov's Indirect Method for stability check
Ac = A-B*Kr;
%% checking poles of Ac
pole = eigs(Ac);
disp(pole);

%% Plotting Results
C = eye(size(A));
D = 0;
init_state = [1, 0, 20, 0, 10, 0];
sys_close = ss(Ac, B, C, D);
[y,t,x] = initial(sys_close, init_state);
hold on
plot(t(:,1),y(:,5))
legend theta2 
title 'Step response of LQR Controller Qx=10000, Qth1=10, Qth2=10 , R=0.01'
hold off
% tspan = 0:0.1:100;
% q0 = [2 0 deg2rad(17) 0 deg2rad(30) 0];
% [t,q1] = ode45(@(t,q)linear(t,q,-Kr*q),tspan,q0);
% figure(1);
% hold on
% plot(t,q1(:,1))
% plot(t,q1(:,3))
% plot(t,q1(:,5))
% ylabel('state variables')
% xlabel('time (sec)')
% title('Linear system using LQR controller')
% legend('x','theta1','theta2')
