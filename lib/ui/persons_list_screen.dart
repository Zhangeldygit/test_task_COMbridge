import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/constants/app_colors.dart';
import 'package:training/constants/app_styles.dart';
import 'package:training/ui/person_details.dart';
import 'package:training/widgets/person_list_tile.dart';
import '../bloc/persons/bloc_persons.dart';
import '../bloc/persons/states.dart';
import '../dto/person.dart';

class PersonsListScreen extends StatelessWidget {
  const PersonsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Rick and Morty',
            style: AppStyles.s18w500,
          ),
          backgroundColor: AppColors.primary,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                    child: BlocBuilder<BlocPersons, StateBlocPersons>(
                      builder: (context, state) {
                        return state.map(
                            initial: (_) => const SizedBox.shrink(),
                            loading: (_) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                            data: (state) => Body(data: state.data),
                            error: (state) => ErrorWidget(state.error));
                      },
                    ),
                  ),
                ],
              ),
            ),
            BlocConsumer<BlocPersons, StateBlocPersons>(
                builder: (context, state) {
              final isLoading = state.maybeMap(
                  data: (state) => state.isLoading, orElse: () => false);
              return Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: isLoading
                      ? const Center(
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : const SizedBox.shrink());
            }, listener: (context, state) {
              state.mapOrNull(data: (state) {
                if (state.errorMessage != null) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: Text(state.errorMessage!),
                        );
                      });
                }
              });
            }),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key, required this.data}) : super(key: key);

  final List<Person> data;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Flexible(
            child: Text('List is empty'),
          ),
        ],
      );
    } else {
      return NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollNotification) {
            if (notification.metrics.extentAfter == 0) {
              BlocProvider.of<BlocPersons>(context).add(EventPersonsNextPage());
            }
          }
          return false;
        },
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
            itemBuilder: (context, index) => InkWell(
                  child: PersonListTile(data[index]),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonDetails(
                                  person: data[index],
                                )));
                  },
                ),
            separatorBuilder: (context, _) => const SizedBox(height: 10),
            itemCount: data.length),
      );
    }
  }
}
