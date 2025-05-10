clc; clear; close all;
% 1. Read image (convert to grayscale if needed)
img = imread('tape.png');
if size(img,3) == 3 % If it's a color image
img = rgb2gray(img);
end
img = double(img); % Convert to double for calculations
% 2. Define a 3x3 mask (example: Sharpening)
mask = [0 -1 0; -1 5 -1; 0 -1 0];
% 3. Initialize output image (same size as input)
output = zeros(size(img));
% 4. Apply convolution (skip borders for simplicity)
for i = 2:size(img,1)-1
for j = 2:size(img,2)-1
% Get 3x3 neighborhood
patch = img(i-1:i+1, j-1:j+1);
% Multiply with mask and sum
output(i,j) = sum(sum(patch .* mask));
end
end
% 5. Display results
figure;
subplot(1,2,1); imshow(uint8(img)); title('Original');
subplot(1,2,2); imshow(uint8(output)); title('Convolved');