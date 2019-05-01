image = imread('monalisa.jpg');

%image2 = upscaleImage(image, 1280, 856);
%image3 = scaleImage(image, 1280, 856);
%montage({image2, image3});
image4 = rotateImage(image,90);

%figure, imshow(image2)
%figure, imshow(image3)

figure, imshow(image4)
