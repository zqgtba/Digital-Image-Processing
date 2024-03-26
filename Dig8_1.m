im = double(imread('lena.jpg'));

% Gaussian Pyramid
s = 2;
nlvs = 5;
filt = fspecial('gauss', 11, 5);
pyramid{1} = im;
subplot(2,5,1),imshow(uint8(im));
for k = 2 : nlvs
    factor = s^(k-1);
    pyramid{k} = imresize(imfilter(im, filt), 1 / factor, 'bilinear');
    subplot(2,5,k), imshow(uint8(pyramid{k}))
end

% Laplacian Pyramid
for k = 1 : nlvs-1
    factor = s^(k-1);
    Lap_pyramid{k} = pyramid{k} - imresize(pyramid{k+1}, s, 'bilinear');
    im = (Lap_pyramid{k} - min(Lap_pyramid{k}(:))) / (max(Lap_pyramid{k}(:)) - min(Lap_pyramid{k}(:)));
    subplot(2,5,k+5), imagesc(im);
end
Lap_pyramid{nlvs} = pyramid{nlvs};
subplot(2,5,10), imshow(uint8(Lap_pyramid{nlvs}))
