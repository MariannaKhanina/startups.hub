import 'package:flutter/material.dart';

class BgGradient extends StatelessWidget {
  const BgGradient({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.purple[900]!, Colors.black],
        ),
      ),
      child: child,
    );
  }
}
