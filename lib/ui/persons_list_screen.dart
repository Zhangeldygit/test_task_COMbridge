import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/constants/app_colors.dart';
import 'package:training/constants/app_styles.dart';
import '../bloc/persons/bloc_persons.dart';
import '../widgets/persons_list_view.dart';

class PersonsListScreen extends StatelessWidget {
  const PersonsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rick and Morty', style: AppStyles.s18w500,),
          backgroundColor: AppColors.primary,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<BlocPersons, StateBlocPersons>(
                builder: (context, state) {
                  if (state is StatePersonsLoading) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    );
                  }
                  if (state is StatePersonsError) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(state.error),
                        ),
                      ],
                    );
                  }
                  if (state is StatePersonsData) {
                    if (state.data.isEmpty) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text('Persons List is empty'),
                          ),
                        ],
                      );
                    } else {
                      return PersonsListView(personsList: state.data);
                    }
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}