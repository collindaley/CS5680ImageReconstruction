function[wmImage, win] = Gradient(im)
    
    % Apply the Weiner filter to remove noise from images
    wmImage = im;
    win = wiener2(wmImage,[5 5]);
    %wmImage = uint8(wmImage);
    
    % Compute the gradient on the filtered image
    wmImage = imgradient(win);
    
% Attempted use of the papers morphological multi-edge gradient.
% Scale is the number of different structuring elements that are
% iteratively put on the image.
%
%   % First iteration is done outside the loop because b_(i-1) when i=1 is 0
%     se = strel(ones(1,1));
%     dilation = imdilate(im,se) - imerode(im,se);
%     scale = 2;
%     for n = 2:scale
%         struct = (2*n+1) * (2*n-1);
%         struct2 = (2*n) * (2*n-2);
%         se = strel('square',struct);
%         se2 = strel('square',struct2);
%     
%         dilation = imdilate(dilation,se) - imerode(dilation,se);
%         dilation = imdilate(dilation,se2);
%     end
%     wmImage = dilation;


% Attempting to create an edge detection method using wavelet transforms.
% I currently have 1-3 levels of wavelet transform. It is not working
% almost at all at the current moment. I am currently wondering if imadd is
% the wrong thing to be using in this case. 
%
% dwtmode('per');
% [LL,LH,HL,HH] = dwt2(im,'db10');
% [LL2,LH2,HL2,HH2] = dwt2(LL,'db10');
% [LL3,LH3,HL3,HH3] = dwt2(LL2,'db10');
% 
% wmImage = imadd(LH,HL);
% wmImage = imgradient(wmImage);


% My edge detection method from assignemnt 3. Did not work as well as I
% would have liked. I would like to work with this method of edge detection
% more on a later date. 
% [x,y] = size(im);
%     edges = zeros(x,y);
%    
%     im = double(im);
%     % Threshold is 50% of total values in image [0,255]
%     threshold = 128;
%     
%     Sx = [
%         -1, -2, -1;
%          0,  0,  0;
%          1,  2,  1
%     ];
% 
%     Sy = [
%         -1, 0, 1;
%         -2, 0, 2;
%         -1, 0, 1
%     ];
% 
%     for i = 2:x - 1
%         for j = 2:y - 1
%             Gx = 0;
%             Gy = 0;
%             m = i-1;
%             n = j-1;
%             
%             % Calculate Gx and Gy
%             for h = 0:2
%                 for k = 0:2
%                     Gx = Gx + (Sx(h+1,k+1) * im(m + h, n + k));
%                     Gy = Gy + (Sy(h+1,k+1) * im(m + h, n + k));
%                 end
%             end
%             
%             % Calculate the magnitude of the vector and check if it passes
%             % the threshold
%             tmp = sqrt((Gx.^2) + (Gy.^2));
%             if tmp > threshold
%                 edges(i,j) = 255;
%             else
%                 edges(i,j) = 0;
%             end
%             theta = atan2d(Gy, Gx) + 360*(Gy<0);
%             
%             
%             quad = (theta / 18);
%             quad = fix(quad);
%             %if quad == 0
%                 %quad = quad + 1;
%             %end
%             
%             
%         end
%     end
%     wmImage = imgradient(edges);

end