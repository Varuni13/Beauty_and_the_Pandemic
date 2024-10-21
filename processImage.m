% Combined function to apply histogram equalization and white balance
function [equalized_img, white_balanced_img] = processImage(img)
    % Convert to grayscale (if necessary)
    gray_img = rgb2gray(img);

    % Apply histogram equalization to the grayscale image
    equalized_img = histeq(gray_img);

    % Apply white balance to the original image
    img_double = im2double(img);
    avg_r = mean2(img_double(:,:,1));
    avg_g = mean2(img_double(:,:,2));
    avg_b = mean2(img_double(:,:,3));
    avg_all = (avg_r + avg_g + avg_b) / 3;
    scale_r = avg_all / avg_r;
    scale_g = avg_all / avg_g;
    scale_b = avg_all / avg_b;
    white_balanced_img = img_double;
    white_balanced_img(:,:,1) = img_double(:,:,1) * scale_r;
    white_balanced_img(:,:,2) = img_double(:,:,2) * scale_g;
    white_balanced_img(:,:,3) = img_double(:,:,3) * scale_b;
    white_balanced_img = min(max(white_balanced_img, 0), 1);
    white_balanced_img = im2uint8(white_balanced_img);

figure;
    subplot(1, 3, 2);
    imshow(white_balanced_img);
    title('white_balanced_img');
end
