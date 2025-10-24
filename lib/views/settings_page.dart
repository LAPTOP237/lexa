// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/theme_viewmodel.dart';

/// Page des paramètres de l'application
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: Consumer<ThemeViewModel>(
        builder: (context, themeViewModel, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Section Apparence
              Text(
                'Apparence',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              
              const SizedBox(height: 16),
              
              // Carte pour le choix du thème
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thème',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Option: Système
                      RadioListTile<ThemeMode>(
                        title: const Text('Suivre le système'),
                        subtitle: const Text(
                          'Utilise le mode défini par votre appareil',
                        ),
                        value: ThemeMode.system,
                        groupValue: themeViewModel.themeMode,
                        onChanged: (ThemeMode? value) {
                          if (value != null) {
                            themeViewModel.setThemeMode(value);
                          }
                        },
                        activeColor: Theme.of(context).colorScheme.primary,
                      ),
                      
                      const Divider(),
                      
                      // Option: Clair
                      RadioListTile<ThemeMode>(
                        title: const Text('Mode clair'),
                        subtitle: const Text('Thème avec fond blanc'),
                        value: ThemeMode.light,
                        groupValue: themeViewModel.themeMode,
                        onChanged: (ThemeMode? value) {
                          if (value != null) {
                            themeViewModel.setThemeMode(value);
                          }
                        },
                        activeColor: Theme.of(context).colorScheme.primary,
                      ),
                      
                      const Divider(),
                      
                      // Option: Sombre
                      RadioListTile<ThemeMode>(
                        title: const Text('Mode sombre'),
                        subtitle: const Text('Thème avec fond foncé'),
                        value: ThemeMode.dark,
                        groupValue: themeViewModel.themeMode,
                        onChanged: (ThemeMode? value) {
                          if (value != null) {
                            themeViewModel.setThemeMode(value);
                          }
                        },
                        activeColor: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Section À propos
              Text(
                'À propos',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              
              const SizedBox(height: 16),
              
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.info_outline),
                        title: Text('Version'),
                        subtitle: Text('1.0.0'),
                      ),
                      
                      Divider(),
                      
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.translate),
                        title: Text('API de traduction'),
                        subtitle: Text('MyMemory Translation API'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}