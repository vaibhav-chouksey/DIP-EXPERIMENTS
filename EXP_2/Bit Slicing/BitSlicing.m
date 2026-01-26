clc; clear all; close all;

I = imread('vaibhav.jpeg');
if size(I,3)==3
    I = rgb2gray(I);
end

[rows, cols] = size(I); % getting the number of rows and columns

figure; imshow(I);

bit_planes = zeros(rows, cols, 8); % storing the bit planes

for k = 1:8
    power = 2^(k-1);
    for i = 1:rows
        for j = 1:cols
            bit_planes(i,j,k) = mod(floor(double(I(i,j))/power), 2);
        end
    end
end

figure;
for k = 1:8
    subplot(2,4,k)
    imshow(bit_planes(:,:,k), [])
end
