img = imread('cameraman.tif');

% Sobel Gradient to calculate strength of edegs
[Gx,Gy] = imgradientxy(img,'sobel'); 

% magnitude and direction
[Gmag,Gdir] = imgradient(img,'sobel'); 

montage({Gx,Gy,Gmag,Gdir});

