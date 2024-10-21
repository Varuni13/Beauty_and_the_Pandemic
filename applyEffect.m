% Combined function to choose a product and apply product effect
function finalImage = applyEffect(img, productFeatures, userFeatures)
    productNames = {'P1', 'P2', 'P3', 'P4', 'P5'};
    choice = input('type yes for choosing product of own choice or for getting best match type no (yes/no): ', 's');
    
    if strcmpi(choice, 'yes')
        %displaying available products
        disp('Available products:');
        for i = 1:length(productNames)
            fprintf('%d: %s\n', i, productNames{i});
        end
        
        %User is choosing product
        userChoice = input('Enter the number of the product you want to choose: ');
        if userChoice < 1 || userChoice > length(productNames)
            error('Invalid choice so choose again a valid product.');
        end
        chosenProductIndex = userChoice;
        % Simulate product effect based on chosen product features
        productEffect = img;

   % Adjust the product effect based on chosen product features (Example: Increase red channel)
    productEffect(:,:,1) = productEffect(:,:,1) + 50 * chosenProductIndex; % Adjust red channel
                      
  
    else
        % Calculate similarity
    similarityScores = sum((productFeatures - userFeatures).^2, 2);
    matchPercentages = 100 - (similarityScores / max(similarityScores) * 100);

    % Find the product with the highest match percentage
    [bestMatchPercentage, bestProductIndex] = max(matchPercentages);

    % Display the match percentages and the best product
    disp('Match Percentages:');
    for i = 1:length(productNames)
        fprintf('%s: %.2f%%\n', productNames{i}, matchPercentages(i));
    end
    fprintf('Best product for the user: %s\n', productNames{bestProductIndex});
    fprintf('Best match percentage: %.2f%%\n', bestMatchPercentage);

    % Automatically choose the best product
    chosenProductIndex = bestProductIndex;

    % Simulate product effect based on chosen product features
     productEffect = img;

    % Adjust the product effect based on chosen product features
     productEffect(:,:,1) = productEffect(:,:,1) + round(matchPercentages(chosenProductIndex) * 0.8); % Adjust red channel
    end

    % Blend original image with product effect
    alpha = 0.5; % Blending factor
    finalImage = uint8(alpha * double(img) + (1 - alpha) * double(productEffect));
end
