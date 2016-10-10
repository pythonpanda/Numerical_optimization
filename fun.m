function [f, i] = fun(x)
    [f, i] = max([-x(1) - 150; 3*x(1) + 2*x(2); 3*x(1) - 2*x(2); 2*x(1) + 5*x(2); 2*x(1) - 5*x(2)]);
end