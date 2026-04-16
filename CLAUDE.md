# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Run the app
flutter run

# Run on a specific device
flutter run -d <device-id>
flutter devices  # list available devices

# Build
flutter build apk           # Android
flutter build ipa           # iOS
flutter build web           # Web

# Test
flutter test                          # all tests
flutter test test/path/to/file_test.dart  # single test file
flutter test --name "test name"       # single test by name

# Lint & format
flutter analyze
dart format .
dart format --set-exit-if-changed .   # CI check

# Dependencies
flutter pub get
flutter pub upgrade
flutter pub outdated

# Code generation (if using build_runner)
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch
```

## Architecture

This is a Flutter starter project. The typical structure once initialized:

```
lib/
  main.dart          # Entry point; sets up app widget and providers
  app.dart           # Root MaterialApp/CupertinoApp with routing and theme
  core/              # Shared utilities, constants, extensions, base classes
  features/          # Feature-first organization
    <feature>/
      data/          # Repositories, data sources, models (JSON serialization)
      domain/        # Entities, use cases, repository interfaces
      presentation/  # Widgets, screens, state management (BLoC/Riverpod/Provider)
  shared/            # Reusable widgets and services used across features
```

### State Management

Prefer one consistent approach across the app. Common choices:
- **Riverpod** — `StateNotifier` + `ConsumerWidget`; providers defined near their feature
- **BLoC** — `Bloc`/`Cubit` per feature; events → states pattern
- **Provider** — `ChangeNotifier` with `Consumer`/`context.watch`

### Navigation

- Use **GoRouter** or **auto_route** for declarative routing
- Define all routes in a single `router.dart` or `routes.dart` file

### Dependency Injection

- Use **get_it** (service locator) or Riverpod providers as the DI mechanism
- Register dependencies in a `setup_locator.dart` called before `runApp()`

### Data Layer

- Repository pattern: abstract interface in `domain/`, implementation in `data/`
- Models in `data/` handle JSON serialization (via `json_serializable` or `freezed`)
- Entities in `domain/` are plain Dart classes with no framework dependencies

### Testing

- Unit tests: `test/` mirrors `lib/` structure
- Widget tests: use `WidgetTester` and `pumpWidget`
- Integration tests: `integration_test/` directory, use `flutter test integration_test/`
- Mock with `mocktail` or `mockito`
