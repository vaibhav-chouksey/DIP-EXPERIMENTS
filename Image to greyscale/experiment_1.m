% Experiment 1: Fundamental Operations for Image Processing
% Name: Vaibhav Chouksey
% Roll no: Bt23ece051
% Date: 18/01/2026

clc;
clear all;
close all;

% Generating a random 8x8 matrix (b/w 0-255)
B = randi([0, 255], 8, 8);
disp('8x8 Random Matrix:');
disp(B);

%Reading and displaying the original image
I = imread("vaibhav.jpg");
figure(1);
imshow(I);
title('Original Color Image');

%Conversion of RGB image to Grayscale
Ig = rgb2gray(I); 
figure(2);
imshow(Ig);
title('Grayscale Conversion');

%Red Channel Extraction 
%keep the Red channel and set Green (2) and Blue (3) to zero
I_red = I; 
I_red(:,:,2) = 0; 
I_red(:,:,3) = 0; 
figure(3);
imshow(I_red);
title('Red Only');

%Black and White conversion)
%threshold at 100
Ib = Ig > 100;
figure(4);
imshow(Ib);
title('Black and White');