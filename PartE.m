% Set system parameters
syms M m1 m2 g l1 l2 s t 
A=[0 1 0 0 0 0; 
    0 0 -(g * m1)/M 0 -(g*m2)/M 0;
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

A = double(subs(A));

B = double(subs(B));
Q=[10000 0 0 0 0 0;
   0 100 0 0 0 0;
   0 0 10 0 0 0;
   0 0 0 1000 0 0;
   0 0 0 0 10 0;
   0 0 0 0 0 1000];
R=0.01;
%% Checking Observability 
%% Case 1: x(t)
C1 = [1 0 0 0 0 0];
obsv1 = obsv(A,C1);
if rank(obsv1) == 6
    disp("Matrix is Observable")
else
    disp("Matrix is not obeservable")
end

%% Case 2: th1(t), th2(t) 
C2 = [0 0 1 0 0 0; 0 0 0 0 1 0];
obsv2 = obsv(A,C2);
if rank(obsv2) == 6
    disp("Matrix is Observable")
else
    disp("Matrix is not obeservable")
end

%% Case 3: x(t), th2(t) 
C3 = [1 0 0 0 0 0; 0 0 0 0 1 0];
obsv3 = obsv(A,C3);
if rank(obsv3)==6
    disp("Matrix is Observable")
else
    disp("Matrix is not obeservable")
end

%% Case 4: x(t), th1(1), th2(t) 
C4 = [1 0 0 0 0 0; 0 0 1 0 0 0; 0 0 0 0 1 0];
obsv4 = obsv(A,C4);
if rank(obsv4) == 6
    disp("Matrix is Observable")
else
    disp("Matrix is not obeservable")
end
