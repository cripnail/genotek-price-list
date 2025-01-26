#!/bin/bash

# Clone repository
git clone https://github.com/cripnail/genotek.git
cd price_app || exit

# Install dependencies
flutter pub get

# Run tests
flutter test test/features/price_list/data/datasources/price_remote_data_source_test.dart

# Build and run
flutter build ios --release
flutter build apk --release
flutter build macos --release

flutter run -d iphone
flutter run -d android
flutter run -d macos

# Instructions
echo "iOS: open ios/Runner.xcworkspace and run"
echo "Android: flutter install apk"
echo "macOS: open build/macos/Build/Products/Release/price_app.app"