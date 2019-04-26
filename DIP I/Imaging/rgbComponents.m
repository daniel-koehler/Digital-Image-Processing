image = imread('test.jpg');

% decompose image into R, G and B components
imageR = image;
imageR(:,:,2:3) = 0;
imageG = image;
imageG(:,:,[1 3]) = 0;
imageB = image;
imageB(:,:,1:2) = 0;
figure,montage({image, imageR, imageG, imageB})

% map components to greyscale
imageR = image(:,:,1);
imageG = image(:,:,2);
imageB = image(:,:,3);
figure,montage({image, imageR, imageG, imageB})