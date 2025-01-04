import 'package:flutter/material.dart';

class DashedBorderContainer extends StatelessWidget {
  final Widget child;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final Color borderColor;
  final double borderRadius;
  final EdgeInsets padding;

  const DashedBorderContainer({
    Key? key,
    required this.child,
    this.strokeWidth = 2.0,
    this.dashWidth = 6.0,
    this.dashSpace = 4.0,
    this.borderColor = Colors.grey,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        dashWidth: 8.0,
                    dashSpace: 4.0,
                    strokeWidth: 1.0,
                    borderColor: Color.fromRGBO(141, 188, 211, 1),
                    borderRadius: 7.0,
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final Color borderColor;
  final double borderRadius;

  DashedBorderPainter({
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
    required this.borderColor,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(borderRadius),
        ),
      );

    final dashPath = Path();
    double distance = 0.0;
    final totalLength = path.computeMetrics().fold(0.0, (sum, metric) => sum + metric.length);

    for (final metric in path.computeMetrics()) {
      while (distance < metric.length) {
        final start = metric.getTangentForOffset(distance)?.position;
        final end = metric.getTangentForOffset(distance + dashWidth)?.position;

        if (start != null && end != null) {
          dashPath.moveTo(start.dx, start.dy);
          dashPath.lineTo(end.dx, end.dy);
        }

        distance += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
