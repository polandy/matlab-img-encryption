% Declare image to load
% A = imread('Tux.jpg','jpg');
% read in tiff image and convert it to double format
my_image = imread('ff.bmp','bmp');
%my_image = im2double(imread('ff.bmp','bmp'));
% my_image = my_image(:,:,1);

% generate random matrix
randomMatrix = randi([0,255], 84, 220, 3);
randomMatrix = uint8(randomMatrix);

% perform thresholding by logical indexing
image_thresholded = my_image;
image_thresholded = encData(my_image, randomMatrix);
image_decrypted = encData(image_thresholded, randomMatrix);

figure()
subplot(1,3,1)
imshow(my_image,[])
title('original image')
subplot(1,3,2)

imshow(image_thresholded,[])
title('thresholded image')
subplot(1,3,3)

imshow(image_decrypted,[])
title('Derypted Image')
