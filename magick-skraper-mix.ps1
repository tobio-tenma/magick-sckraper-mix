# background prep
.\magick.exe .\images\background.png -resize 333x480^ -gravity center -extent 333x480 background_resized.png

# gradient prep
.\magick.exe images\gradient.png -resize 333x240! .work-temp\gradient_resized.png
.\magick.exe .work-temp\gradient_resized.png -channel A -evaluate multiply 0.75 .work-temp\gradient_resized.png

# logo prep
.\magick.exe images\logo.png -background-none -resize 316.35x120^ -gravity center -extent 316.35x120 .work-temp\logo_resized.png
.\magick.exe .work-temp\logo_resized.png -background none -splice 0x10 .work-temp\logo_padded.png

# create composite of gradient and background
.\magick.exe .work-temp\background_resized.png .work-temp\gradient_resized.png -gravity North -composite .work-temp\gradient_background.png

# create composite of logo and gradient-background
.\magick.exe .work-temp\gradient_background.png .work-temp\logo_padded.png -background none -gravity North -composite final_output.png

Write-Output "Sucessfully completed composition."