function i = PrewittEdgeDetector(img, theta)
    i = double(img);
    h1 = [-1 0 1; -1 0 1; -1 0 1];
    h2 = [1 1 1; 0 0 0; -1 -1 -1];
    f1 = conv2(i, h1, 'same');
    f2 = conv2(i, h2, 'same');
    
    i = sqrt(f1.^2 + f2.^2);
    t = theta * max(i, [], 'all');
    i(i < t) = 0;
    i(i >= t) = 255;
    i = uint8(i);
end