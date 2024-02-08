function I = isint(A)

%ISINT Determines which elements of an array are integers.
% I = ISINT(A) returns a logical array, I, of the same size
% as A, with 1s (TRUE) in the locations corresponding to integers
% (i.e., . . . -2 -1 0 1 2 . . . )in A, and 0s (FALSE) elsewhere.
% in must be a numeric array. If A is not numeric, ISINT() returns false
    
    if ~isreal(A)
        I = (imag(A) == complex(0)) & (floor(real(A)) == A);
        return;
    end

    if ~isnumeric(A)
        I = false;
        return;
    end
    
    if isinteger(A)
        I = true(size(A));
        return;
    end
    
    I = (A == floor(A));

end
