im = imread('test.png');
filt = fspecial('gaus', 5, 2); 
imf1 = imfilter(double(im(:,:,1)), filt,'same'); 
filt2 =[-1,0,1]'; imf2 = imfilter(double(imf1(:,:,1)), filt2,'same');
figure,imshow(uint8(im));
 figure, imshow(imf2,[]);