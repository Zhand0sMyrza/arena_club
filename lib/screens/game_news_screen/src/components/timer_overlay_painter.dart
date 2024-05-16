import 'package:flutter/material.dart';

class TimerOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black87;


    final rect = Rect.fromLTWH(0, 0, size.width, size.height - 30.0);
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(12.0));
    final border = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..shader = const LinearGradient(
        colors: [
          Colors.red,
          Colors.black87,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ).createShader(rect);


    canvas.drawRRect(rrect, paint);
    canvas.drawRRect(rrect, border);

    final path = Path()
      ..moveTo(size.width - 20, -20)
      ..lineTo(size.width - 60, 0)
      ..lineTo(size.width - 30, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
