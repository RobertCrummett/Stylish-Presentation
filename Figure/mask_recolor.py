'''Make all non transparent pixels black
Author: R Nate Crummett, 05/2024'''
from pathlib import Path

import matplotlib.image as mpimg

# Path to image, .jpg used in example
image_path = Path('Figure/mines-temp.png')
output_path = Path('Figure/mines-logo-light.png')

#######################################
# Load image
rgb_255 = mpimg.imread(image_path)

# Mask non transparent areas
rgb_mask = rgb_255[...,-1] != 0

# Set all non transparent values to black
rgb_255[rgb_mask,:-1] = 1

##########################################
# Save output image
mpimg.imsave(output_path, rgb_255)
