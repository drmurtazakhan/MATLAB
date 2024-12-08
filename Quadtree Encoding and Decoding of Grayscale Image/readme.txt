Quadtree Encoding and Decoding of Grayscale Image

Quadtree encoding divides a grayscale image into blocks, recursively splitting it into four smaller blocks when pixel values differ significantly, based on a threshold. The decomposition consists of:
=> S: A sparse matrix representing the upper-left corner and size of each block.
=> values: A vector storing the average values of the corresponding blocks.

Decoding uses the quadtree structure to reconstruct the original image from S and values. This method is efficient for compressing images with uniform intensity regions.

% -------------------------------
% main.m
% Test program for Quadtree decomposition (Encoding) and Decoding of an image.
% -------------------------------
% qtreeencode.m
% Encode the QuadTree representation of an image into a sparse matrix 'S' 
% and store the corresponding index values of 'S' in 'values'.
% -------------------------------
% qtreedecode.m
% Decode the QuadTree representation of an image given as the sparse matrix 'S' 
% and the corresponding values in 'values'.
% The decoded image 'I' is returned.
% The type of the decoded image depends on the type of the input 'values'.
% -------------------------------

% Author: Dr. Murtaza Khan
% Email: drkhanmurtaza@gmail.com