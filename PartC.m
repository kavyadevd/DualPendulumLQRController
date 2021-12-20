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


disp("Controllability matrix =");
CTRB = [B A*B (A^2)*B (A^3)*B (A^4)*B (A^5)*B];
Ct = det(CTRB);
disp("Finding the determinant of the controllability matrix=");
%simplifying to check for the condition in which the matrix isn't
%controllable
disp(Ct);
