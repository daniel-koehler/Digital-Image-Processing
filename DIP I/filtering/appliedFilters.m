clear all;
tmp = imread('lena_bw.jpg');
img = tmp(:,:,1);
% i1 = unsharpMasking(img, 50, 0.8);
% i2 = binomialFilter(img, 10, 10);
% i3 = movingAverage(img, 10, 10);
% montage({img, i1, i2, i3})

% Edge detection
i1 = gradientEdgeDetector(img, 3, 0.8);
i2 = gradientEdgeDetector(img, 3, 0.6);
i3 = gradientEdgeDetector(img, 3, 0.4);
i4 = gradientEdgeDetector(img, 3, 0.2);
figure, montage({img, i1, i2, i3, i4})

i1 = RobertsEdgeDetector(img, 0.8);
i2 = RobertsEdgeDetector(img, 0.6);
i3 = RobertsEdgeDetector(img, 0.4);
i4 = RobertsEdgeDetector(img, 0.2);
figure, montage({img, i1, i2, i3, i4})

% i1 = PrewittEdgeDetector(img, 0.8);
% i2 = PrewittEdgeDetector(img, 0.6);
% i3 = PrewittEdgeDetector(img, 0.4);
% i4 = PrewittEdgeDetector(img, 0.2);
% figure, montage({img, i1, i2, i3, i4})
% 
% i1 = SobelEdgeDetector(img, 0.8);
% i2 = SobelEdgeDetector(img, 0.6);
% i3 = SobelEdgeDetector(img, 0.4);
% i4 = SobelEdgeDetector(img, 0.2);
% figure, montage({img, i1, i2, i3, i4})