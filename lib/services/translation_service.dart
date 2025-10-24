import 'dart:convert';
import 'package:http/http.dart' as http;

/// Service responsable des appels à l'API MyMemory pour la traduction
class TranslationService {
  // URL de base de l'API MyMemory
  static const String _baseUrl = 'https://api.mymemory.translated.net';

  /// Traduit un texte d'une langue source vers une langue cible
  /// 
  /// [text] : Le texte à traduire
  /// [sourceLang] : Code ISO de la langue source (ex: 'en')
  /// [targetLang] : Code ISO de la langue cible (ex: 'fr')
  /// 
  /// Retourne le texte traduit ou lance une exception en cas d'erreur
  Future<String> translate({
    required String text,
    required String sourceLang,
    required String targetLang,
  }) async {
    try {
      // Construction de l'URL avec les paramètres
      final uri = Uri.parse('$_baseUrl/get').replace(
        queryParameters: {
          'q': text,
          'langpair': '$sourceLang|$targetLang',
        },
      );

      // Appel à l'API
      final response = await http.get(uri);

      // Vérification du code de statut HTTP
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        // Extraction du texte traduit
        final translatedText = data['responseData']?['translatedText'];
        
        if (translatedText != null && translatedText.isNotEmpty) {
          return translatedText as String;
        } else {
          throw Exception('Traduction vide reçue de l\'API');
        }
      } else {
        throw Exception(
          'Erreur HTTP ${response.statusCode}: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      // Propagation de l'erreur avec un message personnalisé
      if (e.toString().contains('SocketException') ||
          e.toString().contains('TimeoutException')) {
        throw Exception(
          'Erreur de connexion. Vérifiez votre connexion internet.',
        );
      }
      rethrow;
    }
  }
}