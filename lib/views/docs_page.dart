// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Page de traduction de documents (en cours de développement)
class DocsPage extends StatelessWidget {
  const DocsPage({super.key});

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
              Icons.description,
              size: 100,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
            
            const SizedBox(height: 24),
            
            // Titre
            Text(
              'Traduction de documents',
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
              'Bientôt disponible pour traduire vos fichiers PDF, Word et autres documents',
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