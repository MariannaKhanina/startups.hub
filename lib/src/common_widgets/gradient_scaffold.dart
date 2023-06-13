import 'package:flutter/material.dart';
import 'package:startupshub/src/common_widgets/bg_gradient.dart';

class GradientScaffold extends StatelessWidget {
  const GradientScaffold({
    super.key,
    this.title,
    required this.child,
  });

  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BgGradient(
      child: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(),
            textTheme: TextTheme(
              bodyLarge: TextStyle(
                color: Theme.of(context)
                    .copyWith(brightness: Brightness.dark)
                    .colorScheme
                    .onPrimary,
              ),
            )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: title != null
              ? AppBar(
                  title: Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Center(
                      child: Text(title!),
                    ),
                  ),
                )
              : null,
          body: Padding(
            padding: const EdgeInsets.all(50.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
