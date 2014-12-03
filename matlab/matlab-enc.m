% Declare image to load
% read in tiff image
my_image = imread('ff.bmp','bmp');

% generate random matrix
randomMatrix = randi([0,255], 84, 220, 3);
randomMatrix = uint8(randomMatrix);

% encrypt image
image_encrypted = my_image;
image_encrypted = encData(my_image, randomMatrix);

% decrypt image (same as encrypt image)
image_decrypted = encData(image_thresholded, randomMatrix);

% plot images
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
