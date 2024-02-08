function [points1, points2] = match_points_KLT(im1, im2)

% match_points_KLT detects all the features on an image
% and matches them to another image closley using the
% detectHarrisFeatures function / KLT method
% points1 and points2 returns the points that collerate with each other

    if isempty(im1)
        points1 = [];
        points2 = [];
        return;
    end

    if isempty(im2)
        points1 = [];
        points2 = [];
        return;
    end

    if size(im1, 3) == 3
        im1 = rgb2gray(im1);
    end
    
    if size(im2, 3) == 3
        im2 = rgb2gray(im2);
    end

    im1 = im2double(im1);
    im2 = im2double(im2);
    
    % find points from image 1 using the harris features alg
    points1 = detectHarrisFeatures(im1);
    
    % handles if image is blank, then return empty arrays
    if isempty(points1)
        points2 = [];
        return; 
    end
    
    % create vision point tracker to check for img2
    visionPointTracker = vision.PointTracker('MaxBidirectionalError', 1);
    
    % init the tracker from image1 and find points in the image2
    initialize(visionPointTracker, points1.Location, im1);
    [points2, validp] = step(visionPointTracker, im2);
    
    % take points out that aren't valid, make array of only found points
    points1 = points1(validp, :);
    points2 = points2(validp, :);
    
end



