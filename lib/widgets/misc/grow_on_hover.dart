import 'package:flutter/material.dart';

// Create a widget that will scale its contents on hover
class GrowOnHover extends StatefulWidget {
  final Widget child;
  final double scale;
  final Duration duration;

  const GrowOnHover({
    Key? key, 
    required this.child, 
    this.scale = 1.05, 
    this.duration = const Duration(milliseconds: 150),
  }): super(key: key);

  @override
  _GrowOnHoverState createState() => _GrowOnHoverState();
}

class _GrowOnHoverState extends State<GrowOnHover> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {

    final transform = _isHovered ? 
      (Matrix4.identity()..scale(widget.scale, widget.scale, 1.0)) : Matrix4.identity();

    return MouseRegion(
      onEnter: (event) => setState(() => _isHovered = true),
      onExit: (event) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        transformAlignment: FractionalOffset.center,
        duration: widget.duration,
        transform: transform,
        child: widget.child,
      ),
    );
  }
}