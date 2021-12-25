function [regionMax, background, foreground] = ObjectDetection(dilateComplement)
    % Calculate the regional maxima of dilateComplement
    regionMax = imregionalmax(dilateComplement);
    
    % Convolution method below was adapted from the MATLAB forums
    % https://www.mathworks.com/matlabcentral/answers/380687-how-to-smooth-rough-edges-along-a-binary-image
    windowSize = 10;
    mask = ones(windowSize) / windowSize ^ 2;
    convolute = conv2(single(regionMax), mask, 'same');
    % Apply thresholding on the convoluted image
    foreground = convolute > 0.5;
    
    % Dilate using a simple 3x3 square mask to make up for the 
    % above convolution for smoothing edges
    se2 = strel('square',3);
    foreground = imdilate(foreground,se2);
    
    % Make the background by creating a binary version of dilateComplement
    background = imbinarize(dilateComplement);

end