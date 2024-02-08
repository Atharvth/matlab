%% Test empty image
im = [];
[r, g, b] = split_rgb(im);

assert(isempty(r));
assert(isempty(g));
assert(isempty(b));

%% Test single row
im = zeros(1, 100);
[r, g, b] = split_rgb(im);

assert(isempty(r));
assert(isempty(g));
assert(isempty(b));

%% Test two rows
im = zeros(2, 100);
[r, g, b] = split_rgb(im);

assert(isempty(r));
assert(isempty(g));
assert(isempty(b));

%% Test grayscale image with height divisible by 3
im = zeros(300, 100);
[r, g, b] = split_rgb(im);
assert(all(size(r) == size(g)));
assert(all(size(r) == size(b)));
assert(size(r, 2) == size(im, 2));
assert(size(g, 2) == size(im, 2));
assert(size(b, 2) == size(im, 2));
assert(size(im, 1) - size(r, 1) - size(g, 1) - size(b, 1) < 3);

%% Test gratscale image with height not divisible by 3
im = zeros(301, 100);
[r, g, b] = split_rgb(im);
assert(all(size(r) == size(g)));
assert(all(size(r) == size(b)));
assert(size(r, 2) == size(im, 2));
assert(size(g, 2) == size(im, 2));
assert(size(b, 2) == size(im, 2));
assert(size(im, 1) - size(r, 1) - size(g, 1) - size(b, 1) < 3);

%% Test rgb image with height divisible by 3
im = zeros(300, 100, 3);
[r, g, b] = split_rgb(im);
assert(all(size(r) == size(g)));
assert(all(size(r) == size(b)));
assert(size(r, 2) == size(im, 2));
assert(size(g, 2) == size(im, 2));
assert(size(b, 2) == size(im, 2));
assert(size(im, 1) - size(r, 1) - size(g, 1) - size(b, 1) < 3);


%% Test rgb image with height not divisible by 3
im = zeros(302, 100, 3);
[r, g, b] = split_rgb(im);
assert(all(size(r) == size(g)));
assert(all(size(r) == size(b)));
assert(size(r, 2) == size(im, 2));
assert(size(g, 2) == size(im, 2));
assert(size(b, 2) == size(im, 2));
assert(size(im, 1) - size(r, 1) - size(g, 1) - size(b, 1) < 3);
