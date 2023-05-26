import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startupshub/src/common_widgets/custom_progress_indicator.dart';
import 'package:startupshub/src/people/data/people_future_provider.dart';
import 'package:startupshub/src/people/presentation/people_list.dart';
import 'package:startupshub/src/person/domain/person_model.dart';

class PeopleScreen extends ConsumerWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Person>> asyncPeopleData =
        ref.watch(peopleFutureProvider);

    final Widget body = asyncPeopleData.when(
      data: (data) => PeopleList(
        peopleData: data,
      ),
      error: ((error, stackTrace) => Text(error.toString())),
      loading: () => const CustomProgressIndicator(),
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
