import 'dart:math' as math;
import 'package:flutter/material.dart';

class BounceLoader extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;
  final int dotCount;
  final Curve animationCurve;
  final double bounceHeight;
  final bool opacityAnimation;

  const BounceLoader({
    Key? key,
    this.color = Colors.blue,
    this.size = 15,
    this.duration = const Duration(milliseconds: 1400),
    this.dotCount = 3,
    this.animationCurve = Curves.easeInOut,
    this.bounceHeight = 1.5,
    this.opacityAnimation = true,
  }) : super(key: key);

  @override
  State<BounceLoader> createState() => _BounceLoaderState();
}

class _BounceLoaderState extends State<BounceLoader>
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
      height: widget.size * (2 + widget.bounceHeight),
      width: widget.size * (widget.dotCount + 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          widget.dotCount,
          (index) => Transform.translate(
            offset: Offset(
              0,
              -widget.size *
                  widget.bounceHeight *
                  math.sin((_controller.value * 2 * math.pi) + (index * 0.5)),
            ),
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.opacityAnimation
                    ? widget.color.withOpacity(0.6 + 0.4 * index / widget.dotCount)
                    : widget.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
