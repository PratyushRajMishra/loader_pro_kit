import 'package:flutter/material.dart';

/// A branded logo loader with animated spinner ring.
///
/// Displays your custom logo or widget in the center
/// with an animated rotating ring around it.
/// Perfect for branded loading states.
///
/// Example:
/// ```dart
/// LogoLoader(
///   logo: Icon(Icons.flutter_dash, size: 40),
///   backgroundColor: Colors.blue,
/// )
/// ```
class LogoLoader extends StatefulWidget {
  /// The widget to display as the logo (typically an Icon or Image).
  final Widget logo;

  /// The background color of the loader.
  final Color backgroundColor;

  /// The size of the loader widget.
  final double size;

  /// The duration of the rotation animation.
  final Duration duration;

  /// The thickness of the rotating arc.
  final double arcThickness;

  /// The animation curve for the rotation.
  final Curve animationCurve;

  /// Optional color for the rotating ring.
  final Color? ringColor;

  /// The padding around the logo.
  final double logoPadding;

  const LogoLoader({
    Key? key,
    required this.logo,
    this.backgroundColor = Colors.blue,
    this.size = 80,
    this.duration = const Duration(seconds: 2),
    this.arcThickness = 3,
    this.animationCurve = Curves.linear,
    this.ringColor,
    this.logoPadding = 12,
  }) : super(key: key);

  @override
  State<LogoLoader> createState() => _LogoLoaderState();
}

class _LogoLoaderState extends State<LogoLoader>
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
                      widget.ringColor ??
                      widget.backgroundColor.withValues(alpha: 0.3),
                  width: widget.arcThickness,
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
              painter: _LogoLoaderPainter(
                widget.backgroundColor,
                widget.arcThickness,
              ),
            ),
          ),
          Container(
            width: widget.size - (widget.logoPadding * 2),
            height: widget.size - (widget.logoPadding * 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Center(child: widget.logo),
          ),
        ],
      ),
    );
  }
}

class _LogoLoaderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  _LogoLoaderPainter(this.color, this.strokeWidth);

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
      2.5,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_LogoLoaderPainter oldDelegate) => false;
}
