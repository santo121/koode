import 'package:flutter/material.dart';

class CustomFadePageRoute extends PageRouteBuilder {
  final Widget route;

  CustomFadePageRoute({required this.route})
      : super(
          transitionDuration: const Duration(milliseconds: 1000),
          pageBuilder: (context, animation, secondaryAnimation) => route,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
}