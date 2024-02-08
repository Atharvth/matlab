%% 1: same points (transform_image)
img1 = [1, 2; 3, 4; 5, 6];
img2 = [1, 2; 3, 4; 5, 6];
tform = estimate_transform(img1, img2);
final = transform_image(img2, tform);
assert(isequal(final, img1)); 

%% 2: shift image 180 degrees & 5 on x-axis (transform_image)
img1 = [1, 2; 3, 4; 5, 6];
img2 = imrotate(img1, 180);
img2 = img2 + [5, 0];

tform = estimate_transform(img1, img2);

final = transform_image(img2, tform);
assert(isequal(size(img1), size(final)));
