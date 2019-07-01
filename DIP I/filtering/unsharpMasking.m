function i = unsharpMasking(img, filterSize, harmonization)
% Technique to compress background information of an image by subtracting
% an blurred version of it. The blurred image is obtained with a large
% (e.g. n = 50) moving average filter. The harmonization factor is 
% typically 0.8.
    iLP = movingAverage(img, filterSize, filterSize);
    i = uint8(img + harmonization * (img - iLP));
end

