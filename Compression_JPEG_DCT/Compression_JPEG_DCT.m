clc;
clear all;
close all;

img = imread("Harvey.jpg");                  
% Reading the input image

if size(img,3) == 3
    img = rgb2gray(img);                  
end
% Converting RGB image to grayscale if needed

img = double(img);                        
% Converting image to double for DCT processing

quantMatrix = [16 11 10 16 24 40 51 61;
               12 12 14 19 26 58 60 55;
               14 13 16 24 40 57 69 56;
               14 17 22 29 51 87 80 62;
               18 22 37 56 68 109 103 77;
               24 35 55 64 81 104 113 92;
               49 64 78 87 103 121 120 101;
               72 92 95 98 112 100 103 99];
% Standard JPEG quantization matrix

compressionFactor = 10;                  
quantMatrix = quantMatrix * compressionFactor;
% Increasing quantization strength for higher compression

blockSize = 8;                           
% JPEG processes image in 8x8 blocks

[rows, cols] = size(img);                
reconstructedImg = zeros(rows, cols);    
% Initializing reconstructed image matrix

for row = 1:blockSize:(rows - blockSize + 1)
    for col = 1:blockSize:(cols - blockSize + 1)

        currentBlock = img(row:row+7, col:col+7);
        % Extracting 8x8 image block

        shiftedBlock = currentBlock - 128;
        % Level shifting for better DCT efficiency

        dctCoeff = dct2(shiftedBlock);
        % Applying DCT to convert block to frequency domain

        quantizedCoeff = round(dctCoeff ./ quantMatrix);
        % Quantizing DCT coefficients

        dequantizedCoeff = quantizedCoeff .* quantMatrix;
        % De-quantization during reconstruction

        inverseBlock = idct2(dequantizedCoeff);
        % Applying inverse DCT

        reconstructedBlock = inverseBlock + 128;
        % Reversing level shift

        reconstructedImg(row:row+7, col:col+7) = reconstructedBlock;
        % Placing reconstructed block back into image
    end
end

reconstructedImg = uint8(reconstructedImg);
% Converting reconstructed image to uint8 format

figure;
imshow(uint8(img));
title("Original Image");

figure;
imshow(reconstructedImg);
title("Reconstructed Image After JPEG Compression");
