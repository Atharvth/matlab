%% Test real even and odd numbers
array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
out = iseven(array);
assert(isequal([0, 1, 0, 1, 0, 1, 0, 1, 0, 1], out));

%% Test real odd only numbers
array = [737821, 7721, 9821, 29821, 840921];
out = iseven(array);
assert(isequal([0, 0, 0, 0, 0], out));

%% Test real even only numbers
array = [2, 200, 600, 83982, 748273900];
out = iseven(array);
assert(isequal([1, 1, 1, 1, 1], out));

%% Test not real odd only numbers
array = complex([2+3i, 3+2i, 3+3i]);
out = iseven(array);
assert(isequal([0, 0, 0], out));

%% Test not real even only numbers
array = complex([2+0i, 2+2i, 3+2i, 3+0i]);
out = iseven(array);
assert(isequal([1, 0, 0, 0], out));

