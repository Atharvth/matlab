function E = iseven(A)

%ISEVEN Determines which elements of an array are even numbers.
% E = ISEVEN(A) returns a logical array, E, of the same size as A,
% with 1s (TRUE) in the locations corresponding to even numbers
% (i.e., . . . -3, -1, 0, 2, 4, . . . )in A, and 0s (FALSE) elsewhere.
% A must be a numeric array. If A is not numeric, ISEVEN() returns false.
    
    if ~isnumeric(A)
        E = false;
        return;
    end

    E = (complex(0) == imag(A)) & (mod(real(A), 2) == 0);
   
end