%% empty images as inputs (both)
im1 = [];
im2 = [];
[points1, points2] = match_points_KLT(im1, im2);
assert(isempty(points1) && isempty(points2));

%% empty images as img1 input
im1 = randn(100, 100);
im2 = [];
[points1, points2] = match_points_KLT(im1, im2);
assert(isempty(points1) && isempty(points2));

%% empty images as img2 input
im1 = [];
im2 = randn(100, 100);
[points1, points2] = match_points_KLT(im1, im2);
assert(isempty(points1) && isempty(points2));

%% blank input images
im1 = zeros(100, 100);
im2 = zeros(100, 100);
[points1, points2] = match_points_KLT(im1, im2);
assert(isempty(points1) && isempty(points2));

%% blank images as img1 input
im1 = randn(100, 100);
im2 = zeros(100, 100);
[points1, points2] = match_points_KLT(im1, im2);
assert(isempty(points1) && isempty(points2));

%% blank images as img2 input
im1 = zeros(100, 100);
im2 = randn(100, 100);
[points1, points2] = match_points_KLT(im1, im2);
assert(isempty(points1) && isempty(points2));

%% same input image test
im1 = randn(100, 100); 
im2 = im1;
[points1, points2] = match_points_KLT(im1, im2);
d = sum(points1.Location - points2);
d = sqrt(sum(d .* d, 2));
assert(d < 1);

%% rgb to grayscale test (same image test as well)
im1 = imread('test1.jpeg');
im2 = imread('test1.jpeg');
[points1, points2] = match_points_KLT(im1, im2);
assert(~isempty(points1) && ~isempty(points2));
d = sum(points1.Location - points2);
d = sqrt(sum(d .* d, 2));
assert(d < 1);

%% one rgb image and one grayscale image (different images gen)
im1 = cat(3, rand(480, 640), rand(480, 640), rand(480, 640));
im2 = rgb2gray(im1);
[points1, points2] = match_points_KLT(im1, im2);
assert(~isempty(points1) && ~isempty(points2));
