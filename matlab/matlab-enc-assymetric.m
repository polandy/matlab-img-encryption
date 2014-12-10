p = randseed;
q = randseed;
n = p * q;
t = (p-1) * (q-1);

% generate a public key e
e_ = randseed; % todo: make sure t is not divisible by 't'
while gcd(e_, t) ~= 1
    e_ = randseed;
end
% OK, RSA gcd(e_, t) = 0

% now find the private key 'd': d * e [=] 1 mod t
d = multiplicative_inverse(e,n);

%simple enc and dec. test:
message = 3;
mod(message^10,n)
cipher = mod(message^e,n);

test = mod(3,2);
message = cipher^d;

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
image_decrypted = encData(image_encrypted, randomMatrix);

% plot images
%figure()
%subplot(1,3,1)
%imshow(my_image,[])
title('original image')
subplot(1,3,2)

%imshow(image_encrypted,[])
title('thresholded image')
subplot(1,3,3)

%imshow(image_decrypted,[])
title('Derypted Image')
