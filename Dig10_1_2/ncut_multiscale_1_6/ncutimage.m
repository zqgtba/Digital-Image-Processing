function region=ncutimage(image)
%image = imread('v48752.jpg');
ncut=10;
im=image;
n=ncut;
tic
region = ncut_multiscale(image,10);
toc
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
%imwrite(im,strcat(q,'.jpg'));
% 
end