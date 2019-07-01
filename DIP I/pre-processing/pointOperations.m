function pointOperations()

    function invertedImage = invertImage(image)
        invertedImage = 255 - image;
    end

    function enhancedImage = contrastEnhancement(image, transform)
        image = double(image);          
        if strcmp(transform, 'linear')  
            enhancedImage = (image - min(image))./(max(image) - min(image)) .* 255.0;
        elseif strcmp(transform, 'log')
            enhancedImage = log(1 + image);
        end
        enhancedImage = uint8(enhancedImage);
    end

    img = imread('lowcontrast.jpg');
   
    cImg = contrastEnhancement(img, 'log');
    subplot(1,2,1), imhist(img);
    subplot(1,2,2), imhist(cImg);
    
    invImg = invertImage(cImg);
    figure,montage({img, cImg, invImg})
end

