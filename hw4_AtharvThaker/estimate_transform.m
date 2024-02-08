function tform = estimate_transform(points1, points2)
    % estimate_transform(points1, points2) estimates how the transformation the image
    % must be transformed in order to match the other image
    % 
    % error will be thrown is points are empty
    % error will be thrown if both inputs do not have similar number of points
    % 
    % input is 2 sets of points, MUST BE SAME NUMBER OF POINTS, NOT EMPTY
    % output is tform class, contains what image must transform to be equal
    % to the other image
    
    if isempty(points1) || isempty(points2)
        error('image is empty');
    end
    
    if ~isequal(size(points1, 1), size(points2, 1))
        error('number of points in both images should be equal');
    end
    
    tform = estgeotform2d(points2, points1, 'similarity');

end
