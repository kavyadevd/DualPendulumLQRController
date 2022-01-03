%% Part G LQG linear 
%Substituting values for our M, m1, m2, l1 and l2
M = 1000;
m1 = 100;
m2 = 100;
l1 = 20;
l2 = 10;
g = 10;

%Defining our matrices as follows
A=[0 1 0 0 0 0; 
    0 0 -(g*m1)/M 0 -(g*m2)/M 0;
    0 0 0 1 0 0;
    0 0 -(g*(M+m1))/(M*l1) 0 -(g*m2)/(M*l1) 0;
    0 0 0 0 0 1;
    0 0 -(m1*g)/(M*l2) 0 -(g*(M+m2))/(M*l2) 0];
B=[0; 1/M; 0; 1/(M*l1); 0; 1/(M*l2)];
% Cosidering the same Q and R matrices chosen before in our code
Q=[100 0 0 0 0 0;
   0 100 0 0 0 0;
   0 0 1000 0 0 0;
   0 0 0 1000 0 0;
   0 0 0 0 1000 0;
   0 0 0 0 0 1000];
R=0.001; 
C1 = [1 0 0 0 0 0];  
D = 0; 
% Initial Conditions for Leunberger observer 
x0 = [1;0;20; 0; 10; 0;0;0;0;0;0;0];
K =lqr(A,B,Q,R);
vd=0.3*eye(6); %process noise
vn=0.1; %measurement noise
Kn=lqr(A',C1',vd,vn)'; %gain matrix of kalman filter for C1
% Observing state C1
sys1 = ss([(A-B*K) B*K; zeros(size(A)) (A-Kn*C1)], [B;zeros(size(B))],[C1 zeros(size(C1))], D);
figure
initial(sys1,x0)
figure
step(sys1)

grid on
