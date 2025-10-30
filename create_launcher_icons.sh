

#!/bin/bash

# Script to create placeholder launcher icons for Android
# Run this script to create basic placeholder icons

echo "Creating placeholder launcher icons..."

# Create a simple colored square as a placeholder
convert -size 192x192 xc:#2196F3 -fill white -gravity center -pointsize 48 -annotate +0+0 "E" android/app/src/main/res/mipmap-hdpi/ic_launcher.png
convert -size 144x144 xc:#2196F3 -fill white -gravity center -pointsize 36 -annotate +0+0 "E" android/app/src/main/res/mipmap-mdpi/ic_launcher.png
convert -size 192x192 xc:#2196F3 -fill white -gravity center -pointsize 48 -annotate +0+0 "E" android/app/src/main/res/mipmap-xhdpi/ic_launcher.png
convert -size 288x288 xc:#2196F3 -fill white -gravity center -pointsize 72 -annotate +0+0 "E" android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png
convert -size 384x384 xc:#2196F3 -fill white -gravity center -pointsize 96 -annotate +0+0 "E" android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png

echo "Placeholder icons created successfully!"
echo "You can replace these with your own icons later."

