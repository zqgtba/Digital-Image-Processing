% function 
image = imread('v48752.jpg');
figure,imshow(image);
ncut=19;
im=image;
n=ncut;
region = ncut_multiscale(image,ncut);
[x,y,c]=size(image);
im1=region;

for m=1:ncut  
for i=1:x
    for j=1:y
        if im1(i,j) ==m
             im(i,j,1)=255*abs(sin(255-m*60));
             im(i,j,2)=255*abs(cos(m));
             im(i,j,3)=255*abs(sin(m*20));
         end
    end
end
end
figure;
imshow(im)  