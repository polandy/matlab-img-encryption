% Declare image to load
% read in tiff image
runtime = tic;
my_image = imread('ff.bmp','bmp');


% generate random matrix
randomMatrix = randi([0,255], 84, 220, 3);
randomMatrix = uint8(randomMatrix);

% encrypt image
image_encrypted = my_image;
enc_time = tic;
image_encrypted = encData(my_image, randomMatrix);
enc_time = toc(enc_time)
image_decrypted = encData(image_encrypted, randomMatrix);

runtime = toc(t1_encryption_syn)

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
