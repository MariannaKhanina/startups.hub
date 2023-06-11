import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 100,
        bottom: 70,
      ),
      child: Icon(
        Icons.logo_dev_outlined,
        size: 100,
        color: Colors.white,
      ),
    );
  }
}
