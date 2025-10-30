



# Troubleshooting Guide

## Java/Gradle Version Compatibility Issue

If you're getting the error:
```
BUG! exception in phase 'semantic analysis' in source unit '_BuildScript_' Unsupported class file major version 65
```

This means your Java version (likely Java 21) is incompatible with the Gradle version.

### Solution 1: Use the Updated Project (Recommended)

The project has been updated with:
- **Gradle 8.7** (compatible with Java 21)
- **Android Gradle Plugin 8.2.2**
- **Kotlin 1.9.24**

Just pull the latest changes and try again:
```bash
git pull origin main
flutter clean
flutter pub get
flutter run
```

### Solution 2: Downgrade Java (Alternative)

If you prefer to use Java 17 instead:
1. Install Java 17
2. Set JAVA_HOME to point to Java 17
3. Update your PATH

### Solution 3: Regenerate Platform Files

If the above doesn't work, regenerate the platform files:
```bash
# Remove existing platform directories
rm -rf android windows linux macos

# Regenerate with Flutter
flutter create --platforms=android,windows,linux,macos,web .
```

### Check Your Java Version

```bash
java -version
```

Expected output for compatibility:
- **Java 17** (recommended for Flutter)
- **Java 21** (works with Gradle 8.7+)

### Verify Gradle Version

The project now uses:
- **Gradle 8.7** in `android/gradle/wrapper/gradle-wrapper.properties`
- **Android Gradle Plugin 8.2.2** in `android/build.gradle`

## Common Fixes

### 1. Clean and Rebuild
```bash
flutter clean
flutter pub get
flutter run
```

### 2. Clear Gradle Cache
```bash
cd android
./gradlew clean
cd ..
```

### 3. Check Flutter Doctor
```bash
flutter doctor -v
```

Make sure all components are properly installed and configured.

## Platform-Specific Issues

### Windows
- Ensure Visual Studio Build Tools are installed
- Check Windows SDK version

### Android
- Verify Android SDK is installed
- Check Android Studio setup

### Web
- Ensure Chrome is installed
- Check web renderer compatibility

## Still Having Issues?

1. Check the GitHub repository for latest updates
2. Create an issue with your specific error logs
3. Include your `flutter doctor -v` output



