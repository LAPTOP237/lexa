// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../widgets/language_bar.dart';
import '../widgets/translation_input.dart';
import '../widgets/translation_output.dart';

/// Page principale de traduction de texte
class TextTranslationPage extends StatelessWidget {
  const TextTranslationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Barre de sélection des langues
        const LanguageBar(),
        
        // Séparateur
        Divider(
          height: 1,
          thickness: 1,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
        ),
        
        // Contenu scrollable
        const Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 8),
                
                // Champ de saisie
                TranslationInput(),
                
                // Champ de résultat
                TranslationOutput(),
                
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}