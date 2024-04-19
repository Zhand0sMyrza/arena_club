import 'package:arena_club/common/extensions/context_extension.dart';
import 'package:arena_club/common/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

///  Красивая анимация по задаче для грейдинга и чтобы забайтить юзера потратить свои кровные

class SuperAnimatedButton extends StatefulWidget {
  const SuperAnimatedButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  State<SuperAnimatedButton> createState() => _SuperAnimatedButtonState();
}

class _SuperAnimatedButtonState extends State<SuperAnimatedButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: widget.onTap,
        child: CustomPaint(
          painter: _SuperAnimationPainter(animation: _animationController),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              context.locale?.refill ?? '',
              style: context.textTheme.s16w600(context, Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

class _SuperAnimationPainter extends CustomPainter {
  final Animation<double> animation;

  _SuperAnimationPainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    const radius = Radius.circular(12);
    final borderRRect = RRect.fromRectAndRadius(rect, radius);
    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..shader = SweepGradient(
        colors: const [
          Colors.red,
          Colors.blue,
        ],
        stops: const [0.3, 0.7],
        startAngle: 0,
        endAngle: vector.radians(180),
        transform: GradientRotation(vector.radians(360 * animation.value)),
        tileMode: TileMode.repeated,
      ).createShader(rect);

    canvas.drawRRect(borderRRect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
