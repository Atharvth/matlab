%% 1. empty image
image = [];
pyramid = generate_gaussian_pyramid(image);
assert(isequal(pyramid{1}, []));

%% 2. 1x1 image
image = 5;
pyramid = generate_gaussian_pyramid(image);
assert(isequal(length(pyramid), 1));
assert(isequal(length(pyramid{1}), 1));

%% 3. 256x256 image
image = rand(256, 256);
pyramid = generate_gaussian_pyramid(image);
assert(isequal(length(pyramid), 9)); 
assert(isequal(length(pyramid{9}), 1));

%% 4. 640x480 image
image = rand(640, 480);
pyramid = generate_gaussian_pyramid(image);
assert(isequal(length(pyramid), 11));
assert(isequal(length(pyramid{11}), 1));

%% 5. RGB image (check if it changes it)
rgbimg = imread('cameraman.tif');
pyramid = generate_gaussian_pyramid(rgbimg);
assert(isequal(length(pyramid), 9));
assert(isequal(length(pyramid{9}), 1));
