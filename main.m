% Main function for question given
    % skin tones and undertones are given as:
    skinTones = {'deep', 'medium', 'fair'};
    undertones = {'warm', 'neutral', 'cool'};

    % 5 products are named as:
    products = {'P1', 'P2', 'P3', 'P4', 'P5'};

    % initializeMappingMatrix function is used to  map the skin-tone and skin-undertone
    mappingMatrix = initializeMappingMatrix(skinTones, undertones);

    % displaying mapping matrix:
    disp('Mapping Matrix:');

    %% Type YES for capturing image from webcam or NO for taking saved user image
    choice = input('Do you want to capture an image from webcam? (yes/no): ', 's');
    if strcmpi(choice, 'yes')
        % Initialize webcam
        cam = webcam;
        
        % Capture image from webcam
        disp('Capturing image from webcam...');
        preview(cam);
        pause(5); % Adjust the preview time as needed
        img = snapshot(cam);
        img2=img;
        closePreview(cam);
        delete(cam);
    else
        % iamge saved in computer
          img = imread('input_image3.jpg');
          img2=img;

    end

    figure;
    subplot(1, 3, 1);
    imshow(img2);
    title('Original Image');
  %% call processImage function for Adjusting lighting conditions
    [equalized_img, white_balanced_img] = processImage(img);

    % modified images are saved for further use:
    imwrite(equalized_img, 'equalized_image.jpg');
    imwrite(white_balanced_img, 'white_balanced_image.jpg');

    % functions for product features and user features are defined:
    productFeatures = defineProductFeatures();
    userFeatures = getUserFeatures();

    % function for final image after applying effect is defined:
    finalImage = applyEffect(img, productFeatures, userFeatures);

%% function to define product features
function productFeatures = defineProductFeatures()
    productFeatures = [
        0.8, 0.6, 0.7, 0.5, 0.9; % P1
        0.6, 0.7, 0.8, 0.5, 0.6; % P2
        0.9, 0.8, 0.7, 0.6, 0.5; % P3
        0.7, 0.6, 0.8, 0.7, 0.6; % P4
        0.8, 0.9, 0.7, 0.6, 0.7  % P5
    ];
end
%% Function to get user features
function userFeatures = getUserFeatures()
    disp('Input data according to skin type of your face');
    featureNames = {'skin tone', 'undertone', 'hydration level', 'dark spots', 'dryness'};
    userFeatures = zeros(1, 5);
    disp('Note: Features:');
    for i = 1:5
        userFeatures(i) = input(['Enter ', featureNames{i}, ' value: ']);
    end

end
%%  Display modified images
 figure;
    subplot(1, 3, 1);
    imshow(finalImage);
    title('Final Image');
