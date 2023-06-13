import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startupshub/src/auth/presentation/login_screen_controller.dart';
import 'package:startupshub/src/common_widgets/gradient_scaffold.dart';
import 'package:startupshub/src/home/presentation/home_screen.dart';
import 'package:startupshub/src/mixins/scaffold_messages.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen>
    with ScaffoldMessages {
  late LoginScreenController _controller;
  String? _login;
  String? _password;

  @override
  void initState() {
    _controller = ref.read(loginScreenControllerProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final NavigatorState navigator = Navigator.of(context);

    return GradientScaffold(
      title: "Вход",
      child: Form(
          child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(label: Text('Логин')),
            onChanged: (value) => setState(() {
              _login = value;
            }),
          ),
          TextFormField(
            decoration: const InputDecoration(label: Text('Пароль')),
            obscureText: true,
            onChanged: (value) => setState(() {
              _password = value;
            }),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () async {
                String? errorText;

                if (_login == null || _password == null) {
                  errorText = 'Логин и пароль не должны быть пустыми.';
                  _showError(errorText);
                  return;
                }

                await _controller.login(_login!, _password!);

                final result = ref.read(loginScreenControllerProvider);

                if (result.hasError) {
                  errorText = result.error.toString();
                  _showError(errorText);
                  return;
                }

                navigator.push(MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
              },
              child: const Text('Войти')),
        ],
      )),
    );
  }

  _showError(String errorText) {
    showError(context, errorText);
  }
}
