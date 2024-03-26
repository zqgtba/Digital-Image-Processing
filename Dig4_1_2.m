img_origin=imread('lena.jpg');
img_origin=rgb2gray(img_origin);
d0=50;  %阈值
img_f=fftshift(fft2(double(img_origin)));  %傅里叶变换得到频谱
[m, n]=size(img_f);
m_mid=fix(m/2);  
n_mid=fix(n/2);  
img_lpf=zeros(m,n);
for i=1:m
    for j=1:n
        d=sqrt((i-m_mid)^2+(j-n_mid)^2);   %理想低通滤波，求距离
        if d<=d0
            h(i,j)=1;
        else
            h(i,j)=0;
        end
        img_lpf(i,j)=h(i,j)*img_f(i,j);  
    end
end

img_lpf=ifftshift(img_lpf);    %反傅里叶变换
img_lpf=uint8(real(ifft2(img_lpf)));  %取实数部分

subplot(2,1,1);imshow(img_origin);title('原图');
subplot(2,1,2);imshow(img_lpf);title('理想低通滤波');