import 'package:flutter/material.dart';

class CircleLoader extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;
  final double borderWidth;
  final Curve animationCurve;
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
              color: widget.backgroundColor ?? widget.color.withOpacity(0.2),
              width: widget.borderWidth,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border(
                top: BorderSide(
                  color: widget.color,
                  width: widget.borderWidth,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
