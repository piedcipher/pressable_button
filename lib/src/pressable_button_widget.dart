import 'package:flutter/material.dart';

class PressableButton extends StatefulWidget {
  const PressableButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width = 200,
    this.height = 80,
    this.color = Colors.green,
    this.shadowColor,
    this.borderRadius = 25,
    this.pressDepth = 32,
    this.animationDuration = const Duration(milliseconds: 100),
  });

  final VoidCallback onPressed;
  final Widget child;

  final double width;
  final double height;
  final Color color;
  final Color? shadowColor;
  final double borderRadius;
  final double pressDepth;
  final Duration animationDuration;

  @override
  State<PressableButton> createState() => _PressableButtonState();
}

class _PressableButtonState extends State<PressableButton> {
  late double _bottomPadding;

  @override
  void initState() {
    super.initState();
    _bottomPadding = widget.pressDepth;
  }

  Future<void> _handleTap() async {
    setState(() {
      _bottomPadding = 0;
    });

    await Future.delayed(widget.animationDuration);

    setState(() {
      _bottomPadding = widget.pressDepth;
    });

    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    final shadow = widget.shadowColor ?? widget.color.withOpacity(0.5);

    return GestureDetector(
      onTap: _handleTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: shadow,
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            child: SizedBox(width: widget.width, height: widget.height),
          ),
          AnimatedPadding(
            duration: widget.animationDuration,
            curve: Curves.easeInOut,
            padding: EdgeInsets.only(bottom: _bottomPadding),
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                boxShadow: [
                  BoxShadow(
                    color: widget.color.withOpacity(0.6),
                    blurRadius: 24,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(child: widget.child),
            ),
          ),
        ],
      ),
    );
  }
}
