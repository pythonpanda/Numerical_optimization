function [g] = subgrad(x)
    [~, i] = fun(x);
    g = grad(i, x);
end