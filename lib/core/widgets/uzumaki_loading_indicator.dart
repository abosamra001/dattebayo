import 'package:flutter/material.dart';

class UzumakiLoadingIndicator extends StatefulWidget {
  final Duration? duration;
  const UzumakiLoadingIndicator({super.key, this.duration});

  @override
  State<UzumakiLoadingIndicator> createState() =>
      _UzumakiLoadingIndicatorState();
}

class _UzumakiLoadingIndicatorState extends State<UzumakiLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 500),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animationController,
      child: Image.asset(
        'assets/images/png/uzumaki_logo.png',
        width: 58,
        height: 58,
      ),
    );
  }
}
