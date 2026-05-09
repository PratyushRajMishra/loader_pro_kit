import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A highly customizable liquid fill loader.
///
/// Features:
/// - Smooth animated wave motion
/// - Dual wave support
/// - Gradient liquid
/// - Percentage text
/// - Glow effect
/// - Circle & rounded rectangle shapes
/// - Customizable speed, amplitude, colors
/// - Bubble effect
///
/// Example:
/// ```dart
/// LiquidFillLoader(
///   value: 0.7,
///   size: 120,
///   waveColor: Colors.blue,
///   gradient: LinearGradient(
///     colors: [Colors.blue, Colors.cyan],
///   ),
///   showPercentage: true,
///   enableBubbles: true,
/// )
/// ```
class LiquidFillLoader extends StatefulWidget {
  /// The size of the loader widget.
  final double size;

  /// The fill level of the liquid (0.0 to 1.0).
  final double value;

  /// The duration of the wave animation.
  final Duration duration;

  /// The height of the wave oscillation.
  final double waveHeight;

  /// The speed multiplier for the wave motion.
  final double waveSpeed;

  /// The frequency of the wave pattern.
  final double frequency;

  /// The background color of the loader.
  final Color backgroundColor;

  /// The color of the liquid fill.
  final Color waveColor;

  /// Optional gradient for the liquid fill.
  final Gradient? gradient;

  /// The width of the border around the loader.
  final double borderWidth;

  /// The color of the border.
  final Color borderColor;

  /// The shape of the loader (circle or rounded rectangle).
  final LiquidShape shape;

  /// The border radius for rounded rectangle shape.
  final double borderRadius;

  /// Whether to display the fill percentage text.
  final bool showPercentage;

  /// Optional text style for the percentage display.
  final TextStyle? percentageStyle;

  /// Whether to apply a glow effect.
  final bool glowEffect;

  /// Whether to enable animated bubbles in the liquid.
  final bool enableBubbles;

  /// Whether to use dual waves for enhanced animation.
  final bool dualWave;

  const LiquidFillLoader({
    super.key,
    this.size = 120,
    this.value = 0.5,
    this.duration = const Duration(milliseconds: 2000),
    this.waveHeight = 10,
    this.waveSpeed = 1.0,
    this.frequency = 1.5,
    this.backgroundColor = const Color(0xFFEAEAEA),
    this.waveColor = Colors.blue,
    this.gradient,
    this.borderWidth = 4,
    this.borderColor = Colors.blue,
    this.shape = LiquidShape.circle,
    this.borderRadius = 24,
    this.showPercentage = false,
    this.percentageStyle,
    this.glowEffect = false,
    this.enableBubbles = false,
    this.dualWave = true,
  });

  @override
  State<LiquidFillLoader> createState() => _LiquidFillLoaderState();
}

class _LiquidFillLoaderState extends State<LiquidFillLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ShapeBorder _shapeBorder() {
    switch (widget.shape) {
      case LiquidShape.circle:
        return const CircleBorder();

      case LiquidShape.roundedRect:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: _ShapeClipper(
                  shape: widget.shape,
                  borderRadius: widget.borderRadius,
                ),
                child: CustomPaint(
                  size: Size(widget.size, widget.size),
                  painter: _LiquidPainter(
                    value: widget.value,
                    animationValue: _controller.value,
                    waveHeight: widget.waveHeight,
                    waveSpeed: widget.waveSpeed,
                    frequency: widget.frequency,
                    waveColor: widget.waveColor,
                    gradient: widget.gradient,
                    backgroundColor: widget.backgroundColor,
                    enableBubbles: widget.enableBubbles,
                    dualWave: widget.dualWave,
                  ),
                ),
              ),

              /// Border
              Container(
                width: widget.size,
                height: widget.size,
                decoration: ShapeDecoration(
                  shape: _shapeBorder(),
                  shadows: widget.glowEffect
                      ? [
                          BoxShadow(
                            color: widget.waveColor.withValues(alpha: 0.4),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ]
                      : null,
                ),
              ),

              IgnorePointer(
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: ShapeDecoration(
                    shape: widget.shape == LiquidShape.circle
                        ? CircleBorder(
                            side: BorderSide(
                              color: widget.borderColor,
                              width: widget.borderWidth,
                            ),
                          )
                        : RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              widget.borderRadius,
                            ),
                            side: BorderSide(
                              color: widget.borderColor,
                              width: widget.borderWidth,
                            ),
                          ),
                  ),
                ),
              ),

              /// Percentage Text
              if (widget.showPercentage)
                Text(
                  "${(widget.value * 100).toInt()}%",
                  style:
                      widget.percentageStyle ??
                      TextStyle(
                        fontSize: widget.size * 0.18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _LiquidPainter extends CustomPainter {
  final double value;
  final double animationValue;
  final double waveHeight;
  final double waveSpeed;
  final double frequency;

  final Color waveColor;
  final Gradient? gradient;
  final Color backgroundColor;

  final bool enableBubbles;
  final bool dualWave;

  _LiquidPainter({
    required this.value,
    required this.animationValue,
    required this.waveHeight,
    required this.waveSpeed,
    required this.frequency,
    required this.waveColor,
    required this.gradient,
    required this.backgroundColor,
    required this.enableBubbles,
    required this.dualWave,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = backgroundColor;

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      backgroundPaint,
    );

    final liquidPaint = Paint();

    if (gradient != null) {
      liquidPaint.shader = gradient!.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );
    } else {
      liquidPaint.color = waveColor;
    }

    final baseHeight = size.height * (1 - value);

    _drawWave(canvas, size, liquidPaint, baseHeight, animationValue, 1.0);

    if (dualWave) {
      _drawWave(
        canvas,
        size,
        liquidPaint..color = waveColor.withValues(alpha: 0.4),
        baseHeight + 4,
        animationValue + 0.5,
        0.6,
      );
    }

    if (enableBubbles) {
      _drawBubbles(canvas, size);
    }
  }

  void _drawWave(
    Canvas canvas,
    Size size,
    Paint paint,
    double baseHeight,
    double phase,
    double strength,
  ) {
    final path = Path();

    path.moveTo(0, size.height);

    for (double x = 0; x <= size.width; x++) {
      final y =
          waveHeight *
              strength *
              math.sin(
                ((x / size.width) * 2 * math.pi * frequency) +
                    (phase * 2 * math.pi * waveSpeed),
              ) +
          baseHeight;

      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  void _drawBubbles(Canvas canvas, Size size) {
    final bubblePaint = Paint()..color = Colors.white.withValues(alpha: 0.35);

    for (int i = 0; i < 8; i++) {
      final progress = (animationValue + i * 0.1) % 1.0;

      final x = (size.width * (0.15 + (i * 0.1))) % size.width;

      final y = size.height - (progress * size.height);

      final radius = 2 + (i % 3).toDouble();

      canvas.drawCircle(Offset(x, y), radius, bubblePaint);
    }
  }

  @override
  bool shouldRepaint(covariant _LiquidPainter oldDelegate) {
    return true;
  }
}

class _ShapeClipper extends CustomClipper<Path> {
  final LiquidShape shape;
  final double borderRadius;

  _ShapeClipper({required this.shape, required this.borderRadius});

  @override
  Path getClip(Size size) {
    switch (shape) {
      case LiquidShape.circle:
        return Path()..addOval(Rect.fromLTWH(0, 0, size.width, size.height));

      case LiquidShape.roundedRect:
        return Path()..addRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(0, 0, size.width, size.height),
            Radius.circular(borderRadius),
          ),
        );
    }
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

enum LiquidShape { circle, roundedRect }
