import 'package:flutter/material.dart';
import 'package:startupshub/src/common_widgets/gradient_scaffold.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      title: 'Регистрация',
      child: Center(
        child: Form(
            child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text('Логин')),
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text('Пароль')),
            ),
            TextFormField(
              decoration:
                  const InputDecoration(label: Text('Подтверждение пароля')),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Зарегистроваться'),
            ),
          ],
        )),
      ),
    );
  }
}
