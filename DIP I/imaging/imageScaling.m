image = imread('monalisa.jpg');

image2 = upscaleImage(image, 1280, 856);
image3 = scaleImage(image, 1280, 856);
montage({image2, image3});