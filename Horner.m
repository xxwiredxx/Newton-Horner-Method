%-------------------------------------------------------------------------%
%               =============== REFFERENCE ===============                %
%                                                                         %
% (ref:1)- length() returns the length of object array or vector.         %
%                                                                         %
% (ref:2)- zeros() creates an array of zeros. m,n or [m n] specifies size %
%  as an m-by-n matrix.                                                   %
%                                                                         %
% (ref:3)- "end" checks and returns the current size of an array.         %
%                                                                         %
%-------------------------------------------------------------------------%

function [y,b] = Horner(a,x)
    % fprintf('Horners Method');              % For debugging
    n = length(a) - 1; % length(ref:1)
    % fprintf('\nn    = %2d\n',n);)           % For debugging
    b = zeros(n+1,1);  % zeros(ref:2)
    b(1) = a(1);
    % fprintf('x    = %2d\n',z);)             % For debugging
    % fprintf('\na^(0)= %2d\n', a(1));)       % For debugging
    
    for j=2:n+1
        % fprintf('a^(%d)= %2d\n',j-1,a(j));) % For debugging
        b(j) = a(j) + b(j-1)*x;
    end % End of for loop j=2:n+1
    
    y=b(n+1);     % Sets y to the value in the array b at index n+1
                  % end(ref:3)
    b=b(1:end-1); % Sets b to a created array b starting at 1 to end-1
return