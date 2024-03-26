I=imread('lena.jpg');
figure, imshow(uint8(double(I)));
BW=im2bw(I,0.5);
BW1=edge(double(BW),'sobel');
figure,
subplot(3,2,1),imshow(BW1),title('sobel');
BW2=edge(double(BW),'prewitt');
subplot(3,2,2),imshow(BW2),title('prewitt');
BW3=edge(double(BW),'roberts');
subplot(3,2,3),imshow(BW3),title('roberts');
BW4=edge(double(BW),'log');
subplot(3,2,4),imshow(BW4),title('log');
BW5=edge(double(BW),'zerocross');
subplot(3,2,5),imshow(BW5),title('zero-cross');
BW6=edge(double(BW),'canny');
subplot(3,2,6),imshow(BW6),title('canny');