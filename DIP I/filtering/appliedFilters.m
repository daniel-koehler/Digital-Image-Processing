clear all;
tmp = imread('lena_bw.jpg');
img = tmp(:,:,1);
% i1 = unsharpMasking(img, 50, 0.8);
% i2 = binomialFilter(img, 10, 10);
% i3 = movingAverage(img, 10, 10);
% montage({img, i1, i2, i3})