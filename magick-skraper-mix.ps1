# winget upgrade --all --silent
# cd .\Tools\Software\ImageMagick-7.1.1-20-portable-Q16-x64\
# ls
# Explorer.exe .\TEST\
# magick convert gradient.jpg -resize 500x129 gradient_resized.jpg
# .\magick.exe convert gradient.jpg -resize 500x129 gradient_resized.jpg
# .\magick.exe convert gradient.png -resize 500x129 gradient_resized.jpg
# magick convert gradient.png -resize 500x129 gradient_resized.png
# .\magick.exe convert gradient.png -resize 500x129 gradient_resized.png
# .\magick.exe convert background.png -resize 500x430^ -gravity center -extent 500x430 background_resi…
# magick convert logo.png -resize 'x129' -resize '475x<' -resize 475x129 logo_resized.png
# .\magick.exe convert logo.png -resize 'x129' -resize '475x<' -resize 475x129 logo_resized.png
# dir *.png
# magick convert gradient.png -resize 500x129 gradient_resized.png
# .\magick.exe convert gradient.png -resize 500x129 gradient_resized.png
# magick composite -gravity north -geometry +0+0 background_resized.png gradient_resized.png backgroun…
# .\magick.exe composite -gravity north -geometry +0+0 background_resized.png gradient_resized.png bac…
# .\magick.exe convert gradient.png -resize 500x129! gradient_resized.png
# .\magick.exe composite -gravity north -geometry +0+0 background_resized.png gradient_resized.png bac…
# .\magick.exe convert gradient.png -resize 500x129 gradient_resized.png



# prepare background
# .\magick.exe convert background.png -resize 500x430^ -gravity center -extent 500x430 background_resized.png
# .\magick.exe convert background.png -resize 500x430^ -gravity center -extent 500x430 background_resized.png

# prepare gradient
# .\magick.exe convert gradient.png -resize 500x129! gradient_resized.png
# .\magick.exe convert gradient.png -resize 500x129! gradient_resized.png

# prepare logo
# .\magick.exe convert logo.png -resize 'x129' -resize '475x<' -resize 475x129 logo_resized.png


# composite gradient w/ background
# .\magick.exe composite -gravity north -geometry +0+0 background_resized.png gradient_resized.png background_with_gradient.png
# .\magick.exe composite -gravity north -geometry +0+0 background_resized.png gradient_resized.png background_with_gradient.png
# .\magick.exe composite -gravity north background_resized.png gradient_resized.png background_with_gradient.png


# composite the logo with the gradient-background
# .\magick.exe composite -gravity north -geometry +0+0 background_with_gradient.png logo_resized.png output.png
# .\magick.exe composite -gravity north -geometry +0+0 background_with_gradient.png logo_resized.png output.png


# background prep
.\magick.exe .\background.png -resize 333x480^ -gravity center -extent 333x480 background_resized.png

# gradient prep
.\magick.exe gradient.png -resize 333x240! gradient_resized.png
.\magick.exe gradient_resized.png -channel A -evaluate multiply 0.75 gradient_resized.png

# logo prep
.\magick.exe logo.png -background-none -resize 316.35x120^ -gravity center -extent 316.35x120 logo_resized.png
.\magick.exe logo_resized.png -background none -splice 0x10 logo_padded.png

# create composite of gradient and background
.\magick.exe background_resized.png gradient_resized.png -gravity North -composite gradient_background.png

# create composite of logo and gradient-background
.\magick.exe gradient_background.png logo_padded.png -background none -gravity North -composite final_output.png

Write-Output "Sucessfully completed composition."