import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training/widgets/person_list_tile.dart';
import '../dto/person.dart';
import '../ui/person_details.dart';

class PersonsListView extends StatelessWidget {
  const PersonsListView({
    Key? key,
    required this.personsList,
  }) : super(key: key);

  final List<Person> personsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: ListView.separated(
        padding: EdgeInsets.only(
          top: 12.0.h,
          left: 12.0.w,
          right: 12.0.w,
        ),
        itemCount: personsList.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: PersonListTile(personsList[index]),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PersonDetails(person: personsList[index],)));
            },
          );
        },
        separatorBuilder: (context, _) =>  SizedBox(height: 26.0.h),
      ),
    );
  }
}
