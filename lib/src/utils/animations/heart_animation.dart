import 'package:flutter/cupertino.dart';

class HeartAnimation extends StatefulWidget {
  final Widget child;
  final bool isAnimation;
  final Duration duration;
  final VoidCallback? onEnd;
  const HeartAnimation({
    super.key,
    required this.child,
    required this.isAnimation,
    this.duration = const Duration(microseconds: 150),
    this.onEnd,
  });

  @override
  State<HeartAnimation> createState() => _HeartAnimationState();
}

class _HeartAnimationState extends State<HeartAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;
  @override
  void initState() {
    final halfduration = widget.duration.inMicroseconds ~/ 2;
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(microseconds: halfduration));

    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
  }

  @override
  void didUpdateWidget(covariant HeartAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isAnimation != oldWidget.isAnimation) {
      doAnimation();
    }
  }

  Future doAnimation() async {
    await controller.forward();
    await controller.reverse();

    await Future.delayed(const Duration(milliseconds: 600));

    if (widget.onEnd != null) {
      widget.onEnd!();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: scale, child: widget.child);
  }
}
