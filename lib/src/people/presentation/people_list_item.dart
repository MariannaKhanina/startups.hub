import 'package:flutter/material.dart';
import 'package:startupshub/src/person/domain/person_model.dart';
import 'package:startupshub/src/person/presentation/person_screen.dart';
import 'package:startupshub/src/common_widgets/skills.dart';

class PeopleListItem extends StatelessWidget {
  const PeopleListItem({
    super.key,
    required this.personData,
  });

  final Person personData;

  @override
  Widget build(BuildContext context) {
    final String name = personData.name;
    final List<String> skills = personData.skills;

    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Skills(
          skillsData: skills,
        ),
        leading: const CircleAvatar(
          child: Icon(Icons.person_2_outlined),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PersonScreen(
              personData: personData,
            ),
          ));
        },
      ),
    );
  }
}
