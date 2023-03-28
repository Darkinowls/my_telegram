import 'package:flutter/material.dart';

class CloudPainter extends CustomPainter {
  final BuildContext context;

  CloudPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Theme.of(context).scaffoldBackgroundColor
      ..style = PaintingStyle.fill;

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final smaller =  (centerX > centerY)? centerY : centerX;

    final path = Path() // drawing a cloud
      ..quadraticBezierTo(
          centerX/4,  -smaller*0.66,
          centerX/2, -centerY*0.3)
      ..quadraticBezierTo(
          centerX ,  -smaller,
          centerX*1.3, -centerY*0.2)
      ..quadraticBezierTo(
          centerX * 1.8,  -smaller/2,
          centerX * 2, centerY / 2)
      ..quadraticBezierTo(
          centerX * 2 + smaller*0.66 , centerY * 1.3,
          centerX * 2, centerY * 2.1)
      ..lineTo(-smaller*0.1, centerY*2.1 )
      ..quadraticBezierTo(
          -smaller, centerY,
          0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false; // const
}
