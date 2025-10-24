import 'package:shared_preferences/shared_preferences.dart';

/// Service responsable de la persistance des données locales
class StorageService {
  // Clés pour le stockage
  static const String _themeKey = 'theme_mode';
  static const String _sourceLangKey = 'source_language';
  static const String _targetLangKey = 'target_language';

  /// Sauvegarde le mode de thème
  /// 
  /// [mode] : 'light', 'dark' ou 'system'
  Future<void> saveThemeMode(String mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, mode);
  }

  /// Récupère le mode de thème sauvegardé
  /// 
  /// Retourne 'system' par défaut si aucune valeur n'est sauvegardée
  Future<String> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themeKey) ?? 'system';
  }

  /// Sauvegarde la langue source sélectionnée
  Future<void> saveSourceLanguage(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_sourceLangKey, langCode);
  }

  /// Récupère la langue source sauvegardée
  /// 
  /// Retourne 'en' (Anglais) par défaut
  Future<String> getSourceLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_sourceLangKey) ?? 'en';
  }

  /// Sauvegarde la langue cible sélectionnée
  Future<void> saveTargetLanguage(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_targetLangKey, langCode);
  }

  /// Récupère la langue cible sauvegardée
  /// 
  /// Retourne 'fr' (Français) par défaut
  Future<String> getTargetLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_targetLangKey) ?? 'fr';
  }
}