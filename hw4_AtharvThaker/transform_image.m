function im_out = transform_image(im, tform)
    % transform_image(im, tform) transform "im" using "tform" class variables
    %
    % input im is an image
    % input tform is result of the estimate_transform function written
    %
    % output im_out is done using imwrap function
    % it is an image that is transformed using the tform input

    if isempty(im)
        im_out = [];
        return;
    end
    
    im_out = imwarp(im, tform, 'OutputView', imref2d(size(im)));

end

