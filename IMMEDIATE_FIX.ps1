

# Immediate Fix for Flutter Eneba App
# Run this in PowerShell from your project root

Write-Host "Fixing launch_background.xml issue..." -ForegroundColor Green

# Delete the problematic file if it exists
Remove-Item "android\app\src\main\res\drawable\launch_background.xml" -Force -ErrorAction SilentlyContinue

# Create the correct launch_background.xml file
$xmlContent = @'
<?xml version="1.0" encoding="utf-8"?>
<!-- Modify this file to customize your launch splash screen -->
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:drawable="@android:color/white" />

    <!-- You can insert your own image assets here -->
    <!-- <item>
        <bitmap
            android:gravity="center"
            android:src="@mipmap/ic_launcher" />
    </item> -->
</layer-list>
'@

# Write the file with proper encoding
$xmlContent | Out-File -FilePath "android\app\src\main\res\drawable\launch_background.xml" -Encoding utf8

Write-Host "File created successfully!" -ForegroundColor Green

# Clean and rebuild
Write-Host "Running flutter clean..." -ForegroundColor Yellow
flutter clean

Write-Host "Running flutter pub get..." -ForegroundColor Yellow
flutter pub get

Write-Host "Now run: flutter run" -ForegroundColor Cyan

