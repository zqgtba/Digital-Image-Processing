clear all;close all;clc;
img=imread('lena.jpg');
% 初始值是在图中黄、绿、红、白、紫部分随机取一点得到的RGB值
Mu=[255 220 50;...
    115 124 31;...
    216 50 39;...
    247 215 185;...
    75 45 75];
[sg,normMuDiff]=KMeansSeg(img,5,Mu,10^-2);
figure,imshow(uint8(double(img)))
figure,imshow(mat2gray(sg));