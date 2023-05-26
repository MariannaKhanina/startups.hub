import 'package:flutter/material.dart';
import 'package:startupshub/src/person/domain/person_model.dart';
import 'package:startupshub/src/person/presentation/skills.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({
    super.key,
    required this.personData,
  });
  final Person personData;

  @override
  Widget build(BuildContext context) {
    final String name = personData.name;
    final List<String> skills = personData.skills;
    final String? description = personData.description;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Center(
            child: Text(name),
          ),
        ),
      ),
      body: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 50,
        ),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              const CircleAvatar(
                minRadius: 30,
                child: Icon(
                  Icons.person_2_outlined,
                  size: 50,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  child: Skills(
                    skillsData: skills,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ),
              if (description != null) Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
