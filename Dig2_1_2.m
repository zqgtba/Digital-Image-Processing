I = imread('th12.jpg');
I1 = imread('target.jpg');
[hgram1,x]=imhist(I1);
J1=histeq(I,hgram1);
figure,imshow(I);
figure,imshow(J1);

