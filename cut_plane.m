function [min_f, x, k] = cut_plane(x, tol)

       k = 0;
       A = [];
       b = [];
       lb = [-1000*ones(2, 1);     -Inf];
       ub = [1000*ones(2, 1);       Inf];
       f =  [zeros(2, 1); 1];

        while 1
         
            s = subgrad(x);  
            A = [A; s', -1];
            b = [b; sum(s.*x) - fun(x)];
            
            options = optimset('Display','off','TolCon',1e-5);
            [x, f_cp, exitflag] = linprog(f, A, b, [], [], lb, ub, x, options);
            x = x(1:2);
            
            k = k + 1;
            
            if k > 500 || fun(x) - f_cp < tol
                break;
            end
            
        end
        min_f = fun(x);           
 end