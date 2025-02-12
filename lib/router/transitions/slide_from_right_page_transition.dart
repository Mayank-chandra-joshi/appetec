import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RightSlideIn<T> extends CustomTransitionPage<T> {
  RightSlideIn({
    required Widget child,
    LocalKey? key,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Offset beginOffset = const Offset(1.0, 0.0),
  }) : super(
          key: key,
          child: child,
          transitionDuration: transitionDuration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: beginOffset,
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              ),
              child: child,
            );
          },
        );
}
