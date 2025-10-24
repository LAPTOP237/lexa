// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart';

/// Page de chargement initiale de l'application
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    
    // Animation des points
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    
    // Attente de 3 secondes avant de passer à Home
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo de l'application
            Image.asset(
              'assets/icons/logo_lexa_app.png',
              width: 160,
              height: 160,
            ),
            const SizedBox(height: 40),
            
            // Points animés de chargement
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) {
                      // Calcul de l'animation décalée pour chaque point
                      final delay = index * 0.2;
                      final value = (_animationController.value - delay) % 1.0;
                      final opacity = value < 0.5 
                          ? value * 2 
                          : 2 - (value * 2);
                      
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(opacity.clamp(0.2, 1.0)),
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}