% Declare image to load
% files = dir('images/large-2.jpg');

% Load all image files
files = dir('images/*.jpg');

% initialize matrixes for our csv report
time = [];
imgName = [];
width = [];
height = [];
megapixel = [];

% iterate all files
for file = files'
    filename = file.name

    % concat the image path
    imagePath = strcat('images/', filename);
    total_runtime = tic;
    % load image
    my_image = imread(imagePath, 'jpg');
    % get image dimensions
    my_image_size = size(my_image);
    y = my_image_size(1);
    x = my_image_size(2);
    z = my_image_size(3);

    % generate random matrix for the one time pad
    randomMatrix = randi([0,255], y, x, z);
    randomMatrix = uint8(randomMatrix);

    % encrypt image
    image_encrypted = my_image;
    enc_time = tic;
    image_encrypted = encData(my_image, randomMatrix);
    enc_time = toc(enc_time);
    % image_decrypted = encData(image_encrypted, randomMatrix);

    % create statistics for the table
    time = cat(1, time, [enc_time]); % time in seconds
    width = cat(1, width, [x]);
    height = cat(1, height, [y]);
    megapixel = cat(1, megapixel, [(x*y)/10^6]);
    imgName = [imgName; {filename}];

    %figure()
    subplot(1,3,1)
    imshow(my_image,[])
    title('Original image')
    subplot(1,3,2)

    imshow(image_encrypted,[])
    title('Encrypted image')
    % subplot(1,3,3)

	% activate next 2 lines to show the decrypted image
    %imshow(image_decrypted,[])
    %title('Decrypted Image')
end

% Create table for Report and save it to a csv file
T = table(imgName,width, height,megapixel, time);
writetable(T,'performance-symmetric-enc.csv');