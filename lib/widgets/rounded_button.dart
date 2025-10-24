import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  const RoundedButton({required this.child, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        elevation: 2,
      ),
      child: child,
    );
  }
}
