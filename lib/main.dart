import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startupshub/src/common_widgets/bg_gradient.dart';
import 'package:startupshub/src/people/presentation/people_screen.dart';
import 'package:startupshub/src/projects/presentation/projects_screen.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BgGradient(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(
                  top: 100,
                  bottom: 70,
                ),
                child: Icon(
                  Icons.logo_dev_outlined,
                  size: 100,
                  color: Colors.white,
                ),
              ),
              Text(
                'Название приложения',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.purple[900]),
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.white)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PeopleScreen(),
                      ));
                    },
                    child: const Text('Участники'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.purple[900]),
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.white)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProjectsScreen(),
                      ));
                    },
                    child: const Text('Проекты'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
