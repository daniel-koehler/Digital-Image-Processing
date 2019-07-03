function i = binomialFilter(img, m,n)
    % Returns image filtered by a binomial filter of size m x n.
    function c = binomialCoefficients(n)
        % n-th row of Pascal's triangle 
        n = n - 1;
        c = zeros(1, n);
        for k = 0 : n
            c(k+1) = nchoosek(n,k);
        end       
    end
    
    function h = kernel(cm, cn)
        h = transpose(cm) * cn / (sum(cm) * sum(cn));
    end

    cm = binomialCoefficients(m);
    cn = binomialCoefficients(n);    
    h = kernel(cm, cn);
    i = double(img);
    i = uint8(conv2(i, h, 'same'));
end