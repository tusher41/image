clc;
clear all;
close all;
% Read grayscale image
image = imread('E:\image processing 3-2 lab practice\website.jpg');
gray = rgb2gray(image);
% Global Thresholding using Otsu's method
level = graythresh(gray);
bw_otsu = imbinarize(gray, level);
% Adaptive Thresholding
bw_adaptive = adaptthresh(gray, 0.5);
bw_local = imbinarize(gray, bw_adaptive);
% Display results
figure;
subplot(2,2,1), imshow(gray), title('Original Grayscale');
subplot(2,2,2), imshow(bw_otsu), title('Global Thresholding (Otsu)');
subplot(2,2,3), imshow(bw_local), title('Adaptive Thresholding');
subplot(2,2,4), imshowpair(bw_otsu, bw_local), title('Otsu vs Adaptive');