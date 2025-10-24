// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Page de traduction vocale (en cours de développement)
class VoicePage extends StatelessWidget {
  const VoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icône
            Icon(
              Icons.mic,
              size: 100,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
            
            const SizedBox(height: 24),
            
            // Titre
            Text(
              'Traduction vocale',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 16),
            
            // Message
            Text(
              'Fonctionnalité en cours de développement',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 8),
            
            Text(
              'Bientôt disponible pour traduire vos conversations en temps réel',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}