import 'package:flutter/material.dart';

class PeopleListItem extends StatelessWidget {
  const PeopleListItem({
    super.key,
    required this.title,
    required this.skills,
  });
  final String title;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Row(
          children: skills.map((skill) => Text('#$skill ')).toList(),
        ),
        leading: const CircleAvatar(
          child: Icon(Icons.person_2_outlined),
        ),
        onTap: () {
          throw UnimplementedError();
        },
      ),
    );
  }
}
