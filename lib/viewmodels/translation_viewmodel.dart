import 'package:flutter/material.dart';
import '../models/language.dart';
import '../services/translation_service.dart';
import '../services/storage_service.dart';

/// ViewModel gérant la logique de traduction
class TranslationViewModel extends ChangeNotifier {
  final TranslationService _translationService;
  final StorageService _storageService;

  // Langues sélectionnées
  Language _sourceLanguage = Language.supportedLanguages[0]; // Anglais par défaut
  Language _targetLanguage = Language.supportedLanguages[1]; // Français par défaut

  // Textes
  String _sourceText = '';
  String _translatedText = '';

  // États
  bool _isLoading = false;
  String? _errorMessage;

  TranslationViewModel(this._translationService, this._storageService) {
    _loadSavedLanguages();
  }

  // Getters
  Language get sourceLanguage => _sourceLanguage;
  Language get targetLanguage => _targetLanguage;
  String get sourceText => _sourceText;
  String get translatedText => _translatedText;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Charge les langues sauvegardées depuis le stockage local
  Future<void> _loadSavedLanguages() async {
    final sourceCode = await _storageService.getSourceLanguage();
    final targetCode = await _storageService.getTargetLanguage();

    _sourceLanguage = Language.supportedLanguages.firstWhere(
      (lang) => lang.code == sourceCode,
      orElse: () => Language.supportedLanguages[0],
    );

    _targetLanguage = Language.supportedLanguages.firstWhere(
      (lang) => lang.code == targetCode,
      orElse: () => Language.supportedLanguages[1],
    );

    notifyListeners();
  }

  /// Change la langue source
  Future<void> setSourceLanguage(Language language) async {
    if (_sourceLanguage != language) {
      _sourceLanguage = language;
      await _storageService.saveSourceLanguage(language.code);
      
      // Réinitialiser la traduction si les langues sont identiques
      if (_sourceLanguage == _targetLanguage) {
        _translatedText = '';
      }
      
      notifyListeners();
    }
  }

  /// Change la langue cible
  Future<void> setTargetLanguage(Language language) async {
    if (_targetLanguage != language) {
      _targetLanguage = language;
      await _storageService.saveTargetLanguage(language.code);
      
      // Réinitialiser la traduction si les langues sont identiques
      if (_sourceLanguage == _targetLanguage) {
        _translatedText = '';
      }
      
      notifyListeners();
    }
  }

  /// Permute les langues source et cible
  Future<void> swapLanguages() async {
    final temp = _sourceLanguage;
    _sourceLanguage = _targetLanguage;
    _targetLanguage = temp;

    // Sauvegarder les nouvelles langues
    await _storageService.saveSourceLanguage(_sourceLanguage.code);
    await _storageService.saveTargetLanguage(_targetLanguage.code);

    // Permuter également les textes si une traduction existe
    if (_translatedText.isNotEmpty) {
      final tempText = _sourceText;
      _sourceText = _translatedText;
      _translatedText = tempText;
    }

    notifyListeners();
  }

  /// Met à jour le texte source
  void updateSourceText(String text) {
    _sourceText = text;
    // Réinitialiser l'erreur lors de la modification du texte
    if (_errorMessage != null) {
      _errorMessage = null;
      notifyListeners();
    }
  }

  /// Lance la traduction du texte
  Future<void> translateText() async {
    // Vérifications préalables
    if (_sourceText.trim().isEmpty) {
      _errorMessage = 'Veuillez entrer un texte à traduire';
      notifyListeners();
      return;
    }

    if (_sourceLanguage == _targetLanguage) {
      _errorMessage = 'Les langues source et cible doivent être différentes';
      notifyListeners();
      return;
    }

    // Début de la traduction
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Appel au service de traduction
      final result = await _translationService.translate(
        text: _sourceText,
        sourceLang: _sourceLanguage.code,
        targetLang: _targetLanguage.code,
      );

      _translatedText = result;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      _translatedText = '';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Efface le texte source et la traduction
  void clearText() {
    _sourceText = '';
    _translatedText = '';
    _errorMessage = null;
    notifyListeners();
  }
}