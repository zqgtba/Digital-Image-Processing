im = imread('test.png');
filt = fspecial('gauss', 11, 5); 
imf1 = imfilter(double(im), filt,'same');
figure,imshow(uint8(im));
figure,imshow(uint8(imf1));