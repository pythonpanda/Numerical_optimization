function [F g]= fungrad(x)
    f(1)= -100;    
    f(2)= 3*x(1) + 2*x(2);
    f(3)= 3*x(1) - 2*x(2);
    f(4)= 2*x(1)+5*x(2);
    f(5)= 2*x(1) -5*x(2);
    [F i]=max(f);
    if i==1
        g=[0;0];
    elseif i==2
        g=[3;2];
    elseif i==3
        g=[3;-2];
    elseif i==4
        g=[2;5];
    else
        g=[2;-5];
end