import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startupshub/src/auth/presentation/login_screen.dart';
import 'package:startupshub/src/auth/presentation/signup_screen_controller.dart';
import 'package:startupshub/src/common_widgets/gradient_scaffold.dart';
import 'package:startupshub/src/mixins/scaffold_messages.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends ConsumerState<SignupScreen>
    with ScaffoldMessages {
  late SignupScreenController _controller;
  String? _login;
  String? _password;
  String? _passwordConfirmation;

  @override
  void initState() {
    _controller = ref.read(signupScreenControllerProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      title: 'Регистрация',
      child: Center(
        child: Form(
            child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Логин (email)'),
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {
                  _login = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text('Пароль')),
              keyboardType: TextInputType.text,
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            TextFormField(
              decoration:
                  const InputDecoration(label: Text('Подтверждение пароля')),
              keyboardType: TextInputType.text,
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  _passwordConfirmation = value;
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                String? errorText;
                if (_login == null || _password == null) {
                  errorText = "Логин и пароль не должны быть пустыми.";
                  _showError(errorText);

                  return;
                }

                if (_password != _passwordConfirmation) {
                  errorText = "Введенные пароли не совпадают.";
                  _showError(errorText);
                  return;
                }

                await _controller.save(_login!, _password!);

                final result = ref.read(signupScreenControllerProvider);

                if (result.hasError) {
                  errorText = result.error.toString();
                  _showError(errorText);
                  return;
                }

                _showMessage('Пользователь зарегестирован');

                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
                });
              },
              child: const Text('Зарегистроваться'),
            ),
          ],
        )),
      ),
    );
  }

  _showError(String errorText) {
    showError(context, errorText);
  }

  _showMessage(String message) {
    showSuccessMessage(context, message);
  }
}
