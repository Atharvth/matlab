function pyramid = generate_gaussian_pyramid(im)
% pyramid = generate_gaussian_pyramid(im) generate the Gaussian pyramid
% from an image.
%
% im is an RGB or a grayscale image
% pyramid is a cell array containing the levels of the Gaussian pyramid.

if isempty(im)
    pyramid = {};
    return;
end

if size(im, 3) == 1
    level = im;
else 
    level = rgb2gray(im);
end

pyramid = {level};
while min(size(level)) > 1
    level = imgaussfilt(level, 1);
    level = level(1:2:end, 1:2:end);
    pyramid{end+1} = level;
end