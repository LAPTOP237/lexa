import 'package:flutter/material.dart';
import 'text_translation_page.dart';
import 'voice_page.dart';
import 'docs_page.dart';
import 'settings_page.dart';

/// Page d'accueil principale avec navigation bottom bar
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Liste des pages
  final List<Widget> _pages = const [
    TextTranslationPage(),
    VoicePage(),
    DocsPage(),
  ];

  // Titres des pages
  final List<String> _titles = const [
    'Text Translation',
    'Voice Translation',
    'Docs Translation',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        // Logo à gauche
        leading: Image.asset(
          'assets/icons/app_icon.png',
          width: 10,
          height: 10,
        ),

        // Titre au centre
        title: Text(_titles[_currentIndex]),

        // Bouton paramètres à droite
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
            tooltip: 'Paramètres',
          ),
        ],
      ),

      // Corps de la page
      body: _pages[_currentIndex],

      // Barre de navigation inférieure
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          // Onglet Texte
          NavigationDestination(
            icon: Icon(Icons.text_fields),
            selectedIcon: Icon(Icons.text_fields),
            label: 'Text',
          ),

          // Onglet Voix
          NavigationDestination(
            icon: Icon(Icons.mic_outlined),
            selectedIcon: Icon(Icons.mic),
            label: 'Voice',
          ),

          // Onglet Documents
          NavigationDestination(
            icon: Icon(Icons.description_outlined),
            selectedIcon: Icon(Icons.description),
            label: 'Docs',
          ),
        ],
      ),
    );
  }
}
