# # main_app

A new Flutter project.

## Getting Started

### 1. Initialize
Add this to your `pubspec.yaml`:
```yaml
environment:
  sdk: '>=2.19.6 <3.0.0'
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2
  google_fonts: ^6.1.0
  get: ^4.6.6
  easy_rich_text: ^2.0.0
  equatable: ^2.0.5
  oauth2: ^2.0.2
  json_serializable: ^6.7.1
  json_annotation: ^4.8.1
  shared_preferences: ^2.2.2
  dio: ^5.3.3
  jwt_decoder: ^2.0.1
  

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
  build_runner: ^2.4.6
  flutter_gen_runner: ^5.3.2

flutter:
  uses-material-design: true
  assets:
    - resources/images/
```

### 2. Check version 
Plesae check version Flutter and Dart: 
- Check fvm version: run Python file [`fvm.py`]
- Get package and genenerate file: run Python file [`pub.py`]

### 3. Run app


This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
