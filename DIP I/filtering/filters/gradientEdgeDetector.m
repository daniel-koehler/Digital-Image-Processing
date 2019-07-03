function i = gradientEdgeDetector(img, n, theta)
% Gradient-based edge detection using discrete symmetric differentiation,
% i.e.: df(x,y)/dx = 1/2 * [f(x+1,y) - f(x-1,y)]. When using n > 1
% additional lowpass filtering perpendicular to the directional
% differentiation is used (can reduce noise sensitivity of detector). E.g.
% for n = 3 the kernel is: 1/6 * [-1 0 1; -1 0 1: -1 0 1].
% theta in [0, 1] is used for thresholding.
    
    function h = kernel(n, dim)
        % Returns kernel for discrete symmetric partial differentiation
        % w.r.t. y (dim == 1) or x (dim == 2).
        if n < 1
            n = 1;
        end
        if dim == 1
            v1 = [-1; 0; 1];
            v2 = ones(1, n);
        elseif dim == 2
            v1 = ones(n, 1);
            v2 = [-1 0 1];
        end
        h = v1 * v2;
    end
    
    i = double(img);
    fx = conv2(i, kernel(n, 1), 'same');
    fy = conv2(i, kernel(n, 2), 'same');
    t = theta * 255;
    i(imregionalmax(fx) | imregionalmax(fy)) = 255;
    i(fx < t & fy < t) = 0;
    %i(fx >= t | fy >= t) = 255;

    i = uint8(i);
end

