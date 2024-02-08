function [points1, points2] = match_points_SIFT(im1, im2)
% [points1, points2] = match_points_SIFT(im1, im2) matches points between
% two images using SIFT features.
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

points1 = detectSIFTFeatures(im1);
points2 = detectSIFTFeatures(im2);

[features1, points1] = extractFeatures(im1, points1);
[features2, points2] = extractFeatures(im2, points2);

matches = matchFeatures(features1, features2);

points1 = points1.Location(matches(:,1), :);
points2 = points2.Location(matches(:,2), :);