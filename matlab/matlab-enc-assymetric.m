files = dir('images/*.jpg');

% initialize matrixes for report
time = [];
imgName = [];
width = [];
height = [];
megapixel = [];


for file = files'
    filename = file.name

    % read image
    imagePath = strcat('images/', filename);
    total_runtime = tic;
    clean_image = imread(imagePath, 'jpg');
    my_image_size = size(clean_image);
    y = my_image_size(1);
    x = my_image_size(2);
    z = my_image_size(3);

    % encrypt image
    enc_time = tic;
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
    % clean_image = imread('island.jpg','jpg');


    % encrypt image with RSA
    image_encrypted = clean_image;
    image_encrypted = encDataRSA(clean_image, e_, n);

        enc_time = toc(enc_time);
    % decrypt image with RSA
    % image_decrypted = decDataRSA(image_encrypted, d,n);

    % create statistics for the table
    time = cat(1, time, [enc_time]); % time in seconds
    width = cat(1, width, [x]);
    height = cat(1, height, [y]);
    megapixel = cat(1, megapixel, [(x*y)/10^6]);
    imgName = [imgName; {filename}];

    %figure()
    % plot images
    figure()
    subplot(1,3,1);
    imshow(clean_image,[])
    title('Originial')

    subplot(1,3,2);
    imshow(image_encrypted,[])
    title('Verschlüsselt mit RSA (asymmetrisch)')

    %subplot(1,3,3);
    %imshow(image_decrypted,[])
    %title('Entschlüsselt')

end

T = table(imgName,width, height,megapixel, time);
writetable(T,'performance-asymmetric-enc.csv');