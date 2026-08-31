import 'package:flutter/material.dart';

import '../constants/ui_constants.dart';

/// Scaffold shared by both screens: gradient background, safe area, and a
/// scroll view that keeps content centred until the keyboard makes it taller
/// than the viewport.
///
/// The [LayoutBuilder]/[ConstrainedBox]/[IntrinsicHeight] combination is what
/// lets [Center] work inside a scroll view; without the minimum height the
/// column would collapse to its natural size and sit at the top.
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.child,
    this.gradient,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(UiConstants.spaceLg),
    super.key,
  }) : assert(
          gradient != null || backgroundColor != null,
          'AppScaffold needs either a gradient or a backgroundColor',
        );

  final Widget child;

  /// Result screen: the teal sweep from the reference video.
  final Gradient? gradient;

  /// Input screen: a flat page colour.
  final Color? backgroundColor;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
          color: gradient == null ? backgroundColor : null,
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                padding: padding,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - padding.vertical,
                  ),
                  child: IntrinsicHeight(
                    child: Center(child: child),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}