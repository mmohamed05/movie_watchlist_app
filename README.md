# CW-02 Flutter Movie Watchlist App

A Flutter coursework app for the CW-02 undergraduate assignment. It lets users
browse five movies and open their details. Graduate-only watchlist controls and
a watchlist screen are outside this project's scope.

## Implemented features

- Scrollable movie list with titles, local poster thumbnails, and rounded cards.
- Details showing the selected movie's title, poster, cast, and synopsis.
- Navigation using `Navigator.push` and `MaterialPageRoute`, passing the complete
  `Movie` object to `DetailsScreen`, with AppBar Back navigation.
- Scrollable details, proportional posters, and a dark theme with amber accents.
- Widget tests covering all five movies, navigation, and bundled poster decoding.

## Project structure

```text
lib/
  main.dart                    App entry point and theme
  models/movie.dart            Movie data model
  data/movies_data.dart         Five sample movies
  screens/home_screen.dart     Movie list
  screens/details_screen.dart  Selected movie details
assets/images/                 Local JPEG posters and SOURCES.md
test/widget_test.dart          Widget and asset checks
```

The model includes `isWatchlisted` to match the assignment example; the
undergraduate app does not expose watchlist functionality.

## Run the app

Install Flutter with a compatible Dart SDK (see `pubspec.yaml`) and configure
an Android device or emulator with the Android SDK. From the project root:

```sh
flutter pub get
flutter devices
flutter run -d <device-id>
```

Run the automated checks with:

```sh
flutter analyze
flutter test
```

## Build the release APK

From the project root:

```sh
flutter build apk --release
```

The APK is generated at `build/app/outputs/flutter-apk/app-release.apk`.
Build outputs are ignored by Git. To install this exact APK on an Android device
or emulator, substitute the ID reported by `adb devices`:

```sh
adb -s <device-id> install -r build/app/outputs/flutter-apk/app-release.apk
```

Open **movie_watchlist_app** from the device's launcher. The Android project
currently uses the Flutter template's debug signing configuration for release
builds; this is a coursework APK, not a Play Store publishing configuration.

## Poster sources

See [poster sources and conversion notes](assets/images/SOURCES.md).

## Submission status

The critical-thinking Word document and course upload are still pending.
