function filteredImage = bayerFilter(image, pattern)
% Inputs:
%   - image:            RGB image as obtained by imread()
%   - pattern:          pattern of the bayer filter:
%                       'rggb', 'bggr', 'grbg', 'gbrg'
% Returns:
%   - filteredImage:    image where each pixel is split into four pixels
%                       with the pattern [R G; G B]
switch pattern
    case 'rggb'
        block = uint8([1 2; 2 3]);
    case 'bggr'
        block = [3 2; 2 1];
    case 'grbg'
        block = [2 1; 3 1];
    case 'gbrg'
        block = [2 3; 1 2];
    otherwise
        error('Pattern %s not supported.', pattern)
end
image = double(image);
filteredImage = zeros(size(image,1)*2, size(image,2)*2, 3, 'uint8');
for i = 1:3
    % using Kronecker product
    filteredImage(:,:,i) = kron(image(:,:,i), block==i);
end
filteredImage = uint8(filteredImage);
end