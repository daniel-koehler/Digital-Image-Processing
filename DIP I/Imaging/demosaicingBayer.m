image = imread('monalisa.jpg');

imageBayer = bayerFilter(image, 'rggb');
imageBayerGray = max(imageBayer, [], 3);

figure, montage({imageBayer, imageBayerGray});

imageReconstructed = demosaic(imageBayerGray, 'rggb');
figure, montage({image, imageReconstructed})