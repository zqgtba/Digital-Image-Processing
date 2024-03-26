im = imread('lena.jpg'); %读入lena图像
figure,imshow(im); %显示lena图像
imwrite(im,'lena1.png');
imwrite(im,'lena2.bmp');
imwrite(im,'lena4.tiff');