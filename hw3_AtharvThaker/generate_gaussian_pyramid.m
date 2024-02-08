function pyramid = generate_gaussian_pyramid(image)

% generate_gaussian_pyramind generates all the pyraminds up
% to the one pixel image.
% pyramid returns an array of images for every level

    if isempty(image)
        pyramid{1} = image;
        return;
    end

    if size(image, 3) == 3
        image = rgb2gray(image);
    end

    % adds the original image to the start of the pyramid
    pyramid{1} = image;

    while size(image, 1) > 1 || size(image, 2) > 1

        % blurs image & overwrites the old image
        image = imgaussfilt(image, 1);

        % get every other pixel, to make image smaller
        image = image(1:2:end, 1:2:end);

        % add the last created image to the pyramid
        pyramid{end + 1} = image;

    end
end



