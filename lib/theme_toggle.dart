library theme_toggle;

import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

/// The [ThemeToggle] widget is a custom and fancy toggle switch
/// for Themes. You can use custom emoji for on(Dark) and off(light).
class ThemeToggle extends StatefulWidget {
  /// onChanged function is required to change the theme
  /// and it is a boolean function.
  /// Eg:
  /// ```dart
  /// onChanged: (bool change) {
  ///   setState(() {
  ///     change = !change;
  ///     change ? theme = 'Dark' : theme = 'Light';
  ///   });
  /// },
  /// ```
  @required
  final Function(bool) onChanged;

  /// Enable rotation animation of the widget.
  final bool rotation;

  /// Customize the icon-on size.
  final double iconOnSize;

  /// Customize the icon-off size.
  final double iconOffSize;

  /// Customize the icon-on emoji
  final String iconOn;

  /// Customize the icon-off emoji
  final String iconOff;

  /// OnTap function is optional Function.
  final Function onTap;

  /// OnDoubleTap function is optional Function.
  final Function onDoubleTap;

  ThemeToggle({
    /// Initially rotation value is [true].
    this.rotation = true,

    /// Initially iconOn value is [🌞].
    this.iconOn = '🌞',

    /// Initially iconOff value is [🌝].
    this.iconOff = '🌝',

    /// Customize the onTap function.
    this.onTap,

    /// Customize the onDoubleTap function.
    this.onDoubleTap,

    /// Write onChanged function as per your requirement.
    this.onChanged,

    /// Customize the icon-on size, Initially the value is [24].
    this.iconOnSize,

    /// Customize the icon-off size, Initially the value is [24].
    this.iconOffSize,
  });

  @override
  _ThemeToggleState createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  double value = 0.0;

  bool themeState;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: Duration(milliseconds: 300));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animationController.addListener(() {
      setState(() {
        value = animation.value;
      });
    });
    themeState = true;
    (themeState)
        ? animationController.forward()
        : animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        _onAction();
        if (widget.onDoubleTap != null) widget.onDoubleTap();
      },
      onTap: () {
        _onAction();
        if (widget.onTap != null) widget.onTap();
      },
      child: Transform.translate(
        offset: Offset(0 * value, 0),
        child: Transform.rotate(
          angle: lerpDouble(0, widget.rotation ? 2 * pi : 0, value),
          child: Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: <Widget>[
                Center(
                  child: Opacity(
                    opacity: (1 - value).clamp(0.0, 1.0),
                    child: Text(
                      widget.iconOff,
                      style: TextStyle(
                        fontSize: widget.iconOffSize ?? 24,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Opacity(
                    opacity: value.clamp(0.0, 1.0),
                    child: Text(
                      widget.iconOn,
                      style: TextStyle(
                        fontSize: widget.iconOnSize ?? 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// _action funtion will be called on OnTap and onDoubleTap.
  /// _determine function will be called with arguments of state change as true.
  void _onAction() {
    _stateDetermine(changeState: true);
  }

  void _stateDetermine({bool changeState = false}) {
    setState(() {
      if (changeState) themeState = !themeState;
      (themeState)
          ? animationController.forward()
          : animationController.reverse();
    });
    widget.onChanged(themeState);
  }
}
