clear all;
% Reproduces Wikipedia's examples to rank order filters:
% https://de.wikipedia.org/wiki/Rangordnungsfilter

% Maximum filter
tmp = imread('min_max_wiki_example.jpg');
img = tmp(:,:,1);
i1 = maximumFilter(img, 3, 3);
i2 = maximumFilter(img, 5, 5);
i3 = maximumFilter(img, 7, 7);
i4 = maximumFilter(img, 9, 9);
i5 = maximumFilter(img, 11, 11);
figure, montage({img,i1,i2,i3,i4,i5});

% Minimum filter
i1 = minimumFilter(img, 3, 3);
i2 = minimumFilter(img, 5, 5);
i3 = minimumFilter(img, 7, 7);
i4 = minimumFilter(img, 9, 9);
i5 = minimumFilter(img, 11, 11);
figure, montage({img,i1,i2,i3,i4,i5});

tmp = imread('min_wiki_example.jpg');
img = tmp(:,:,1);
i1 = minimumFilter(img, 5, 5);
figure, montage({img, i1});

% Median filter
tmp = imread('median_wiki_example.jpg');
img = tmp(:,:,1);
i1 = medianFilter(img, 3, 3);
figure, montage({img, i1});
