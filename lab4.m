clc;
clear all;
close all;
% Load grayscale image
img = imread('E:\image processing 3-2 lab practice\website.jpg');
gray = rgb2gray(img);
%% --- Part 1: Fourier Transform & Frequency Filtering ---
% FFT
F = fftshift(fft2(double(gray)));
magnitude = log(1 + abs(F));
figure; imshow(mat2gray(magnitude)); title('Frequency Spectrum');
% Low-Pass Filter
[rows, cols] = size(F);
lp_filter = fspecial('gaussian', size(F), 30);
F_low = F .* lp_filter;
low_pass_img = real(ifft2(ifftshift(F_low)));
% High-Pass Filter
hp_filter = 1 - lp_filter;
F_high = F .* hp_filter;
high_pass_img = real(ifft2(ifftshift(F_high)));
% Display results
figure;
subplot(1,2,1), imshow(mat2gray(low_pass_img)), title('Low-Pass Filtered Image');
subplot(1,2,2), imshow(mat2gray(high_pass_img)), title('High-Pass Filtered Image');
%% --- Part 2: Edge Detection ---
% Sobel Edge Detection
sobel_edges = edge(gray, 'sobel');
% Prewitt Edge Detection
prewitt_edges = edge(gray, 'prewitt');
% Canny Edge Detection
canny_edges = edge(gray, 'canny');
% Display results
figure;
subplot(1,3,1), imshow(sobel_edges), title('Sobel Edges');
subplot(1,3,2), imshow(prewitt_edges), title('Prewitt Edges');
subplot(1,3,3), imshow(canny_edges), title('Canny Edges');