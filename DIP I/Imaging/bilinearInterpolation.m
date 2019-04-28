function filteredImage = bilinearInterpolation(image, pattern)
% Inputs:
%   - image:            RGB image as obtained by imread()
%   - pattern:          pattern of the bayer filter:
%                       'rggb', 'bggr', 'grbg', 'gbrg'
% Returns:
%   - filteredImage:    image where color for each pixel is bilinear
%                       interpolated
[height, width, color] = size(image);
filteredImage = zeros(height, width, color);

switch pattern
    case 'rggb'
        mask = repmat([1 2; 2 3], height/2, width/2);
    case 'bggr'
        mask = repmat([3 2; 2 1], height/2, width/2);
    case 'grbg'
        mask = repmat([2 1; 3 1], height/2, width/2);
    case 'gbrg'
        mask = repmat([2 3; 1 2], height/2, width/2);
    otherwise
        error('Pattern %s not supported.', pattern)
end

i = double(image)/255;

% bilinear interpolation

for py = 1:height
    for px = 1:width       
        % 8 adjacent pixels
        px1 = max(px-1,1);
        px2 = min(px+1,width);
        py1 = max(py-1,1);
        py2 = min(py+1,height);
        if mask(py,px) == 1 % red pixel
            filteredImage(py,px,1) = i(py,px,1);
            filteredImage(py,px,2) = 1/4 * (i(py1,px,2) + i(py,px1,2) + i(py,px2,2) + i(py2,px,2));
            filteredImage(py,px,3) = 1/4 * (i(py1,px1,3) + i(py1,px2,3) + i(py2,px1,3) + i(py2,px2,3));
        elseif mask(py,px) == 2 % green pixel
            filteredImage(py,px,1) = 1/2 * (i(py,px1,1) + i(py,px2,1));
            filteredImage(py,px,2) = i(py,px,2);
            filteredImage(py,px,3) = 1/2 * (i(py1,px,3) + i(py2,px,3));
        elseif mask(py,px) == 3 % blue pixel
            filteredImage(py,px,1) = 1/4 * (i(py1,px1,1) + i(py1,px2,1) + i(py2,px1,1) + i(py2,px2,1));
            filteredImage(py,px,2) = 1/4 * (i(py1,px,2) + i(py,px1,2) + i(py,px2,2) + i(py2,px,2));     
            filteredImage(py,px,3) = i(py,px,3);
        end       
    end
end

filteredImage = uint8(filteredImage*255);

end