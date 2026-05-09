import 'package:flutter/material.dart';

/// A horizontal progress bar loader.
///
/// Displays a smooth filling progress bar with optional percentage text.
/// Perfect for download, upload, or progress indication.
///
/// Example:
/// ```dart
/// LinearLoader(
///   loaderColor: Colors.blue,
///   showPercentage: true,
/// )
/// ```
class LinearLoader extends StatefulWidget {
  /// The background color of the progress bar.
  final Color backgroundColor;

  /// The color of the filling progress bar.
  final Color loaderColor;

  /// The height of the progress bar.
  final double height;

  /// The border radius of the progress bar corners.
  final double borderRadius;

  /// The duration of the progress animation.
  final Duration duration;

  /// Whether to display the percentage text.
  final bool showPercentage;

  /// The animation curve for the progress.
  final Curve animationCurve;

  /// Optional gradient colors for the progress bar.
  final List<Color>? gradientColors;

  /// The width of the progress bar.
  final double width;

  /// Optional text style for the percentage display.
  final TextStyle? textStyle;

  const LinearLoader({
    Key? key,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.loaderColor = Colors.blue,
    this.height = 6,
    this.borderRadius = 3,
    this.duration = const Duration(seconds: 2),
    this.showPercentage = false,
    this.animationCurve = Curves.linear,
    this.gradientColors,
    this.width = double.infinity,
    this.textStyle,
  }) : super(key: key);

  @override
  State<LinearLoader> createState() => _LinearLoaderState();
}

class _LinearLoaderState extends State<LinearLoader>
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
    final gradientColors =
        widget.gradientColors ??
        [widget.loaderColor, widget.loaderColor.withValues(alpha: 0.6)];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: widget.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: Container(
              height: widget.height,
              color: widget.backgroundColor,
              child: Stack(
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return FractionallySizedBox(
                        widthFactor: _controller.value,
                        heightFactor: 1.0,
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColors,
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        if (widget.showPercentage)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Text(
                  '${(_controller.value * 100).toStringAsFixed(0)}%',
                  style:
                      widget.textStyle ??
                      const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                );
              },
            ),
          ),
      ],
    );
  }
}
