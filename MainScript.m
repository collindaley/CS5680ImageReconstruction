% Read in file(s) for processing
mri2 = imread('mri.jpg');
river2 = imread('river.jpg');

% Convert file(s) to grayscale
mri = rgb2gray(mri2);
river = rgb2gray(river2);

% Compute the gradients
[mriGrad,mriWin] = Gradient(mri);
[rivGrad,rivWin] = Gradient(river);

% Rescale the gradients
mriGrad = rescale(mriGrad);
rivGrad = rescale(rivGrad);

figure(1),
subplot(2,2,[1,2]), imshow(mri), title('Original Image')
subplot(2,2,3), imshow(mriWin), title('MRI Weiner Filter')
subplot(2,2,4), imshow(mriGrad), title('MRI Gradient')

figure(2),
subplot(2,2,[1,2]), imshow(river), title('Original Image')
subplot(2,2,3), imshow(rivWin), title('River Weiner Filter')
subplot(2,2,4), imshow(rivGrad), title('River Gradient')

% Structuring element to open, dilate, and erode the image
% Important to note that this structuring element may not work on all
% images. Will generalize this later when I introduce more images.
se = strel('square',20);

% Compute the image segmentation and watershedding on mri
[erodeReconstruct, dilateComplement] = Reconstruction(mri, se);
[regionMax, background, foreground] = ObjectDetection(dilateComplement);
c = imfuse(regionMax, mri, 'blend');
[watershedIm, originalWatershed] = Watershed(mri, foreground);


figure(3),
subplot(2,2,1), imshow(mri2), title('Original Image')
subplot(2,2,2), imshow(erodeReconstruct), title('Erosion-based Reconstruction')
subplot(2,2,3), imshow(dilateComplement), title('Dilation-based Reconstruction')
subplot(2,2,4), imshow(foreground), title('Foreground Objects');

figure(4),
subplot(2,2,1), imshow(c), title({'Superimposed foreground ','objects on grayscale image'})
subplot(2,2,2), imshow(background), title('Background Objects')
subplot(2,2,3), imshow(watershedIm), title('Final Segmented Image')
subplot(2,2,4), imshow(originalWatershed), title('Watershed without image segmentation')

% Structuring element to open, dilate, and erode the image
% Important to note that this structuring element may not work on all
% images. Will generalize this later when I introduce more images.
se = strel('square',35);

% Compute the image segmentation and watershedding on river
[erodeReconstruct, dilateComplement] = Reconstruction(river, se);
dilateComplement = rescale(dilateComplement);
erodeReconstruct = rescale(erodeReconstruct);
[regionMax, background, foreground] = ObjectDetection(dilateComplement);
c = imfuse(regionMax, river, 'blend');
[watershedIm, originalWatershed] = Watershed(river, foreground);

figure(5),
subplot(2,2,1), imshow(river2), title('Original Image')
subplot(2,2,2), imshow(erodeReconstruct), title('Erosion-based Reconstruction')
subplot(2,2,3), imshow(dilateComplement), title('Dilation-based Reconstruction')
subplot(2,2,4), imshow(foreground), title('Foreground Objects');

figure(6),
subplot(2,2,1), imshow(c), title({'Superimposed foreground ','objects on grayscale image'})
subplot(2,2,2), imshow(background), title('Background Objects')
subplot(2,2,3), imshow(watershedIm), title('Final Segmented Image')
subplot(2,2,4), imshow(originalWatershed), title('Watershed without image segmentation')
