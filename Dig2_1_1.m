im = double(imread('th12.jpg'));
R = histeq(double(im(:,:,1)/255), 100);
G = histeq(double(im(:,:,2)/255), 100);
B = histeq(double(im(:,:,3)/255), 100);
imeq(:,:,1) = R;
imeq(:,:,2) = G;
imeq(:,:,3) = B;
figure,imshow(uint8(imeq * 255))
figure, hist(imeq(:) * 255)
figure, hist(im(:) * 255)
