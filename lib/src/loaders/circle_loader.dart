import 'package:flutter/material.dart';

/// A classic rotating circle spinner loader animation.
///
/// Displays a smooth rotating circle with a customizable border.
/// Perfect for simple, elegant loading states.
///
/// Example:
/// ```dart
/// CircleLoader(
///   color: Colors.blue,
///   size: 60,
/// )
/// ```
class CircleLoader extends StatefulWidget {
  /// The color of the rotating circle border.
  final Color color;

  /// The size of the loader widget.
  final double size;

  /// The duration of the rotation animation.
  final Duration duration;

  /// The width of the circle border.
  final double borderWidth;

  /// The animation curve for the rotation.
  final Curve animationCurve;

  /// Optional background color for the circle.
  final Color? backgroundColor;

  const CircleLoader({
    Key? key,
    this.color = Colors.blue,
    this.size = 50,
    this.duration = const Duration(seconds: 2),
    this.borderWidth = 4,
    this.animationCurve = Curves.linear,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<CircleLoader> createState() => _CircleLoaderState();
}

class _CircleLoaderState extends State<CircleLoader>
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
      child: RotationTransition(
        turns: _controller,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color:
                  widget.backgroundColor ?? widget.color.withValues(alpha: 0.2),
              width: widget.borderWidth,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border(
                top: BorderSide(color: widget.color, width: widget.borderWidth),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
