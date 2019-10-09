%-------------------------------------------------------------------------%
%               =============== REFFERENCE ===============                %
%                                                                         %
% (ref:1)- nargin returns the number of function input arguments given in %
% the call to the currently executing function.  When using an arguments  %
% validation block, the value returned by nargin within a function is the %
% number of positional arguments provided when the function is called.    %
%                                                                         %
% (ref:2)- length() returns the length of object array or vector.         %
%                                                                         %
% (ref:3)- zeros() creates an array of zeros. m,n or [m n] specifies size %
%  as an m-by-n matrix.                                                   %
%                                                                         %
% (ref:4)- abs() returns the absolute value of the variable.              %
%                                                                         %
%-------------------------------------------------------------------------%

function [roots,iter]=NewtonHorner(a,x0,tol,nmax)
    % If tol and nmax is not passed a default will be assigned.
    if nargin == 2 % nargin(ref:1)
        fprintf('tol & nmax not passed. Set tol=1.e-04 & nmax=100.')
        tol  = 1.e-04;
        nmax = 100;
        
    elseif nargin == 3 % If nmax is not passed a default will be assigned.
        fprintf('nmax not passed. Set nmax=100.')
        nmax = 100;
    end % End of if statements

    n     = length(a)-1; % length(ref:2)
    roots = zeros(n,1);  % zeros (ref:3)
    iter  = zeros(n,1);  % creates a n-by-1 matrix

    for k = 1:n % Loop from 1 to n where k = the iteration number
        % Newton iterations
        iter2 = 0;       % Initializing the iteration to 0
        xn    = x0;      % Initializing the Xn variable to x0
        diff  = tol + 1; % Initializing the diff larger than the tol
        
        while iter2 < nmax && diff >= tol % Loops while within tol and nmax
            [f,b]      = Horner(a,xn);      % Call to Horner function
            [fprime,~] = Horner(b,xn);      % Call to Horner function
            xnPlusOne  = xn - f/fprime;
            diff       = abs(xnPlusOne-xn); % abs(ref:4)
            iter2      = iter2 + 1;         % Incrementer, increasing by 1
            xn         = xnPlusOne;
        end % End of the while loop
        
        if iter2 == nmax % Error notification if convergence fails
            fprintf('Failed convergence with set number of iterations.');
        end % End of if statements
        
        %Deflation
        [~,a]    = Horner(a,xn); % Call to Horner function
        roots(k) = xn;    % Setting root xn in the roots array at index k
        iter(k)  = iter2; % Setting iter count in iter array at index k
    end % End of main loop for k = 1:n
return