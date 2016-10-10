function [f1,s1] = fun( x0)
%  Function to calculate the subgradient and function value for ex 6.3
% Input: x0:- Initilizing (10x1) vector.
%Output: Function valye f1 and corresposding subgradient s1;
%Prepared by Abhishek Awasthi,Ganesh Sivaraman, Olena Burkovska & Sreedhar
%Saseendran Kumar.

%.............Memory Allocation............................... 

A=zeros(10,10); b=zeros(1,10); x=zeros(10,1);f=zeros(1,5);
C = zeros(10,10);D = zeros(10,10);s=zeros(10,5);f1=0;s1=zeros(10,1);

%............Function & subgradient Caulcation part..................................
for j=1:5
    for i=1:10
        b(1,i)=exp(i/j)*sin(i*j);
        for k=1:10;
        if(i<k)
            A(i,k)=exp(i/k)*cos(i*k)*sin(j);
            
        elseif(i>k)
            A(i,k)=exp(k/i)*cos(i*k)*sin(j);
            
       
        end
        end
    end 
        C=diag(sum(abs(A')));   
        for i=1:10
            for k=1:10
                if(i==k)
                    A(i,k)=abs(sin(j))*(i/10);
                end
            end
        end
        D=C+A
    x=x0;
    f(1,j)=x'*D*x+b*x;
    s(:,j)=(x'*D'+x'*D+b)';
   
    [f1,I]=max(f); %Passing maximum value of function.
    s1=s(:,I);    %Passing  subgradient.
   
end
end

