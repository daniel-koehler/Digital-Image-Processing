function image = rgbToHsv(image)
% Inputs:
%   - image:    RGB image received from imread('file.jpg')
% Returns:
%   - image:    same image in the HSV color space

image = double(image)/255;

R = image(:,:,1);
G = image(:,:,2);
B = image(:,:,3);

[maximum, I] = max(image,[],3);
minimum = min(image,[],3);

V = maximum;
S = (maximum - minimum)./maximum;
H = zeros(size(S));
% angle is normalized from [0, 360] to [0, 1]
H(I==1) = (60*(G(I==1) - B(I==1))./(maximum(I==1)-minimum(I==1)))/360;
H(I==2) = (60*(B(I==2) - R(I==2))./(maximum(I==2)-minimum(I==2)) + 120)/360;
H(I==3) = (60*(R(I==3) - G(I==3))./(maximum(I==3)-minimum(I==3)) + 240)/360;

% original image with HSV components
image(:,:,1) = H;
image(:,:,2) = S;
image(:,:,3) = V;