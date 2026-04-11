import 'package:flutter/material.dart';

/// A smooth rotating arc spinner loader.
///
/// Displays a rotating arc on a circle, creating a classic
/// and professional loading indicator suitable for any app.
///
/// Example:
/// ```dart
/// SpinningLoader(
///   color: Colors.purple,
///   size: 60,
/// )
/// ```
class SpinningLoader extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;
  final double borderWidth;
  final Curve animationCurve;
  final Color? backgroundColor;
  final double arcLength;

  const SpinningLoader({
    Key? key,
    this.color = Colors.blue,
    this.size = 50,
    this.duration = const Duration(seconds: 2),
    this.borderWidth = 3,
    this.animationCurve = Curves.linear,
    this.backgroundColor,
    this.arcLength = 3.14,
  }) : super(key: key);

  @override
  State<SpinningLoader> createState() => _SpinningLoaderState();
}

class _SpinningLoaderState extends State<SpinningLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          RotationTransition(
            turns: _controller,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      widget.backgroundColor ??
                      widget.color.withValues(alpha: 0.2),
                  width: widget.borderWidth,
                ),
              ),
            ),
          ),
          RotationTransition(
            turns: Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: _controller,
                curve: widget.animationCurve,
              ),
            ),
            child: CustomPaint(
              size: Size(widget.size, widget.size),
              painter: _SpinnerPainter(
                widget.color,
                widget.borderWidth,
                widget.arcLength,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SpinnerPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double arcLength;

  _SpinnerPainter(this.color, this.strokeWidth, this.arcLength);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      0,
      arcLength,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_SpinnerPainter oldDelegate) => false;
}
