import 'package:flutter/material.dart';

class DotLoader extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;
  final int dotCount;
  final double spacing;
  final Curve animationCurve;
  final double minScale;
  final double maxScale;

  const DotLoader({
    Key? key,
    this.color = Colors.blue,
    this.size = 15,
    this.duration = const Duration(milliseconds: 1400),
    this.dotCount = 4,
    this.spacing = 5,
    this.animationCurve = Curves.easeInOut,
    this.minScale = 0.4,
    this.maxScale = 1.0,
  }) : super(key: key);

  @override
  State<DotLoader> createState() => _DotLoaderState();
}

class _DotLoaderState extends State<DotLoader>
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
      height: widget.size * 2,
      width: widget.size * widget.dotCount + widget.spacing * (widget.dotCount - 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          widget.dotCount,
          (index) => ScaleTransition(
            scale: Tween<double>(begin: widget.minScale, end: widget.maxScale).animate(
              CurvedAnimation(
                parent: _controller,
                curve: Interval(
                  index / widget.dotCount,
                  (index + 1) / widget.dotCount,
                  curve: widget.animationCurve,
                ),
              ),
            ),
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
