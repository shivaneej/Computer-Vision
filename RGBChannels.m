%Read the image
img = imread('RGBChannels.jpg');

%Get the size (rows and columns) of the image 
[r,c] = size(img);
row = r/3;

% Extract B, G, R channels from different sections of image
B = img(1:row,:);
G = img(row+1:2*row,:);
R = img(2*row+1:end,:);

% Concatenate RGB channels to form image
ColorImg(:,:,1) = R;
ColorImg(:,:,2) = G;
ColorImg(:,:,3) = B;

montage({B,G,R,ColorImg})