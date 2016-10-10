function [gradient] = grad(j, x)
  switch j
      case 1
          gradient = [-1; 0];
      case 2
          gradient = [3;  2]; 
      case 3
          gradient = [3; -2]; 
      case 4
          gradient = [2;  5]; 
      case 5
          gradient = [2; -5]; 
  end
end