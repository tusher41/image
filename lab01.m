clc;
clear all;
close all;
% Read image and convert to grayscale
image = im2double(imread('E:\image processing 3-2 lab practice\website.jpg'));
if size(image, 3) == 3
image = rgb2gray(image);
end
% Add Gaussian noise
gaussian_noisy = imnoise(image, 'gaussian', 0, 0.01);
% Add Salt & Pepper noise
sp_noisy = imnoise(image, 'salt & pepper', 0.02);
% Create mean filter
mean_filter = fspecial('average', [5 5]);
% Apply filters on Gaussian noisy image
mean_gaussian = imfilter(gaussian_noisy, mean_filter);
median_gaussian = medfilt2(gaussian_noisy, [5 5]);
gaussian_filtered_gaussian = imgaussfilt(gaussian_noisy, 1);
% Apply filters on Salt & Pepper noisy image
mean_sp = imfilter(sp_noisy, mean_filter);
median_sp = medfilt2(sp_noisy, [5 5]);
gaussian_filtered_sp = imgaussfilt(sp_noisy, 1);
% Display results
figure;
subplot(3,4,1), imshow(image), title('Original');
subplot(3,4,2), imshow(gaussian_noisy), title('Gaussian Noise');
subplot(3,4,3), imshow(sp_noisy), title('Salt & Pepper Noise');
subplot(3,4,5), imshow(mean_gaussian), title('Mean Filter (G)');
subplot(3,4,6), imshow(median_gaussian), title('Median Filter (G)');
subplot(3,4,7), imshow(gaussian_filtered_gaussian), title('Gaussian Filter (G)');
subplot(3,4,9), imshow(mean_sp), title('Mean Filter (SP)');
subplot(3,4,10), imshow(median_sp), title('Median Filter (SP)');
subplot(3,4,11), imshow(gaussian_filtered_sp), title('Gaussian Filter (SP)');
