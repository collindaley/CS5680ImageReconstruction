function[watershedIm, originalWatershed] = Watershed(im, foreground)
    % Compute the euclidean distance transform of the foreground
    euclidTransform = bwdist(foreground);
    
    % Create the watershed using the euclidean distance transform
    % And retrieve the foreground objects
    water = watershed(euclidTransform);
    water = water == 0;
    
    % Create a new imposed minimum using both foreground and the above
    % watershed, to create my image segmented watershed
    imposedMin = imimposemin(im, foreground | water);
    watershedIm = watershed(imposedMin);
    watershedIm = label2rgb(watershedIm);
    
    % Apply the watershed to my input image. I think that there might be
    % something else that I need to do with this method. The output is very
    % different from what the paper shows from their implementation. I plan
    % on looking into this more in the future. 
    originalWatershed = watershed(im);
    originalWatershed = label2rgb(originalWatershed);
end