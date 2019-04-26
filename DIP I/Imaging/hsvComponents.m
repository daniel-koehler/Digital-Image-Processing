clear
image = imread('test.jpg');
imageHSV = rgbToHsv(image);     % one could use builtin: rgb2hsv(image)

% decompose into single components
imageH = imageHSV;
imageH(:,:,2:3) = 0;
imageS = imageHSV;
imageS(:,:,[1 3]) = 0;
imageV = imageHSV;
imageV(:,:,1:2) = 0;

% TODO: implement hsv2rgb myself
imageH = hsv2rgb(imageH);
imageS = hsv2rgb(imageS);
imageV = hsv2rgb(imageV);

montage({image, imageH, imageS, imageV});

