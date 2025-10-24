import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/translation_service.dart';
import 'services/storage_service.dart';
import 'viewmodels/theme_viewmodel.dart';
import 'viewmodels/translation_viewmodel.dart';
import 'utils/app_theme.dart';
import 'views/splash_view.dart';

void main() {
  runApp(const LexaApp());
}

/// Widget racine de l'application Lexa
class LexaApp extends StatelessWidget {
  const LexaApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialisation des services
    final storageService = StorageService();
    final translationService = TranslationService();

    return MultiProvider(
      providers: [
        // Provider pour le thème
        ChangeNotifierProvider(
          create: (_) => ThemeViewModel(storageService),
        ),
        
        // Provider pour la traduction
        ChangeNotifierProvider(
          create: (_) => TranslationViewModel(
            translationService,
            storageService,
          ),
        ),
      ],
      child: Consumer<ThemeViewModel>(
        builder: (context, themeViewModel, child) {
          return MaterialApp(
            // Configuration de base
            title: 'Lexa',
            debugShowCheckedModeBanner: false,
            
            // Thèmes
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeViewModel.themeMode,
            
            // Page d'accueil (maintenant SplashView)
            home: const SplashView(),
          );
        },
      ),
    );
  }
}