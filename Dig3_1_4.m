im = imread('test1.png');
imnois = imnoise(im, 'salt & pepper', 0.1); 
imdeno(:,:,1)=medfilt2(imnois(:,:,1)); 
imdeno(:,:,2)=medfilt2(imnois(:,:,2)); 
imdeno(:,:,3)=medfilt2(imnois(:,:,3)); 
figure,imshow(uint8(im))
figure,imshow(uint8(imdeno))