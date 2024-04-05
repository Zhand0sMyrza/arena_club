import 'package:arena_club/common/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AppSplashScreen extends StatefulWidget {
  const AppSplashScreen({super.key});

  @override
  State<AppSplashScreen> createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _bgAnimationController;
  bool _colorFlag = true;

  @override
  void initState() {
    _bgAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0.0,
      upperBound: 1.0,
      animationBehavior: AnimationBehavior.preserve,
    )
      ..animateTo(1, curve: Curves.easeOut)
      ..addListener(_animationListener);
    super.initState();
  }

  _animationListener() {
    if (_bgAnimationController.isCompleted) {
      setState(() => _colorFlag = !_colorFlag);
      _bgAnimationController
        ..stop()
        ..reset()
        ..animateTo(1, curve: Curves.easeOut);
    }
  }

  @override
  void dispose() {
    _bgAnimationController
      ..stop()
      ..removeListener(_animationListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Material(
        child: Center(
          child: Stack(
            children: [
              Center(
                child: AnimatedBuilder(
                  animation: _bgAnimationController,
                  builder: (context, child) {
                    final bgSize = 370 * (_bgAnimationController.value + 0.5);
                    return Container(
                      width: bgSize,
                      height: bgSize,
                      decoration: BoxDecoration(
                        color: _colorFlag
                            ? Colors.redAccent
                            .withOpacity(1 - _bgAnimationController.value)
                            : Colors.blue
                            .withOpacity(1 - _bgAnimationController.value),
                        borderRadius: BorderRadius.circular(120),
                      ),
                    );
                  },
                ),
              ),
              Positioned.fill(
                child: Assets.images.arenaCLUBLogo.image(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}