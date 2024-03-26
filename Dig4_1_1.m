im = double(imread('lena.jpg')); 
imfft = fft2(im(:,:,1)); 
imfftshift = fftshift(imfft); 
R = real(imfftshift); 
I = imag(imfftshift);
A1 = sqrt(R.^2 + I ^ 2); 
A1=(A1-min(min(A1)))/(max(max(A1))-min(min(A1)))*225; 
figure,imshow(uint8(im))
figure,imshow(A1)