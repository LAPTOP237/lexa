// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../models/language.dart';

/// Widget permettant de sélectionner une langue parmi la liste des langues supportées
class LanguageSelector extends StatelessWidget {
  final Language selectedLanguage;
  final Function(Language) onLanguageSelected;
  final String label;

  const LanguageSelector({
    super.key,
    required this.selectedLanguage,
    required this.onLanguageSelected,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showLanguageBottomSheet(context),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Emoji du drapeau
            Text(
              selectedLanguage.flag,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 8),
            // Nom de la langue (flexible pour éviter le débordement)
            Flexible(
              child: Text(
                selectedLanguage.name,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 4),
            // Icône de déroulement
            Icon(
              Icons.keyboard_arrow_down,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ],
        ),
      ),
    );
  }

  /// Affiche la bottom sheet avec la liste des langues
  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Titre
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(height: 1),
              
              // Liste des langues
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Language.supportedLanguages.length,
                  itemBuilder: (context, index) {
                    final language = Language.supportedLanguages[index];
                    final isSelected = language == selectedLanguage;

                    return ListTile(
                      leading: Text(
                        language.flag,
                        style: const TextStyle(fontSize: 28),
                      ),
                      title: Text(
                        language.name,
                        style: TextStyle(
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      trailing: isSelected
                          ? Icon(
                              Icons.check_circle,
                              color: Theme.of(context).colorScheme.primary,
                            )
                          : null,
                      onTap: () {
                        onLanguageSelected(language);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}