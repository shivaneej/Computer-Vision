%Read the image
img = imread('course1image.jpg');

% Separate in three channels
B = img(1:341, :);
G = img(342:682, :);
R = img(683:1023, :);

% convert image to double
b = double(B);
g = double(G);
r = double(R);

% Reference green image, 51 x 51 from the centre
ref_img_region = g(146:196, 175:225);

% Find B and R channels that have the minimum SSD wrt green
b_region = adjust(ref_img_region, b);
r_region = adjust(ref_img_region, r);

% Concatenate the three channels
ColorImg_aligned = uint8(cat(3,uint8(r_region),uint8(g),uint8(b_region)));
montage({ColorImg_aligned});

function aligned = adjust(reference, other)
    minSSD = inf;
    for i = -10:10
        for j = -10:10
            shiftedImg = circshift(other,[i,j]);
            subRegion = shiftedImg(146:196, 175:225);
            ssd = calculateSSD(reference, subRegion);
            if ssd < minSSD
                minSSD = ssd;
                minRegion = shiftedImg;
            end
        end
    end
    aligned = minRegion;
end

function ssd = calculateSSD(x, y)
    sqDiff = (double(x) - double(y)).^ 2;
    ssd = sum(sum(sqDiff));
end

