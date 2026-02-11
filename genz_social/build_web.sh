#!/bin/bash

# Build script for Gen-Z Social Flutter Web

echo "========================================"
echo "Gen-Z Social - Flutter Web Build Script"
echo "========================================"
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "Error: Flutter is not installed or not in PATH"
    echo "Please install Flutter from https://flutter.dev/docs/get-started/install"
    exit 1
fi

echo "Flutter version:"
flutter --version
echo ""

# Clean previous build
echo "Cleaning previous build..."
flutter clean
echo ""

# Get dependencies
echo "Getting dependencies..."
flutter pub get
echo ""

# Analyze code
echo "Analyzing code..."
flutter analyze
echo ""

# Build for web
echo "Building for web..."
flutter build web --release
echo ""

# Check build result
if [ -d "build/web" ]; then
    echo "========================================"
    echo "Build successful!"
    echo "Output directory: build/web/"
    echo "========================================"
    
    # List build output
    echo ""
    echo "Build output files:"
    ls -la build/web/
else
    echo "========================================"
    echo "Build failed!"
    echo "========================================"
    exit 1
fi
