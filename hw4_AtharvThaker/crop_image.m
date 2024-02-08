function im_out = crop_image(im)
    % crop_image(im) takes an image and crops it by 6% (borders)
    % input "im" is an image
    % output is an image cropped

    if isempty(im)
        im_out = [];
        return;
    end
    
    percent = 0.08;
   
    [rows, cols, ~] = size(im);

    topcol = cols * percent;
    toprow = rows * percent;
    bottomcol = cols * (1 - percent - percent);
    bottomrow = rows * (1 - percent - percent);

    rec = [topcol, toprow, bottomcol, bottomrow];
    
    im_out = imcrop(im, rec);

end
