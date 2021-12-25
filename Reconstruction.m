function[erodeReconstruct, dilateComplement] = Reconstruction(im, se)
% Perform erosion based gray-scale reconstruction on input image. This is
% then dilated using dilation-based reconstruction to isolate the
% foreground objects within the image. 
erosion = imerode(im, se);
erodeReconstruct = imreconstruct(erosion,im);

% Perform dilation based gray-scale reconstruction on erodeReconstruct.
% This is done by dilating the erosion based reconstruction in the last
% step then again reconstructing the image using the complement of the
% dilation and erosion constructions. 
dilation = imdilate(erodeReconstruct, se);
dilationReconstruct = imreconstruct(imcomplement(dilation), ...
                                    imcomplement(erodeReconstruct));
dilateComplement = imcomplement(dilationReconstruct);

end