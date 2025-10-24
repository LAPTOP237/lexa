import 'package:equatable/equatable.dart';

/// Modèle représentant une traduction
class Translation extends Equatable {
  final String sourceText;      // Texte source
  final String translatedText;  // Texte traduit
  final String sourceLang;      // Code de la langue source
  final String targetLang;      // Code de la langue cible
  final DateTime timestamp;     // Date et heure de la traduction

  const Translation({
    required this.sourceText,
    required this.translatedText,
    required this.sourceLang,
    required this.targetLang,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [
        sourceText,
        translatedText,
        sourceLang,
        targetLang,
        timestamp,
      ];

  /// Convertit le modèle en JSON
  Map<String, dynamic> toJson() {
    return {
      'sourceText': sourceText,
      'translatedText': translatedText,
      'sourceLang': sourceLang,
      'targetLang': targetLang,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  /// Crée une instance depuis JSON
  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      sourceText: json['sourceText'] as String,
      translatedText: json['translatedText'] as String,
      sourceLang: json['sourceLang'] as String,
      targetLang: json['targetLang'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }
}