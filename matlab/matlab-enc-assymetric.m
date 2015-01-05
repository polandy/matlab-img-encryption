% generate a p and q which are not the same and where the result of the
% multiplication is bigger or equal to 255
n=0;
while((n < 255) || (p == q))
    p = randseed(randi(1000),1,1,1,25);
    q = randseed(randi(1000),1,1,1,25);
    n = p * q;
end

% calculate the totient
t = (p-1) * (q-1);

% generate a public key e_ which is divisor-TODO with 't'
e_ = randseed(randi(1000),1,1,1,t);
while(gcd(e_, t) ~= 1)
    e_ = randseed(randi(1000),1,1,1,t);
end
% calculate the multiplicative inverse of e_, so that d * e [=] 1 mod t
% which results in the private key 'd'
d = multiplicative_inverse(e_,t);

% Declare image to load
% read in jpg image 
clean_image = imread('island.jpg','jpg');

% generate random matrix
randomMatrix = randi([0,255], 84, 220, 3);
randomMatrix = uint8(randomMatrix);

% encrypt image with RSA
image_encrypted = clean_image;
image_encrypted = encDataRSA(clean_image, e_, n);

% decrypt image with RSA
image_decrypted = decDataRSA(image_encrypted, d,n);

% plot images
figure()
subplot(1,3,1);
imshow(clean_image,[])
title('Originial')

subplot(1,3,2);
imshow(image_encrypted,[])
title('Verschlüsselt mit RSA (asymmetrisch)')

subplot(1,3,3);
imshow(image_decrypted,[])
title('Entschlüsselt')
