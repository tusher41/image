clc;
clear all;
close all;
% Read a low-contrast image
image = imread('E:\image processing 3-2 lab practice\images.jpg');
gray = rgb2gray(image);
% Global histogram equalization
equalized = histeq(gray);
% Adaptive Histogram Equalization (CLAHE)
adaptive_eq = adapthisteq(gray, 'ClipLimit', 0.01);
% Plot histograms
figure;
subplot(3,3,1), imshow(gray), title('Original');
subplot(3,3,2), imhist(gray), title('Original Histogram');
subplot(3,3,4), imshow(equalized), title('Global Equalization');
subplot(3,3,5), imhist(equalized), title('Equalized Histogram');
subplot(3,3,7), imshow(adaptive_eq), title('Adaptive Equalization (CLAHE)');
subplot(3,3,8), imhist(adaptive_eq), title('CLAHE Histogram');