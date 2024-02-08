function [points1, points2] = match_points(im1, im2)
    % match_points_SIFT detects all the features on an image
    % and matches them to another image closley using the
    % detectSIFTFeatures function / SIFT method
    % points1 and points2 returns the points that collerate with each other

    if size(im1) == 0
        points1 = [];
        points2 = [];
        return;
    end

    if size(im2) == 0
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

    points1 = detectSIFTFeatures(im1);
    points2 = detectSIFTFeatures(im2);
    
    [features1, points1] = extractFeatures(im1, points1);
    [features2, points2] = extractFeatures(im2, points2);
    
    matches = matchFeatures(features1, features2);
    
    points1 = points1.Location(matches(:,1), :);
    points2 = points2.Location(matches(:,2), :);

end

