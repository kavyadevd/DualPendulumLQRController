% Set system parameters
syms M m1 m2 g l1 l2 s t 
A=[0 1 0 0 0 0; 
    0 0 -(m1*g)/M 0 -(m2*g)/M 0;
    0 0 0 1 0 0;
    0 0 -((M+m1)*g)/(M*l1) 0 -(m2*g)/(M*l1) 0;
    0 0 0 0 0 1;
    0 0 -(m1*g)/(M*l2) 0 -(g*(M+m2))/(M*l2) 0];


%declaring the B matrix
B=[0; 1/M; 0; 1/(M*l1); 0; 1/(M*l2)];
M = 1000;
m1 = 100;
m2 = 100;
l1 = 20;
l2 = 10;
g = 10;
F =1;
A = double(subs(A));
B = double(subs(B));
D = 0;
Q=[10000 0 0 0 0 0;
   0 100 0 0 0 0;
   0 0 10 0 0 0;
   0 0 0 1000 0 0;
   0 0 0 0 10 0;
   0 0 0 0 0 1000];
R=0.01;
K=lqr(A,B,Q,R);
x0=[0,0,30,0,60,0,0,0,0,0,0,0];

% Computing observer gain matrix L
% Select appropriate poles
poles = [-1, -1.5, -2, -2.5, -3, -3.5];

%% Case 1: x(t)
% C1 = [1 0 0 0 0 0];
% % Calculating L matrix
% L1 = place(A',C1',poles)' %L1 should be a 6x1 matrix
% t = 0.01:0.01:50;
% At1 = [(A-B*K) B*K;
%         zeros(size(A)) (A-L1*C1)];
% Bt1 = [B;zeros(size(B))];
% Ct1 = [C1 zeros(size(C1))];
% sys1 = ss(At1,Bt1,Ct1,0);
% figure
% lsim(sys1,zeros(size(t)),t,x0);
% 
% title('Linear Results Luenberger observer')
% xlabel('Time (sec)')
% ylabel('State')

%% Case 3: x(t), th2(t)  
% C3 = [1 0 0 0 0 0; 0 0 0 0 1 0];
% % Calculating L matrix
% L3 = place(A',C3',poles)' %L3 should be a 6x2 matrix
% 
% t = 0.01:0.01:50;
% At3 = [(A-B*K) B*K;
%         zeros(size(A)) (A-L3*C3)];
% Bt3 = [B;zeros(size(B))];
% Ct3 = [C3 zeros(size(C3))];
% sys3 = ss(At3,Bt3,Ct3,0);
% lsim(sys3,zeros(size(t)),t,x0);
% % 
% title('Linear Results Luenberger observer')
% xlabel('Time (sec)')
% ylabel('State')


%% Case 4: x(t), th1(1), th2(t) 
C4 = [1 0 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 1 0];
% Calculating L matrix
L4 = place(A',C4',poles)' %L3 should be a 6x2 matrix

t = 0.01:0.01:50;
At4 = [(A-B*K) B*K;
        zeros(size(A)) (A-L4*C4)];
Bt4 = [B;zeros(size(B))];
Ct4 = [C4 zeros(size(C4))];
sys4 = ss(At4,Bt4,Ct4,0);
figure
lsim(sys4,zeros(size(t)),t,x0);
% 
title('Linear Results Luenberger observer')
xlabel('Time (sec)')
ylabel('State')


