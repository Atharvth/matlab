function [points1, points2] = match_points_KLT(im1, im2)
% [points1, points2] = match_points_KLT(im1, im2) matches points between
% two images using Kanade-Lucas-Tomasi optical flow algorithm.
%
% im1 and im2 are two RGB or grayscale images
% points1 and points2 are M-by-2 matrices containing the coordinates of
% matched points.

if isempty(im1) || isempty(im2)
    points1 = zeros(0, 2);
    points2 = zeros(0, 2);
    return;
end

if size(im1, 3) > 1
    im1 = rgb2gray(im1);
end

if size(im2, 3) > 1
    im2 = rgb2gray(im2);
end

points1 = detectHarrisFeatures(im1);
points1 = points1.Location;

if isempty(points1)
    points2 = zeros(0, 2);
    return;
end

tracker = vision.PointTracker('MaxBidirectionalError', 1);
initialize(tracker, points1, im1);
[points2, validity] = tracker(im2);

points1 = points1(validity, :);
points2 = points2(validity, :);
