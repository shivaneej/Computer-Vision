RGB = imread('image1.jpg');

% Convert to different color spaces
% https://in.mathworks.com/help/images/understanding-color-spaces-and-color-space-conversion.html

% HSV
HSV = rgb2hsv(RGB)
[hue,sat,val] = imsplit(HSV)

% CIE 1976 XYZ
XYZ = rgb2xyz(RGB)

% CIE 1976 L*a*b*
Lab = rgb2lab(RGB)

% YCbCr
YCbCr = rgb2ycbcr(RGB)

% YIQ by NTSC
YIQ = rgb2ntsc(RGB)
% Extract grayscale
Gray = rgb2gray(RGB)

montage({RGB,HSV,YIQ,YCbCr},"BorderSize",10,"BackgroundColor",'k');
montage({hue,sat,val,HSV},"BorderSize",10,"BackgroundColor",'k');
montage({XYZ,Lab,Gray,RGB},"BorderSize",10,"BackgroundColor",'k');