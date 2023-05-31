import 'package:flutter/material.dart';
import 'package:startupshub/src/entity_model.dart';
import 'package:startupshub/src/person/domain/person_model.dart';
import 'package:startupshub/src/person/presentation/person_screen.dart';
import 'package:startupshub/src/project/domain/project_model.dart';
import 'package:startupshub/src/project/presentation/project_screen.dart';

class EntitiesButtons<T extends Entity> extends StatelessWidget {
  const EntitiesButtons({
    super.key,
    required this.entitiesList,
  });

  final List<T?> entitiesList;

  @override
  Widget build(BuildContext context) {
    if (entitiesList.isEmpty) {
      return const SizedBox.shrink();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: entitiesList
          .map(
            (entity) => Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton.icon(
                icon: _getIcon(entity),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  if (entity is Project) {
                    return ProjectScreen(
                      projectData: entity,
                    );
                  }

                  if (entity is Person) {
                    return PersonScreen(
                      personData: entity,
                    );
                  }

                  return const Text('Экран для сущности не найден.');
                })),
                label: Text(entity!.name),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _getIcon(T? entity) {
    if (entity is Person) {
      return const Icon(Icons.person_2_outlined);
    }

    if (entity is Project) {
      return const Icon(Icons.art_track_outlined);
    }

    return const Icon(Icons.hide_source_outlined);
  }
}
