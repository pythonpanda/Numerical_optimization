function [f_cp, s]=Grad(x0,p);
%Input:-  Initlizing vector x0,p- Iteration number;
%Gradient - s

A=zeros(10,10); b=zeros(1,10); x=x0;f=zeros(1,p);
C=zeros(10,10);D=zeros(10,10);
for j=1:p
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
        D=C+A;

    f(1,j)=x'*D*x+b*x;
end
f0=max(f);


end


    

