# 🌐 Lexa - Application de Traduction Multilingue

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

**Lexa** est une application mobile de traduction élégante et intuitive développée avec Flutter, supportant 10 langues et offrant une expérience utilisateur fluide avec un mode sombre/clair.

## ✨ Fonctionnalités

- 🌍 **Traduction en temps réel** - Support de 10 langues les plus courantes
- 🔄 **Permutation rapide** - Échangez instantanément les langues source et cible
- 🌓 **Mode sombre/clair** - Adaptation automatique ou manuelle du thème
- 📋 **Copie rapide** - Copiez vos traductions en un clic
- 💾 **Sauvegarde des préférences** - Vos langues favorites sont mémorisées
- 🎨 **Interface moderne** - Design Material 3 avec animations fluides
- 🚀 **Performance optimale** - Architecture MVVM + Provider

## 🌐 Langues supportées

- 🇬🇧 Anglais
- 🇫🇷 Français
- 🇪🇸 Espagnol
- 🇩🇪 Allemand
- 🇮🇹 Italien
- 🇵🇹 Portugais
- 🇸🇦 Arabe
- 🇨🇳 Chinois
- 🇯🇵 Japonais
- 🇷🇺 Russe

## 📸 Captures d'écran

> _À ajouter : captures d'écran de l'application_

## 🏗️ Architecture

L'application utilise le pattern **MVVM (Model-View-ViewModel)** avec **Provider** pour la gestion d'état :

```
lib/
├── models/          # Modèles de données
├── viewmodels/      # Logique métier
├── views/           # Interfaces utilisateur
├── widgets/         # Composants réutilisables
├── services/        # Services (API, Storage)
└── utils/           # Utilitaires (Thèmes, etc.)
```

## 🛠️ Technologies utilisées

- **Flutter** - Framework de développement
- **Provider** - Gestion d'état
- **MyMemory API** - Service de traduction
- **SharedPreferences** - Stockage local
- **Google Fonts** - Police Poppins
- **Material 3** - Design system

## 🚀 Installation

### Prérequis

- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio / VS Code
- Un émulateur ou appareil physique

### Étapes

1. **Cloner le repository**
```bash
git clone https://github.com/votre-username/lexa.git
cd lexa
```

2. **Installer les dépendances**
```bash
flutter pub get
```

3. **Lancer l'application**
```bash
flutter run
```

## 📦 Dépendances principales

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1
  http: ^1.1.0
  shared_preferences: ^2.2.2
  google_fonts: ^6.1.0
  equatable: ^2.0.5
```

## 🎨 Personnalisation

### Couleurs

Les couleurs principales peuvent être modifiées dans `lib/utils/app_theme.dart` :

```dart
static const Color primaryColor = Color(0xFF6750A4);
static const Color secondaryColor = Color(0xFFE8DEF8);
static const Color lightBackground = Color(0xFFFFFFFF);
static const Color darkBackground = Color(0xFF0F0231);
```

### Ajouter des langues

Modifiez la liste dans `lib/models/language.dart` :

```dart
static List<Language> get supportedLanguages => [
  const Language(name: 'Votre Langue', code: 'xx', flag: '🏳️'),
  // ...
];
```

## 🔮 Fonctionnalités à venir

- 🎤 **Traduction vocale** - Traduisez en parlant
- 📄 **Traduction de documents** - Support PDF, Word, etc.
- 📚 **Historique des traductions** - Retrouvez vos anciennes traductions
- ⭐ **Favoris** - Sauvegardez vos traductions importantes
- 🌐 **Mode hors ligne** - Traductions basiques sans connexion

## 📝 Licence

Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

## 👨‍💻 Auteur

**Votre Nom**
- GitHub: [@LAPTOP237](https://github.com/LAPTOP237)

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :

1. Fork le projet
2. Créer une branche (`git checkout -b feature/AmazingFeature`)
3. Commit vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrir une Pull Request

## 🙏 Remerciements

- [MyMemory API](https://mymemory.translated.net/) - Service de traduction
- [Flutter](https://flutter.dev/) - Framework
- [Material Design](https://m3.material.io/) - Design system

## 📧 Contact

Pour toute question ou suggestion : linjouom9@gmail.com

---

⭐ Si vous aimez ce projet, n'hésitez pas à lui donner une étoile !
