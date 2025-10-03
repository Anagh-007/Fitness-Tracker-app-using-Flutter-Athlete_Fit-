import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../domain/activity.dart';

class AnimatedAthlete extends StatelessWidget {
  const AnimatedAthlete({super.key, required this.activity});
  final ActivityType activity;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x1A6C5CE7), Color(0x1A00D4FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Lottie.asset(
              'assets/animations/${activity.lottieFile}',
              repeat: true,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
