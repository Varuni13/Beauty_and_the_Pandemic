# Beauty and the Pandemic: Virtual Try-On System

## Project Overview
This project addresses the challenges faced by a beauty startup during the COVID-19 pandemic. We propose a virtual try-on application that enables users to upload their photographs and receive personalized makeup recommendations based on their skin tone and undertone. The application provides a user-friendly interface and enhances user engagement by suggesting suitable products for various occasions.

## Key Features
- Users can upload a clear photograph and select their skin tone (deep, medium, fair) and undertone (warm, neutral, cool).
- The system processes images under standard lighting conditions to ensure accurate product matching.
- Users receive a match percentage for each of the five products offered by the startup.
- The application allows users to see how each product looks on them in real-time.

## Implementation Details
The project is implemented using MATLAB and comprises four main files:

1. **`main.m`**: 
   - Defines skin tones and undertones, lists available products, and initializes a mapping matrix.
   - Manages image capture and processing, including grayscale conversion, histogram equalization, and white balancing.
   - Displays user and product features and applies the selected product's effect on the uploaded image.

2. **`initializeMappingMatrix.m`**: 
   - Creates a mapping matrix based on skin tones and undertones.
   - Assigns product identifiers to combinations of skin tones and undertones.

3. **`processImage.m`**: 
   - Loads and processes the uploaded image, enhancing its quality for accurate product representation.
   - Applies histogram equalization and white balance adjustments.

4. **`applyEffect.m`**: 
   - Allows users to choose a product and calculates the similarity between user features and product features.
   - Blends the product effect with the user's image for a realistic representation.

## Assumptions
- Users upload clear photographs for accurate processing.
- The application assumes standard lighting conditions to maintain consistent results.

## Implications
The project's findings can enhance the online shopping experience in the beauty industry, especially during challenging times like the COVID-19 pandemic.

## Getting Started
To run the project locally:
1. Ensure you have MATLAB installed.
2. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/Beauty-and-the-Pandemic.git
