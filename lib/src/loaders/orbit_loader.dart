import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A highly customizable, dynamic orbit loader.
///
/// Features:
/// - Multiple orbit styles (circular / elliptical)
/// - Direction control (clockwise / reverse)
/// - Scaling & opacity animation
/// - Glow effect
/// - Gradient dots
/// - Speed & radius control
///
/// Example:
/// ```dart
/// OrbitLoader(
///   dotCount: 8,
///   glowEffect: true,
///   useGradient: true,
/// )
/// ```
class OrbitLoader extends StatefulWidget {
  final double size;
  final int dotCount;
  final double radius;
  final double dotSize;

  final Duration duration;
  final Curve curve;

  final bool reverse;
  final bool glowEffect;

  final bool animateScale;
  final bool animateOpacity;

  final bool elliptical;
  final double ellipseRatio;

  final bool useGradient;
  final List<Color>? gradientColors;
  final Color color;

  const OrbitLoader({
    super.key,
    this.size = 70,
    this.dotCount = 6,
    this.radius = 25,
    this.dotSize = 8,
    this.duration = const Duration(milliseconds: 1200),
    this.curve = Curves.linear,
    this.reverse = false,
    this.glowEffect = false,
    this.animateScale = true,
    this.animateOpacity = true,
    this.elliptical = false,
    this.ellipseRatio = 0.6,
    this.useGradient = false,
    this.gradientColors,
    this.color = Colors.blue,
  });

  @override
  State<OrbitLoader> createState() => _OrbitLoaderState();
}

class _OrbitLoaderState extends State<OrbitLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();

    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getDotColor(int index) {
    if (widget.useGradient && widget.gradientColors != null) {
      final colors = widget.gradientColors!;
      final t = index / widget.dotCount;
      return Color.lerp(colors.first, colors.last, t)!;
    }
    return widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final rotation =
              (widget.reverse ? -1 : 1) * _animation.value * 2 * math.pi;

          return Stack(
            alignment: Alignment.center,
            children: List.generate(widget.dotCount, (index) {
              final baseAngle = (2 * math.pi / widget.dotCount) * index;

              final angle = baseAngle + rotation;

              final x = widget.radius * math.cos(angle);
              final y = widget.elliptical
                  ? widget.radius * widget.ellipseRatio * math.sin(angle)
                  : widget.radius * math.sin(angle);

              /// ✨ Dynamic scale
              final scale = widget.animateScale
                  ? 0.6 +
                        0.4 *
                            math
                                .sin(_animation.value * 2 * math.pi + index)
                                .abs()
                  : 1.0;

              /// ✨ Dynamic opacity
              final opacity = widget.animateOpacity
                  ? 0.5 +
                        0.5 *
                            math
                                .cos(_animation.value * 2 * math.pi + index)
                                .abs()
                  : 1.0;

              final color = _getDotColor(index).withValues(alpha: opacity);

              return Transform.translate(
                offset: Offset(x, y),
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    width: widget.dotSize,
                    height: widget.dotSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                      boxShadow: widget.glowEffect
                          ? [
                              BoxShadow(
                                color: color.withValues(alpha: 0.6),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ]
                          : null,
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
