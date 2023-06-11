import 'package:flutter/material.dart';
import 'package:startupshub/src/common_widgets/gradient_scaffold.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      title: "Вход",
      child: Form(
          child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(label: Text('Логин')),
          ),
          TextFormField(
            decoration: const InputDecoration(label: Text('Пароль')),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Войти')),
        ],
      )),
    );
  }
}
