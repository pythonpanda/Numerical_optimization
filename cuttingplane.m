function [x_min f_min]= cuttingplane(x0)
%Function to solve Ex 6.3 by implementing a cutting plane algorithm.
%Input:- Initializing vector:- x0 as a (10x1) matrix.
%Output:- The minima f_min & minimizer x_min.
%Prepared by Abhishek Awasthi,Ganesh Sivaraman, Olena Burkovska & Sreedhar
%Saseendran Kumar.
%..........................Initialization.................................
[f0 s]=fun(x0);k=0;
f_cp = [zeros(1,10),1];
A = [s',-1];
b = (sum(s.*x0))-f0;
lb = [-ones(1,10),-inf];
ub = [ones(1,10),inf];
options = optimset('Display','off','TolCon',1e-5,'MaxIter',500);
[x0,fcp] = linprog(f_cp,A,b,[],[],lb,ub,x0,options);
x0 = x0(1:10);
fval = f0;

%...................CP Algorithm ..........................................
while(and((f0-fcp>.00001),(k<750)))
    
   [f0,s]=fun(x0);
   f_cp = [zeros(1,10),1];
    A = [A;[s',-1]];
    b = [b,(sum(s.*x0))-f0];
    lb = [-ones(1,10),-inf];
    ub = [ones(1,10),inf];
    options = optimset('Display','off','TolCon',1e-5);
    [x0,fcp] = linprog(f_cp,A,b',[],[],lb,ub,x0,options); %Solving subproblem.
    x0 = x0(1:10);
    fval = [fval,f0];
    k = k+1;
end
k      %Display iteration number.
x_min=x0;
f_min=f0;
%........................Plotting.........................................
figure(1)
xlabel('Iteration Number-k')
ylabel('Function value')
title('Function value vs Iteration Number')
hold on;grid on;
plot(fval,'-bs','LineWidth',1.5,'MarkerEdgeColor','y','MarkerFaceColor','g','MarkerSize',5)
p = plot(k,f0,'*');
set(p,'Color','violet');
hold off;

end
