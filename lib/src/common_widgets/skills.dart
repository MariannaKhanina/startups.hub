import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills({
    super.key,
    required this.skillsData,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
  final List<String> skillsData;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment!,
      children: skillsData
          .map((skill) => Text(
                '#$skill ',
                style: Theme.of(context).textTheme.labelLarge,
              ))
          .toList(),
    );
  }
}
