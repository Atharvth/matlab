%% If one or both images are empty, points should be empty
[points1, points2] = match_points_KLT([], rand(256));
assert(isempty(points1));
assert(isempty(points2));

[points1, points2] = match_points_KLT(rand(256), []);
assert(isempty(points1));
assert(isempty(points2));

[points1, points2] = match_points_KLT([], []);
assert(isempty(points1));
assert(isempty(points2));

%% If one or both images are blank, points should be empty
[points1, points2] = match_points_KLT(zeros(256), rand(256));
assert(isempty(points1));
assert(isempty(points2));

[points1, points2] = match_points_KLT(rand(256), zeros(256));
assert(isempty(points1));
assert(isempty(points2));

[points1, points2] = match_points_KLT(zeros(256), zeros(256));
assert(isempty(points1));
assert(isempty(points2));

%% If the images are the same, points should be the same
im = imread('cameraman.tif');
[points1, points2] = match_points_KLT(im, im);
diffs = abs(points1 - points2);
assert(max(diffs(:)) < 1);

%% If one or both images are RGB, the function works
im = imread('peppers.png');
[points1, points2] = match_points_KLT(im, im);
diffs = abs(points1 - points2);
assert(max(diffs(:)) < 1);

[points1, points2] = match_points_KLT(im, rgb2gray(im));
diffs = abs(points1 - points2);
assert(max(diffs(:)) < 1);

[points1, points2] = match_points_KLT(rgb2gray(im), im);
diffs = abs(points1 - points2);
assert(max(diffs(:)) < 1);