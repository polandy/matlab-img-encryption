% Declare image to load
% read in tiff image
total_runtime = tic;
my_image = imread('ff.bmp','bmp');
my_image_size = size(my_image)
y = my_image_size(1)
x = my_image_size(2)
z = my_image_size(3)

% generate random matrix
% randomMatrix = randi([0,255], 84, 220, 3);
randomMatrix = randi([0,255], y, x, z);
randomMatrix = uint8(randomMatrix);

% encrypt image
image_encrypted = my_image;
enc_time = tic;
image_encrypted = encData(my_image, randomMatrix);
enc_time = toc(enc_time)
image_decrypted = encData(image_encrypted, randomMatrix);

total_runtime = toc(total_runtime)

figure()
subplot(1,3,1)
imshow(my_image,[])
title('original image')
subplot(1,3,2)

imshow(image_encrypted,[])
title('Encrypted image')
subplot(1,3,3)

imshow(image_decrypted,[])
title('Decrypted Image')
