function i = SobelEdgeDetector(img, theta)
    i = double(img);
    h1 = [0 1; -1 0];
    h2 = [1 0; 0 -1];
    f1 = conv2(i, h1, 'same');
    f2 = conv2(i, h2, 'same');
    
    i = max(f1, f2);
    t = theta * max(i, [], 'all');
    i(i < t) = 0;
    i(i >= t) = 255;
    i = uint8(i);
end