im = imread('mriImage.jpg');
im = rgb2gray(im);
% imshow(im)
% 
im1 = EdgeDetection(im);

imMag = imgradient(im);

se = strel('disk',15);
Io = imopen(imMag,se);
Ie = imerode(im,se);
Iobr = imreconstruct(Ie,im);
Iobrd = imdilate(Iobr,se);
Iobrcbr = imreconstruct(imcomplement(Iobrd),imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);
fgm = imregionalmax(Iobrcbr);
figure(1),
subplot(2,2,1), imshow(im), title('Original Image')
subplot(2,2,2), imshow(imMag, []), title('Magnitude Gradient')
subplot(2,2,3), imshow(Iobr), title('Opening by Reconstuction')
subplot(2,2,4), imshow(fgm), title('Regional Maxima');

% Iobrd = imdilate(Iobr,se);
% Iobrcbr = imreconstruct(imcomplement(Iobrd),imcomplement(Iobr));
% Iobrcbr = imcomplement(Iobrcbr);
% fgm = imregionalmax(Iobrcbr);
% figure(2),
% subplot(2,1,1), imshow(Iobrcbr)
% subplot(2,1,2), imshow(fgm)
% scale = 5;
% dilation = im;
% for n = 1:scale
%     struct = (2*n+1) * (2*n-1);
% 
%     se = strel('square', struct);
% 
%     dilation = imdilate(dilation,se) - imerode(dilation,se);
% end
%dilation = (1/n)*dilation;




% se = strel('square', 3);
% see = strel('square',2);
% dilation = imdilate(im,se) - imerode(im,se);
% dilation = imdilate(dilation,see);
% imshow(dilation,[])