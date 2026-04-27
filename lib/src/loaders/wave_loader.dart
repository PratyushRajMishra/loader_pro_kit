import 'package:flutter/material.dart';

/// A wave motion loader animation.
///
/// Displays elements moving up and down in a wave pattern,
/// creating a smooth, flowing animation effect.
///
/// Example:
/// ```dart
/// WaveLoader(
///   color: Colors.pink,
///   waveCount: 3,
/// )
/// ```
class WaveLoader extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;
  final int waveCount;
  final double waveHeight;
  final Curve animationCurve;
  final double borderRadius;

  const WaveLoader({
    Key? key,
    this.color = Colors.blue,
    this.size = 50,
    this.duration = const Duration(milliseconds: 1200),
    this.waveCount = 3,
    this.waveHeight = 0.5,
    this.animationCurve = Curves.linear,
    this.borderRadius = 0.5,
  }) : super(key: key);

  @override
  State<WaveLoader> createState() => _WaveLoaderState();
}

class _WaveLoaderState extends State<WaveLoader>
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
        return SizedBox(
          width: widget.size * widget.waveCount,
          height: widget.size,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              widget.waveCount,
              (index) => Transform.translate(
                offset: Offset(
                  0,
                  -widget.size /
                      2 *
                      widget.waveHeight *
                      (1 -
                          ((_controller.value * 2 -
                                              index / widget.waveCount * 2)
                                          .abs() %
                                      2 -
                                  1)
                              .abs()),
                ),
                child: Container(
                  width: widget.size * 0.6,
                  height: widget.size,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(
                      widget.size * widget.borderRadius,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
