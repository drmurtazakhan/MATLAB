main.m

Test program for Quadtree decomposition (encoding) and decoding of an RGB image.


qt3ddecom.m
-----------
Quadtree decomposition method for an RGB image of size M × N × 3.

This method uses three thresholds for red, green, and blue blocks. If the difference between the maximum and minimum values in any R, G, or B block exceeds its respective threshold, the RGB image is split into four smaller blocks.

Thresholds are specified as values between 0 and 1, regardless of whether the image is of class uint8 or uint16.

    If the image is uint8, the specified threshold is multiplied by 255 to determine the actual threshold.

    If the image is uint16, the specified threshold is multiplied by 65535.

The function also pads the image if its size is not a power of 2, ensuring it can be divided down to blocks of size 1 × 1.
Input:

    I : RGB image matrix of size M × N × 3 (true color image).

    thvec : Threshold values for R, G, and B, specified between 0 and 1.

        Example: thvec = [0.5, 0.5, 0.5]

        (Optional argument; default is thvec = [0, 0, 0], i.e., lossless encoding.)

Output:

    S : Quadtree structure stored as a sparse matrix.

        If S(k,m) ≠ 0, then (k,m) represents the upper-left corner (ULC) of a block in the decomposition, and S(k,m) gives the size of the block.

    valRGB(n,1:3) : Mean (average) RGB components for the n-th block.

Exmaples of usage:
[S, valRGB] = qt3ddecom(I, thvec); % With specified threshold
[S, valRGB] = qt3ddecom(I);        % Lossless encoding

qtreergbdecode.m
----------------
Method to decode Quadtree data that was decomposed (encoded) using qt3ddecom
Input:

    S : Quadtree structure stored as a sparse matrix.

        If S(k,m) ≠ 0, then (k,m) is the upper-left corner (ULC) of a block in the decomposition, and S(k,m) gives the size of the block.

    valRGB(n,1:3) : Mean (average) RGB components for the n-th block.

Output:

    I : Reconstructed (decoded) image.

% % % --------------------------------
% % % Author: Dr. Murtaza Ali Khan
% % % Email : drkhanmurtaza@gmail.com
% % % ResearchGate: http://www.researchgate.net/profile/Murtaza_Khan2/
% % % LinkedIn: https://www.linkedin.com/in/dr-murtaza-ali-khan-3b368019
% % % Google Scholar: https://scholar.google.com/citations?user=n0JDQ0sAAAAJ
% % % Scopus: https://www.scopus.com/authid/detail.uri?authorId=7410318323
% % % GitHub: https://github.com/drmurtazakhan
% % % --------------------------------
