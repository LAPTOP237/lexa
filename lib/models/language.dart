import 'package:equatable/equatable.dart';

/// Modèle représentant une langue disponible pour la traduction
class Language extends Equatable {
  final String name;        // Nom de la langue (ex: "Anglais")
  final String code;        // Code ISO de la langue (ex: "en")
  final String flag;        // Emoji du drapeau

  const Language({
    required this.name,
    required this.code,
    required this.flag,
  });

  @override
  List<Object?> get props => [name, code, flag];

  /// Liste des langues supportées par l'application
  static List<Language> get supportedLanguages => [
        const Language(name: 'Anglais', code: 'en', flag: '🇬🇧'),
        const Language(name: 'Français', code: 'fr', flag: '🇫🇷'),
        const Language(name: 'Espagnol', code: 'es', flag: '🇪🇸'),
        const Language(name: 'Allemand', code: 'de', flag: '🇩🇪'),
        const Language(name: 'Italien', code: 'it', flag: '🇮🇹'),
        const Language(name: 'Portugais', code: 'pt', flag: '🇵🇹'),
        const Language(name: 'Arabe', code: 'ar', flag: '🇸🇦'),
        const Language(name: 'Chinois', code: 'zh', flag: '🇨🇳'),
        const Language(name: 'Japonais', code: 'ja', flag: '🇯🇵'),
        const Language(name: 'Russe', code: 'ru', flag: '🇷🇺'),
      ];
}