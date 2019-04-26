image = imread('landscape.jpg');

% different approaches for converting color to grayscale images
average = (image(:,:,1) + image(:,:,1) + image(:,:,1))/3;
lightness = (max(image,[],3) + min(image,[],3))/2;
luminosity = 0.21*image(:,:,1) + 0.72*image(:,:,1) + 0.07*image(:,:,1);

montage({image, average, lightness, luminosity})