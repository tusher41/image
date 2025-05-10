clc;
clear all;
close all;
% Read and preprocess the image
img = imread('E:\image processing 3-2 lab practice\website.jpg');
if size(img, 3) == 3
img = rgb2gray(img);
end
% Binarize the image (adjust threshold as needed)
bw = imbinarize(img);
% Remove small noise (optional)
bw = bwareaopen(bw, 50);
% Invert if text is white on black
if mean(bw(:)) > 0.5
bw = ~bw;
end
% Label connected components (characters)
[labeled_img, num_chars] = bwlabel(bw);
% Extract properties of each character
char_props = regionprops(labeled_img, 'BoundingBox', 'Image');
% Display original and segmented characters
figure;
subplot(1, 2, 1), imshow(bw), title('Original Binary Image');
% Plot bounding boxes on the original image
subplot(1, 2, 2), imshow(bw), title('Segmented Characters');
hold on;
for k = 1:num_chars
bb = char_props(k).BoundingBox;
rectangle('Position', bb, 'EdgeColor', 'r', 'LineWidth', 2);
end
hold off;
% Display each character separately
figure;
for k = 1:num_chars
subplot(1, num_chars, k);
imshow(char_props(k).Image);
title(['Char ', num2str(k)]);
end