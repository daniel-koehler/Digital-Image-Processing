function I = minimumFilter(img, m, n)
% Applies minimum filter of size m x n to img and returns filtered image
    I = img;
    M = uint16(m/2 - 1);
    N = uint16(n/2 - 1);
    [sizeY,sizeX] = size(img);
    for i = 1:sizeY
        y = max(1,i-M):1:min(sizeY,i+M);
        for j = 1:sizeX
            x = max(1,j-N):1:min(sizeX,j+N);
            I(i,j) = min(img(y,x), [], 'all');
        end
    end
end
