'''Reverse background color of image
Approach suggested by Dr Capriotti
Author: R Nate Crummett, 04/2024'''
from pathlib import Path

import matplotlib.colors as mpcol
import matplotlib.image as mpimg
import matplotlib.pyplot as plt
import numpy as np # uint8 type

# Path to image, .jpg used in example
image_path = Path('1-s2.0-S0098300420306531-gr3_lrg.jpg')
output_path = Path('Weihermann2021.jpg')

# Load image
rgb_255 = mpimg.imread(image_path)

def scale_255_to_1(image):
    ''' Rescale pixel values from 0-255 to 0.0-1.0 '''
    max_image,   min_image   = 255, 0
    max_rescale, min_rescale = 1., 0.
    return image * (max_rescale - min_rescale) / (max_image - min_image) + min_rescale

def invert_rgb(image):
    ''' Invert a 0.0-1.0 RGB image '''
    max_image, min_image = 1., 0.
    return max_image - image

def scale_1_to_255(image):
    ''' Rescale pixel values from 0.0-1.0 to 0-255 '''
    max_image,   min_image   = 1., 0.
    max_rescale, min_rescale = 255, 0
    return (image * (max_rescale - min_rescale) / (max_image - min_image) + min_rescale).astype(np.uint8)

# Rescale image between 0 and 1
rgb_1 = scale_255_to_1(rgb_255)

# Invert rgb
inv_1 = invert_rgb(rgb_1)

# RGB to HSV transformation
hsv_1 = mpcol.rgb_to_hsv(inv_1)

# Spin 'H' Hue
hsv_1[:,:,0] = ( hsv_1[:,:,0] + 0.5 ) % 1

# Invert transform to RGB
rgb_1 = mpcol.hsv_to_rgb(hsv_1)

# Rescale image for display
rgb_255 = scale_1_to_255(rgb_1)

# Save output image
mpimg.imsave(output_path, rgb_255)
