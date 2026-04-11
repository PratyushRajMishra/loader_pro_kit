import 'package:flutter/material.dart';

/// A complex content placeholder skeleton loader.
///
/// Displays multiple skeleton items with shimmer effect,
/// perfect for showing placeholder layouts while content loads.
/// Supports both line and circle skeleton items.
///
/// Example:
/// ```dart
/// SkeletonLoader(
///   items: [
///     SkeletonLine(height: 16),
///     SkeletonCircle(radius: 30),
///   ],
/// )
/// ```
class SkeletonLoader extends StatefulWidget {
  final List<SkeletonItem> items;
  final Duration duration;
  final Color baseColor;
  final Color highlightColor;
  final Curve animationCurve;
  final double shimmerWidth;

  const SkeletonLoader({
    Key? key,
    required this.items,
    this.duration = const Duration(milliseconds: 1500),
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.animationCurve = Curves.linear,
    this.shimmerWidth = 0.3,
  }) : super(key: key);

  @override
  State<SkeletonLoader> createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<SkeletonLoader>
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
    return Column(
      children: widget.items
          .map(
            (item) => item.build(
              _controller,
              widget.baseColor,
              widget.highlightColor,
              widget.shimmerWidth,
            ),
          )
          .toList(),
    );
  }
}

/// Base class for skeleton loader items.
///
/// Implement this to create custom skeleton items for the [SkeletonLoader].
abstract class SkeletonItem {
  Widget build(
    AnimationController controller,
    Color baseColor,
    Color highlightColor,
    double shimmerWidth,
  );
}

/// A line-shaped skeleton item.
///
/// Displays a rectangular line with shimmer effect,
/// perfect for text or content placeholders.
class SkeletonLine extends SkeletonItem {
  final double width;
  final double height;
  final EdgeInsets margin;
  final BorderRadius borderRadius;

  SkeletonLine({
    this.width = double.infinity,
    this.height = 16,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
  });

  @override
  Widget build(
    AnimationController controller,
    Color baseColor,
    Color highlightColor,
    double shimmerWidth,
  ) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Padding(
          padding: margin,
          child: ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [baseColor, highlightColor, baseColor],
                stops: [
                  (controller.value - shimmerWidth).clamp(0, 1),
                  controller.value,
                  (controller.value + shimmerWidth).clamp(0, 1),
                ],
              ).createShader(bounds);
            },
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: baseColor,
                borderRadius: borderRadius,
              ),
            ),
          ),
        );
      },
    );
  }
}

/// A circular skeleton item.
///
/// Displays a circular shape with shimmer effect,
/// perfect for avatar or profile picture placeholders.
class SkeletonCircle extends SkeletonItem {
  final double radius;
  final EdgeInsets margin;

  SkeletonCircle({this.radius = 40, this.margin = const EdgeInsets.all(8)});

  @override
  Widget build(
    AnimationController controller,
    Color baseColor,
    Color highlightColor,
    double shimmerWidth,
  ) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Padding(
          padding: margin,
          child: ShaderMask(
            shaderCallback: (bounds) {
              return RadialGradient(
                colors: [highlightColor, baseColor, highlightColor],
                stops: [
                  (controller.value - shimmerWidth).clamp(0, 1),
                  controller.value.clamp(0, 1),
                  (controller.value + shimmerWidth).clamp(0, 1),
                ],
              ).createShader(bounds);
            },
            child: Container(
              width: radius * 2,
              height: radius * 2,
              decoration: BoxDecoration(
                color: baseColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }
}
