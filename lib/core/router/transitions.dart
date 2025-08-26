import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FadeTransitionPage extends CustomTransitionPage<void> {
  FadeTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return FadeTransition(
             opacity: animation.drive(CurveTween(curve: Curves.easeInOut)),
             child: child,
           );
         },
       );
}

class SlideTransitionPage extends CustomTransitionPage<void> {
  SlideTransitionPage({
    required LocalKey super.key,
    required super.child,
  }) : super(
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return SlideTransition(
             position: animation.drive(
               Tween<Offset>(
                 begin: const Offset(0, 1),
                 end: Offset.zero,
               ).chain(CurveTween(curve: Curves.easeInOutCubic)),
             ),
             child: child,
           );
         },
       );
}
