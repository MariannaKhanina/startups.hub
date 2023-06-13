import 'package:flutter/material.dart';
import 'package:startupshub/src/common_widgets/gradient_scaffold.dart';
import 'package:startupshub/src/common_widgets/logo.dart';
import 'package:startupshub/src/people/presentation/people_screen.dart';
import 'package:startupshub/src/projects/presentation/projects_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Logo(),
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
    );
  }
}
