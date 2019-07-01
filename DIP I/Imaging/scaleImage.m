function scaledImage = scaleImage(image, height, width)
% scale image using bilinear interpolation

[height0, width0, c] = size(image);

image = double(image);
scaledImage = zeros(height,width,c);

yRatio = (height0-1)/height;
xRatio = (width0-1)/width;
try
for i = 1:height
    for j = 1:width
        px = ceil(xRatio*j);
        py = ceil(yRatio*i);
        
        % 4 adjacent pixels with grid indices
        px1 = max(px,1);
        px2 = min(px+1,width0);
        py1 = max(py,1);
        py2 = min(py+1,height0);

        % interpolation in x direction
        q1 = (px2-px)*image(py2,px1,:) + (px-px1)*image(py1,px2,:);
        q2 = (px2-px)*image(py2,px1,:) + (px-px1)*image(py2,px2,:);
        % interpolation in y direction
        scaledImage(i,j,:) = (py2-py)*q1 + (py-py1)*q2;        
    end
end
catch
    error("%i", py2);
end
scaledImage = uint8(scaledImage);
end