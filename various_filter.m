close all;
clear;
clc;

% Importing image from file
A = imread('FigP0501.tif');
figure, imshow(A);
A1 = im2double(A);
h = ones(9,9);

% Arithmetic mean filter
B = imfilter(A1,h/81);
figure, imshow(B);

% Geometric mean filter
B = exp(imfilter(log(A1),h,'replicate'))^(1/9/9);
figure, imshow(B);

% Harmonic mean filter
B = 9 * 9 ./ imfilter(1./(A1 + eps),h,'replicate');
figure, imshow(B);

% Contraharmonic filter with Q=1
B = imfilter(A1.^(1+1),h,'replicate');
B = B ./(imfilter(A1.^1,h,'replicate') + eps);
figure, imshow(B);

% Contraharmonic filter with Q=0
B = imfilter(A1.^(0+1),h,'replicate');
B = B ./(imfilter(A1.^0,h,'replicate') + eps);
figure, imshow(B);

% Contraharmonic filter with Q=-1
B = imfilter(A1.^(-1+1),h,'replicate');
B = B ./(imfilter(A1.^(-1),h,'replicate') + eps);
figure, imshow(B);

% Median filter
B = medfilt2(A1, [9 9], 'symmetric');
figure, imshow(B);

% Max filter
B = ordfilt2(A1,9*9,h,'symmetric');
figure, imshow(B);

% Min filter
B = ordfilt2(A,1,h,'symmetric');
figure, imshow(B);

% Midpoint filter
f1 = ordfilt2(A1,1,h,'symmetric');
f2 = ordfilt2(A1,9*9,h,'symmetric');
B = imlincomb(0.5,f1,0.5,f2);
figure, imshow(B);