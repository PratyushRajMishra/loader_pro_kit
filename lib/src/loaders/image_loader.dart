import 'package:flutter/material.dart';

/// A circular image loader with animated gradient border.
///
/// Displays an image in a circle with a rotating gradient border,
/// creating an elegant loading effect.
/// Perfect for image or avatar loading states.
///
/// Example:
/// ```dart
/// ImageLoader(
///   image: NetworkImage('https://example.com/image.jpg'),
///   loaderColor: Colors.teal,
/// )
/// ```
class ImageLoader extends StatefulWidget {
  /// The image to display in the circular loader.
  final ImageProvider image;

  /// The color of the rotating border gradient.
  final Color loaderColor;

  /// The size of the image loader.
  final double size;

  /// The duration of the rotation animation.
  final Duration duration;

  /// The width of the circular border.
  final double borderWidth;

  /// The animation curve for the rotation.
  final Curve animationCurve;

  /// Optional gradient colors for the border.
  final List<Color>? gradientColors;

  const ImageLoader({
    Key? key,
    required this.image,
    this.loaderColor = Colors.blue,
    this.size = 80,
    this.duration = const Duration(milliseconds: 1200),
    this.borderWidth = 2,
    this.animationCurve = Curves.linear,
    this.gradientColors,
  }) : super(key: key);

  @override
  State<ImageLoader> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader>
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
    final colors =
        widget.gradientColors ??
        [widget.loaderColor, widget.loaderColor.withValues(alpha: 0.2)];

    return SizedBox(
      width: widget.size + 20,
      height: widget.size + 20,
      child: Stack(
        alignment: Alignment.center,
        children: [
          RotationTransition(
            turns: Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: _controller,
                curve: widget.animationCurve,
              ),
            ),
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(colors: colors),
              ),
            ),
          ),
          Container(
            width: widget.size - (widget.borderWidth * 2),
            height: widget.size - (widget.borderWidth * 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: widget.image, fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
