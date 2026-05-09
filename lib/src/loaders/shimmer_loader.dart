import 'package:flutter/material.dart';

/// A shimmer effect loader for skeleton placeholders.
///
/// Displays a shimmer effect across a placeholder,
/// simulating content loading. Perfect for skeleton loading.
///
/// Example:
/// ```dart
/// ShimmerLoader(
///   height: 20,
///   width: double.infinity,
/// )
/// ```
class ShimmerLoader extends StatefulWidget {
  /// The width of the shimmer placeholder.
  final double width;

  /// The height of the shimmer placeholder.
  final double height;

  /// The base color of the placeholder.
  final Color baseColor;

  /// The highlight color for the shimmer effect.
  final Color highlightColor;

  /// The duration of the shimmer animation.
  final Duration duration;

  /// The border radius of the placeholder.
  final BorderRadius borderRadius;

  /// The width of the shimmer highlight band.
  final double shimmerWidth;

  /// The animation curve for the shimmer motion.
  final Curve animationCurve;

  const ShimmerLoader({
    Key? key,
    this.width = double.infinity,
    this.height = 20,
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.duration = const Duration(milliseconds: 1500),
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    this.shimmerWidth = 0.3,
    this.animationCurve = Curves.linear,
  }) : super(key: key);

  @override
  State<ShimmerLoader> createState() => _ShimmerLoaderState();
}

class _ShimmerLoaderState extends State<ShimmerLoader>
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: [
                (_controller.value - widget.shimmerWidth).clamp(0, 1),
                _controller.value,
                (_controller.value + widget.shimmerWidth).clamp(0, 1),
              ],
            ).createShader(bounds);
          },
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.baseColor,
              borderRadius: widget.borderRadius,
            ),
          ),
        );
      },
    );
  }
}
