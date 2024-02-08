function [points1, points2] = match_points_SIFT(im1, im2)

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

    im1 = im2double(im1);
    im2 = im2double(im2);

    p1 = detectSIFTFeatures(im1);
    [image1detections, validp1] = extractFeatures(im1, p1);

    p2 = detectSIFTFeatures(im2);
    [image2detections, validp2] = extractFeatures(im2, p2);

    pairedarray = matchFeatures(image1detections, image2detections);

    points1 = validp1(pairedarray(:, 1)).Location;
    points2 = validp2(pairedarray(:, 2)).Location;

end


