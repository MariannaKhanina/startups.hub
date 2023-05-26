import 'package:flutter/material.dart';
import 'package:startupshub/src/people/presentation/people_list.dart';
import 'package:startupshub/src/people/data/people_repository.dart';
import 'package:startupshub/src/person/domain/person_model.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  late Future<List<Person>> _futurePeople;

  @override
  void initState() {
    final PeopleRepository repository = PeopleRepository();

    _futurePeople = repository.getPeople();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget body = FutureBuilder<List<Person>>(
      future: _futurePeople,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PeopleList(
            peopleData: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Участники'),
      ),
      body: Column(
        children: [
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
