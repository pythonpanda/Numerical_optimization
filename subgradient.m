function [f, x, k] = subgradient(x, tol)
    k = 0;
    f = fun(x);
    while f > tol - 100
        s = subgrad(x);
        d = -s/norm(s, 2);
        t = (f + 100)/norm(s);
        x = x + d*t;
        k = k + 1;
        f = fun(x);
    end
end