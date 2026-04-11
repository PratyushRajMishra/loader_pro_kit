import 'package:flutter/material.dart';

class PulseLoader extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;
  final int pulseCount;
  final Curve animationCurve;
  final double maxRadius;
  final double minOpacity;

  const PulseLoader({
    Key? key,
    this.color = Colors.blue,
    this.size = 50,
    this.duration = const Duration(milliseconds: 1200),
    this.pulseCount = 3,
    this.animationCurve = Curves.easeOut,
    this.maxRadius = 1.0,
    this.minOpacity = 0.0,
  }) : super(key: key);

  @override
  State<PulseLoader> createState() => _PulseLoaderState();
}

class _PulseLoaderState extends State<PulseLoader>
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
      width: widget.size * widget.maxRadius * 2,
      height: widget.size * widget.maxRadius * 2,
      child: Stack(
        alignment: Alignment.center,
        children: List.generate(
          widget.pulseCount,
          (index) => ScaleTransition(
            scale: Tween<double>(begin: 0.0, end: widget.maxRadius).animate(
              CurvedAnimation(
                parent: _controller,
                curve: Interval(
                  index * (1.0 / widget.pulseCount),
                  1.0,
                  curve: widget.animationCurve,
                ),
              ),
            ),
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.color.withOpacity(
                    widget.minOpacity + (0.3 * (1 - index / widget.pulseCount)),
                  ),
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
