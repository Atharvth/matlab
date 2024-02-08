img = imread('testimg2.jpeg');

% detect face
faceDetector = vision.CascadeObjectDetector();
bbox = step(faceDetector, img);

% apply blur
for i = 1:size(bbox, 1)

    face = imcrop(img, bbox(i, :));
    face = imgaussfilt(face, 10);
    img(bbox(i, 2):bbox(i, 2)+bbox(i, 4), bbox(i, 1):bbox(i, 1)+bbox(i, 3), :) = face;
    
end

imshow(img);





