import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Configuration des thèmes de l'application
class AppTheme {
  // Couleurs personnalisées
  static const Color primaryColor = Color(0xFF6750A4);
  static const Color secondaryColor = Color(0xFFE8DEF8);
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color darkBackground = Color(0xFF0F0231);

  /// Thème clair de l'application
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      
      // Couleurs principales
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: lightBackground,
        onPrimary: Colors.white,
        onSecondary: Colors.black87,
        onSurface: Colors.black87,
      ),
      
      scaffoldBackgroundColor: lightBackground,
      
      // Typographie avec Poppins
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: Colors.black87,
        displayColor: Colors.black87,
      ),
      
      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: lightBackground,
        foregroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      
      // Cartes
      cardTheme: const CardThemeData(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      
      // Champs de texte
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
      
      // Boutons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Boutons d'icônes
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: Colors.black87,
        ),
      ),
    );
  }

  /// Thème sombre de l'application
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      
      // Couleurs principales
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        surface: darkBackground,
        onPrimary: Colors.white,
        onSecondary: Colors.black87,
        onSurface: Colors.white,
      ),
      
      scaffoldBackgroundColor: darkBackground,
      
      // Typographie avec Poppins
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      
      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: darkBackground,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      
      // Cartes
      cardTheme: const CardThemeData(
        color: Color(0xFF1A0F3E),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      
      // Champs de texte
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1A0F3E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
      
      // Boutons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Boutons d'icônes
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}