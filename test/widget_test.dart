import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_watchlist_app/data/movies_data.dart';
import 'package:movie_watchlist_app/main.dart';
import 'package:movie_watchlist_app/screens/details_screen.dart';
import 'package:movie_watchlist_app/screens/home_screen.dart';

void main() {
  testWidgets('Every movie opens its own details and returns home', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(360, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MyApp());

    for (final movie in sampleMovies) {
      await tester.scrollUntilVisible(
        find.text(movie.title),
        150,
        scrollable: find.byType(Scrollable),
      );
      expect(find.text(movie.title), findsOneWidget);
      await tester.tap(find.text(movie.title));
      await tester.pumpAndSettle();

      final screen = tester.widget<DetailsScreen>(find.byType(DetailsScreen));
      expect(screen.movie, same(movie));
      expect(find.text(movie.title), findsOneWidget);
      for (final actor in movie.cast) {
        expect(find.text(actor), findsOneWidget);
      }
      expect(find.text(movie.synopsis), findsOneWidget);
      final poster = tester.widget<Image>(
        find.descendant(
          of: find.byType(DetailsScreen),
          matching: find.byType(Image),
        ),
      );
      expect((poster.image as AssetImage).assetName, movie.posterPath);

      await tester.scrollUntilVisible(
        find.text(movie.synopsis),
        150,
        scrollable: find.byType(Scrollable),
      );
      await tester.pumpAndSettle();
      expect(find.text(movie.synopsis).hitTestable(), findsOneWidget);
      expect(tester.takeException(), isNull);

      await tester.pageBack();
      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.byType(DetailsScreen), findsNothing);
      expect(find.text(movie.title), findsOneWidget);
    }
    expect(tester.takeException(), isNull);
  });

  testWidgets('All five bundled posters decode successfully', (tester) async {
    await tester.runAsync(() async {
      for (final movie in sampleMovies) {
        final data = await rootBundle.load(movie.posterPath);
        final codec = await ui.instantiateImageCodec(
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        );
        final frame = await codec.getNextFrame();
        expect(frame.image.width, greaterThan(0));
        expect(frame.image.height, greaterThan(frame.image.width));
        frame.image.dispose();
        codec.dispose();
      }
    });
  });
}
