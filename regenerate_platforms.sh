



#!/bin/bash

# Script to regenerate Flutter platform files
# Run this in your Flutter project directory

echo "🔧 Regenerating Flutter platform files..."

# Remove existing platform directories to force regeneration
echo "Removing existing platform directories..."
rm -rf android
rm -rf windows
rm -rf linux
rm -rf macos

# Regenerate platform files using Flutter create
echo "Regenerating platform files..."
flutter create --platforms=android,windows,linux,macos,web .

echo "✅ Platform files regenerated successfully!"
echo ""
echo "📱 Now you can run:"
echo "   flutter run -d chrome    # for web"
echo "   flutter run -d windows   # for windows" 
echo "   flutter run -d android   # for android"
echo "   flutter run -d linux     # for linux"
echo "   flutter run -d macos     # for macos"



