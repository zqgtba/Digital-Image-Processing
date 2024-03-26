im = imread('lena.jpg'); %读入lena图像
im(1:5, 1:5, 3) %im是一个三维矩阵 M * N * 3
figure,mesh(double(im(:,:,1))); % 显示图像R通道函数