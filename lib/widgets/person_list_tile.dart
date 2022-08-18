import 'package:flutter/material.dart';
import 'package:training/widgets/user_avatar.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import '../../../dto/person.dart';

class PersonListTile extends StatelessWidget {
  const PersonListTile(this.person, {Key? key}) : super(key: key);
  final Person person;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatar(
          person.image,
          margin: const EdgeInsets.only(right: 20.0),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      person.name ?? "No data",
                      style: AppStyles.s16w500.copyWith(
                        height: 1.6,
                        leadingDistribution: TextLeadingDistribution.even,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(person.gender == "Male" ? Icons.male : Icons.female),
                  Expanded(
                    child: Text(
                      person.gender ?? "No data",
                      style: const TextStyle(
                        color: AppColors.neutral1,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
