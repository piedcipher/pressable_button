import 'package:flutter/material.dart';

/// A customizable 3D animated pressable button widget for Flutter.
///
/// [PressableButton] provides a smooth press animation with depth and glow effects.
/// It creates a 3D-like pressing effect by animating the padding of the button,
/// simulating a physical button being pressed down.
///
/// ## Features
/// - Smooth press animation with customizable duration
/// - 3D depth effect with shadow
/// - Customizable width and height
/// - Configurable press depth
/// - Rounded corners
/// - Glow and shadow effects
/// - Lightweight and dependency-free
/// - Supports any child widget
///
/// ## Example
///
/// ```dart
/// PressableButton(
///   onPressed: () {
///     debugPrint('Button pressed!');
///   },
///   child: const Text('Click Me'),
/// )
/// ```
///
/// ## Customization
///
/// All parameters can be customized to match your design:
///
/// ```dart
/// PressableButton(
///   onPressed: () {},
///   child: const Text('Custom Button'),
///   width: 220,
///   height: 60,
///   color: Colors.blue,
///   shadowColor: Colors.blue.shade900,
///   borderRadius: 16,
///   pressDepth: 24,
///   animationDuration: const Duration(milliseconds: 150),
/// )
/// ```
class PressableButton extends StatefulWidget {
  /// Creates a pressable button.
  ///
  /// The [onPressed] and [child] arguments are required.
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

  /// Callback function triggered when the button is pressed.
  ///
  /// This function is called after the button animation completes.
  final VoidCallback onPressed;

  /// The widget displayed inside the button.
  ///
  /// Typically a [Text] widget, but can be any widget.
  final Widget child;

  /// The width of the button.
  ///
  /// Defaults to 200.0.
  final double width;

  /// The height of the button.
  ///
  /// Defaults to 80.0.
  final double height;

  /// The main color of the button.
  ///
  /// Defaults to [Colors.green].
  final Color color;

  /// The shadow color beneath the button.
  ///
  /// If null, a semi-transparent version of [color] will be used.
  final Color? shadowColor;

  /// The border radius of the button corners.
  ///
  /// Defaults to 25.0.
  final double borderRadius;

  /// The depth of the press animation.
  ///
  /// Higher values create a more pronounced pressing effect.
  /// Defaults to 32.0.
  final double pressDepth;

  /// The duration of the press animation.
  ///
  /// Defaults to 100 milliseconds.
  final Duration animationDuration;

  @override
  State<PressableButton> createState() => _PressableButtonState();
}

/// State for [PressableButton].
///
/// Manages the animation state and handles tap interactions.
class _PressableButtonState extends State<PressableButton> {
  /// The bottom padding used for the press animation.
  ///
  /// This value animates between 0 (fully pressed) and [widget.pressDepth]
  /// to create the 3D pressing effect.
  late double _bottomPadding;

  @override
  void initState() {
    super.initState();
    _bottomPadding = widget.pressDepth;
  }

  /// Handles the tap event on the button.
  ///
  /// Animates the button press (reducing [_bottomPadding] to 0) and then
  /// restores it to the original value. Calls [widget.onPressed] after
  /// the animation completes.
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
    /// Determine the shadow color.
    ///
    /// Uses [widget.shadowColor] if provided, otherwise creates a
    /// semi-transparent version of the button color.
    final shadow = widget.shadowColor ?? widget.color.withValues(alpha: 0.6);

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
                  BoxShadow(color: shadow, blurRadius: 24, spreadRadius: 2),
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
