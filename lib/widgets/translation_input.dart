// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/translation_viewmodel.dart';

/// Widget pour le champ de saisie du texte à traduire
class TranslationInput extends StatefulWidget {
  const TranslationInput({super.key});

  @override
  State<TranslationInput> createState() => _TranslationInputState();
}

class _TranslationInputState extends State<TranslationInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                      viewModel.sourceLanguage.flag,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      viewModel.sourceLanguage.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 12),
                
                // Champ de saisie
                TextField(
                  controller: _controller,
                  maxLines: null,
                  minLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Entrez le texte à traduire...',
                    hintStyle: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.5),
                    ),
                  ),
                  style: Theme.of(context).textTheme.bodyLarge,
                  onChanged: (text) {
                    viewModel.updateSourceText(text);
                  },
                ),
                
                const SizedBox(height: 16),
                
                // Bouton d'envoi
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    onPressed: viewModel.isLoading
                        ? null
                        : () {
                            // Masquer le clavier
                            FocusScope.of(context).unfocus();
                            // Lancer la traduction
                            viewModel.translateText();
                          },
                    icon: viewModel.isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.send),
                    label: Text(
                      viewModel.isLoading ? 'Traduction...' : 'Traduire',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}