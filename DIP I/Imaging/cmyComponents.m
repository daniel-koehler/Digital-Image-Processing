image = imread('test.jpg');

% decompose image into C, M and Y components with:
% C = 1-R, M = 1-G, Y = 1-B
imageC = image;
imageC(:,:,1) = 255 - image(:,:,1);
imageC(:,:,2) = 255;
imageC(:,:,3) = 255;
imageM = image;
imageM(:,:,2) = 255 - image(:,:,2);
imageM(:,:,1) = 255;
imageM(:,:,3) = 255;
imageY = image;
imageY(:,:,3) = 255 - image(:,:,3);
imageY(:,:,1) = 255;
imageY(:,:,2) = 255;

figure, montage({image, imageC, imageM, imageY});

% map components to greyscale -> equivalent to RGB components
imageC = 255 - imageC(:,:,1);
imageM = 255 - imageM(:,:,2);
imageY = 255 - imageY(:,:,3);
figure, montage({image, imageC, imageM, imageY});