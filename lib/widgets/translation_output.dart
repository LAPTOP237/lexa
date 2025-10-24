// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../viewmodels/translation_viewmodel.dart';

/// Widget pour afficher le résultat de la traduction
class TranslationOutput extends StatelessWidget {
  const TranslationOutput({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TranslationViewModel>(
      builder: (context, viewModel, child) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Label
                Row(
                  children: [
                    Text(
                      viewModel.targetLanguage.flag,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      viewModel.targetLanguage.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 12),
                
                // Zone de résultat
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(minHeight: 100),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: viewModel.translatedText.isEmpty
                      ? Text(
                          'La traduction apparaîtra ici...',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.5),
                            fontSize: 16,
                          ),
                        )
                      : Text(
                          viewModel.translatedText,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                ),
                
                // Affichage des erreurs
                if (viewModel.errorMessage != null) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red.withOpacity(0.3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.error_outline, color: Colors.red),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            viewModel.errorMessage!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                
                // Bouton de copie
                if (viewModel.translatedText.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () {
                        // Copier dans le presse-papiers
                        Clipboard.setData(
                          ClipboardData(text: viewModel.translatedText),
                        );
                        
                        // Afficher un snackbar de confirmation
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Texte copié dans le presse-papiers'),
                            duration: const Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.copy),
                      label: const Text('Copier'),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}