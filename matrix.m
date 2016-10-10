function [A, b] = matrix(j)
    A = zeros(10, 10);
    b = [];
    for i = 1:10
        A(i,(i+1):10) = exp(i./((i+1):10)).*cos(i.*((i+1):10)).*sin(j);
        A(i,1:(i-1))  = A(1:(i-1),i);
        A(i,i) = (abs(sin(j)))*(i/10) + sum(abs(A(i,1:i-1))) + sum(abs(A(i,i+1:10)));
        b = [b; exp(i/j)*sin(i*j)];
    end
end