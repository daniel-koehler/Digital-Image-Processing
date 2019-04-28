image = imread('monalisa.jpg');

imageBayer = bayerFilter(image, 'rggb');
imageBayerGray = max(imageBayer, [], 3);

figure, montage({imageBayer, imageBayerGray});

%imageReconstructed = demosaic(imageBayerGray, 'rggb');

nImage = bilinearInterpolation(imageBayer,'rggb');
nImage = bilinearInterpolation(nImage,'rggb');
figure, montage({image, nImage})

