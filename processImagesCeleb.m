function out_imgs = processImagesCeleb(path, num_img)
    
    % Read all the images inside the directory
    files = dir(fullfile(path, '*.jpg')); 
    
    % Use all images if desired num_img is too large
    num_img = min(num_img, numel(files));
    
    % float32 data type, prepare the all zero matrix for storing images
    out_imgs = zeros(288, 352, 3, num_img, 'single');
    
    % counter for success
    count = 0;

    % Read and process each image
    for i = 1:num_img

        img = imread(fullfile(path, files(i).name));
        img = single(img) / 255.;
        
        if numel(size(img)) ==3 && size(img,3) ==3
            count = count + 1;
            % Crop and downsampling the image to size 28 x 28
            croppedImg = imresize(img, [288, 352]); 
            out_imgs(:, :, :, i) = single(croppedImg);
        end
    end
    out_imgs = out_imgs(:, :, :, 1:count);
end
