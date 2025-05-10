clc; clear; close all;
% Load the rice image
rice = imread('rice.png');
figure; imshow(rice); title('Original Rice Image');
% Convert to binary and clean up
bw = imbinarize(rice);
bw = bwareaopen(bw, 20); % Remove small objects (noise)
bw = imfill(bw, 'holes'); % Fill holes in rice grains
% Count and label components
[L, num] = bwlabel(bw);
fprintf('Number of rice grains: %d\n', num);
% Create color-labeled version
color_label = label2rgb(L, 'jet', 'k', 'shuffle');
% Display results
figure;
subplot(1,2,1), imshow(rice), title('Original Image');
subplot(1,2,2), imshow(color_label), title(['Detected: ', num2str(num), ' grains']);
% Mark each grain with bounding box and number
figure;
imshow(rice);
hold on;
% Get region properties
stats = regionprops(L, 'BoundingBox', 'Centroid');
for k = 1:num
% Draw rectangle
rectangle('Position', stats(k).BoundingBox, ...
'EdgeColor', 'r', 'LineWidth', 1);
% Label with number
text(stats(k).Centroid(1), stats(k).Centroid(2), num2str(k), ...
'Color', 'yellow', 'FontSize', 8, ...
'HorizontalAlignment', 'center');
end
hold off;
title(['Marked Rice Grains (Total: ', num2str(num), ')']);