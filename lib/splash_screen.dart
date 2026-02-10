import 'dart:async';
import 'package:fin_pay/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  final List<Animation<double>> _animations = [];
  final List<double> _barHeights = [100.0, 150.0, 120.0];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      _barHeights.length,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      ),
    );

    for (int i = 0; i < _controllers.length; i++) {
      _animations.add(
        Tween<double>(begin: 0.0, end: _barHeights[i]).animate(
          CurvedAnimation(
            parent: _controllers[i],
            curve: Curves.easeIn,
          ),
        ),
      );
    }

    for (final controller in _controllers) {
      controller.forward();
    }

    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                _animations.length,
                (index) => AnimatedBuilder(
                  animation: _animations[index],
                  builder: (context, child) {
                    return Container(
                      width: 10,
                      height: _animations[index].value,
                      color: Colors.green[400]?.withOpacity(0.5),
                    );
                  },
                ),
              ),
            ),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'FinPay',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Your money. Your move',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
