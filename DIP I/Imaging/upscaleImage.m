function upscaledImage = upscaleImage(image, height, width)
% Upscale image using nearest neighbor interpolation
[height0, width0, c] = size(image);

assert((height0<=height)&&(width0<=width), "width/height smaller than for original image");

upscaledImage = zeros(height,width,c, "uint8");
a = height0/height;
b = width0/width;
for i = 1:height
    for j = 1:width
        upscaledImage(i,j,:) = image(ceil(a*i),ceil(b*j),:);
    end
end
end
