#!/bin/sh

# NOT TESTED YET: Use at your own risk

# background prep
magick background.png -resize 333x480^ -gravity center -extent 333x480 background_resized.png

# gradient prep
magick gradient.png -resize 333x240! gradient_resized.png
magick gradient_resized.png -channel A -evaluate multiply 0.75 gradient_resized.png

# logo prep
magick logo.png -background-none -resize 316.35x120^ -gravity center -extent 316.35x120 logo_resized.png
magick logo_resized.png -background none -splice 0x10 logo_padded.png

# create composite of gradient and background
magick background_resized.png gradient_resized.png -gravity North -composite gradient_background.png

# create composite of logo and gradient-background
magick gradient_background.png logo_padded.png -background none -gravity North -composite final_output.png

echo "Sucessfully completed composition."