clc
clear all
close all

I = im2double(imread('D:\Amir\term-6\computer vision\HW_4\Cells.tif'));
k = My_Bwlabel(I);
imshow(k,[]);
I = uint8(I*255);
WriteToExcel(I, k, 'Question4.xlsx');

