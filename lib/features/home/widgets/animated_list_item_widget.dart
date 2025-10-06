import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedListItemWidget extends StatefulWidget {
  const AnimatedListItemWidget({
    required this.child,
    required this.index,
    super.key,
  });

  final Widget child;
  final int index;

  @override
  State<AnimatedListItemWidget> createState() => _AnimatedListItemWidgetState();
}

class _AnimatedListItemWidgetState extends State<AnimatedListItemWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _slideAnimation;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    final delay = widget.index * 100;
    Future.delayed(Duration(milliseconds: delay), () {
      if (mounted) {
        unawaited(_controller.forward());
      }
    });

    _slideAnimation = Tween<double>(begin: 30, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
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
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.translate(
            offset: Offset(0, _slideAnimation.value),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
