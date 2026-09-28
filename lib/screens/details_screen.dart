import 'package:flutter/material.dart';

import '../models/movie.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headingStyle = theme.textTheme.titleLarge?.copyWith(
      color: theme.colorScheme.primary,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Movie details')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 280),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          movie.posterPath,
                          fit: BoxFit.contain,
                          semanticLabel: '${movie.title} poster',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(movie.title, style: theme.textTheme.headlineSmall),
                  const SizedBox(height: 24),
                  Text('Cast', style: headingStyle),
                  const SizedBox(height: 8),
                  for (final actor in movie.cast)
                    Text(actor, style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 24),
                  Text('Synopsis', style: headingStyle),
                  const SizedBox(height: 8),
                  Text(movie.synopsis, style: theme.textTheme.bodyLarge),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
