t=tic

location1 = fullfile(matlabroot,'toolbox','matlab','demos');
location2 = fullfile(matlabroot,'toolbox','matlab','imagesci');

ds = datastore({location1,location2},'Type','image',...
                      'FileExtensions',{'.jpg','.tif','.png'});
maxAvgH = 0;
maxAvgS = 0;
maxAvgV = 0;

dataH = 0;
dataS = 0;
dataV = 0;

for i = 1:length(ds.Files)
    data = readimage(ds,i);     % Read the ith image
    if ~ismatrix(data)          % Only process 3-dimensional color data
        hsv = rgb2hsv(data);    % Compute the HSV values from the RGB data
        ncutimage(data);
        h = hsv(:,:,1);         % Extract the HSV values
        s = hsv(:,:,2);
        v = hsv(:,:,3);

        avgH = mean(h(:));      % Find the average HSV values across the image
        avgS = mean(s(:));
        avgV = mean(v(:));

        if avgH > maxAvgH       % Check for new maximum average hue
           maxAvgH = avgH;
           dataH = data;
        end

        if avgS > maxAvgS       % Check for new maximum average saturation
           maxAvgS = avgS;
           dataS = data;
        end

        if avgV > maxAvgV       % Check for new maximum average brightness
           maxAvgV = avgV;
           dataV = data;
        end
    end
end

figure,
imshow(dataH,'InitialMagnification','fit');
title('Maximum Average Hue');