import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.amber,
      brightness: Brightness.dark,
      primary: Colors.amber,
    );

    return MaterialApp(
      title: 'Movie Watchlist',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: const Color(0xFF101114),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF101114),
          foregroundColor: Colors.amber,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          color: colorScheme.surfaceContainer,
          elevation: 0,
          margin: const EdgeInsets.only(bottom: 16),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontWeight: FontWeight.bold, height: 1.25),
          titleLarge: TextStyle(fontWeight: FontWeight.w600, height: 1.3),
          titleMedium: TextStyle(fontWeight: FontWeight.w600, height: 1.4),
          bodyLarge: TextStyle(fontSize: 16, height: 1.6),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
