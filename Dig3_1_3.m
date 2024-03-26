imo = double(imread('test.png')); 
f1 = fspecial('gauss', 5, 2); 
imblur = imfilter(imo, f1); 
diff = double(imblur - imo); 
imenhance = double(imo) - 2 * diff;
figure,imshow(uint8(imo))
figure,imshow(uint8(imenhance))