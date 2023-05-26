import 'package:flutter/material.dart';
import 'package:startupshub/src/people/presentation/people_list_item.dart';
import 'package:startupshub/src/person/domain/person_model.dart';

class PeopleList extends StatelessWidget {
  const PeopleList({
    super.key,
    required this.peopleData,
  });
  final List<Person> peopleData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: peopleData.length,
      itemBuilder: (context, index) {
        final Person person = peopleData[index];
        return PeopleListItem(
          personData: person,
        );
      },
    );
  }
}
