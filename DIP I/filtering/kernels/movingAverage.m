function i = movingAverage(img, m, n)
        el = 1/(m*n);
        h = repmat(el, m, n);
        i = double(img);
        i = uint8(conv2(i, h, 'same'));
end