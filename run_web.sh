




#!/bin/bash

# Flutter Eneba Clone Web Runner
echo "🚀 Starting Flutter Eneba Clone Web App..."

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    echo "❌ Error: pubspec.yaml not found. Please run this script from the project root."
    exit 1
fi

# Create web directory if it doesn't exist
mkdir -p web

# Create a simple web server to serve the app
echo "📦 Setting up web server on port 8080..."
echo "🌐 Your Flutter Eneba Clone will be available at: http://localhost:8080"

# Start the web server
python3 -m http.server 8080 --directory web --bind 0.0.0.0




