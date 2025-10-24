import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/translation_viewmodel.dart';
import 'language_selector.dart';

/// Widget représentant la barre de sélection des langues avec le bouton de permutation
class LanguageBar extends StatelessWidget {
  const LanguageBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TranslationViewModel>(
      builder: (context, viewModel, child) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Sélecteur de langue source
              Expanded(
                child: LanguageSelector(
                  selectedLanguage: viewModel.sourceLanguage,
                  onLanguageSelected: (language) {
                    viewModel.setSourceLanguage(language);
                  },
                  label: 'Langue source',
                ),
              ),
              
              const SizedBox(width: 12),
              
              // Bouton de permutation des langues
              InkWell(
                onTap: () {
                  viewModel.swapLanguages();
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.swap_horiz,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
              
              const SizedBox(width: 12),
              
              // Sélecteur de langue cible
              Expanded(
                child: LanguageSelector(
                  selectedLanguage: viewModel.targetLanguage,
                  onLanguageSelected: (language) {
                    viewModel.setTargetLanguage(language);
                  },
                  label: 'Langue cible',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}