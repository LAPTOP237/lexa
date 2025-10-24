import 'package:flutter/material.dart';
import '../services/storage_service.dart';

/// ViewModel gérant le thème de l'application
class ThemeViewModel extends ChangeNotifier {
  final StorageService _storageService;
  
  ThemeMode _themeMode = ThemeMode.system;

  ThemeViewModel(this._storageService) {
    _loadThemeMode();
  }

  /// Getter pour le mode de thème actuel
  ThemeMode get themeMode => _themeMode;

  /// Charge le mode de thème depuis le stockage local
  Future<void> _loadThemeMode() async {
    final savedMode = await _storageService.getThemeMode();
    _themeMode = _themeModeFromString(savedMode);
    notifyListeners();
  }

  /// Change le mode de thème et le sauvegarde
  /// 
  /// [mode] : Le nouveau mode de thème à appliquer
  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode != mode) {
      _themeMode = mode;
      await _storageService.saveThemeMode(_themeModeToString(mode));
      notifyListeners();
    }
  }

  /// Convertit une chaîne en ThemeMode
  ThemeMode _themeModeFromString(String mode) {
    switch (mode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  /// Convertit un ThemeMode en chaîne
  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      default:
        return 'system';
    }
  }

  /// Vérifie si le thème actuel est clair
  /// 
  /// [context] : Le contexte pour déterminer la luminosité
  bool isLightTheme(BuildContext context) {
    if (_themeMode == ThemeMode.light) return true;
    if (_themeMode == ThemeMode.dark) return false;
    return MediaQuery.of(context).platformBrightness == Brightness.light;
  }
}