clear
clc
clf
colormap(gray)

% create example image
% ima=100*ones(100);
% ima(50:100,:)=50;
% ima(:,50:100)=2*ima(:,50:100);
ima=imread('lena.jpg');
fs=fspecial('average');
ima=imfilter(double(ima),fs,'symmetric');


% add some noise
sigma=10;
rima=ima+sigma*randn(size(ima));

% show it
% imagesc(rima)
% drawnow

% denoise it
fima=NLmeansfilter(ima,5,2,sigma);

% show results
clf
subplot(3,1,1),imshow(uint8(ima)),title('original');
subplot(3,1,2),imshow(uint8(rima)),title('noisy');
subplot(3,1,3),imshow(uint8(fima)),title('filtered');

