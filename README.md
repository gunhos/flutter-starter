# flutterstarter

A new Flutter project.

## Firebase Setup

This repo intentionally excludes Firebase credential files from version control. To connect it to your own Firebase project:

### Prerequisites

- [Firebase CLI](https://firebase.google.com/docs/cli): `npm install -g firebase-tools`
- [FlutterFire CLI](https://firebase.flutter.dev/docs/cli): `dart pub global activate flutterfire_cli`
- A Firebase project created at [console.firebase.google.com](https://console.firebase.google.com)

### Steps

1. **Log in to Firebase**
   ```bash
   firebase login
   ```

2. **Configure FlutterFire for your project**

   Run this from the repo root and follow the prompts to select your Firebase project and target platforms:
   ```bash
   flutterfire configure
   ```

   This generates two files that are gitignored in this repo:
   - `lib/firebase_options.dart` — Dart config used by `Firebase.initializeApp()`
   - `android/app/google-services.json` — Android-specific config

   If you also target iOS, it will generate `ios/Runner/GoogleService-Info.plist`.

3. **Enable Firebase services**

   In the Firebase console, enable the services this app uses:
   - **Authentication** — enable the sign-in methods you need (e.g. Google, Email/Password)
   - **Firestore** — create a database and set security rules

4. **Install dependencies and run**
   ```bash
   flutter pub get
   flutter run
   ```

> **Note:** Never commit `firebase_options.dart`, `google-services.json`, or `GoogleService-Info.plist`. They contain API keys tied to your project and are covered by `.gitignore`.

## Getting Started

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
