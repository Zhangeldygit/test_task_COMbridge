import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training/constants/app_colors.dart';
import 'package:training/constants/app_styles.dart';

import '../dto/person.dart';

class PersonDetails extends StatelessWidget {
  const PersonDetails({Key? key, required this.person}) : super(key: key);
  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character Details', style: AppStyles.s18w500,),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          CircleAvatar(
            backgroundImage: NetworkImage(person.image!),
            radius: 100.w,
          ),
          SizedBox(height: 20.h),
          Text("${person.name}", style: AppStyles.s20w500,),
          SizedBox(height: 10.h),
          Text("Gender: ${person.gender}", style: AppStyles.s15w500,),
          Text("Status: ${person.status}", style: AppStyles.s15w500,),
          Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: ListView.builder(
                    itemCount: person.episode?.length,
                    itemBuilder: (context, index) {
                      final episode = person.episode?[index].substring(person.episode![index].length - 10);
                      return Card(
                        child: ListTile(
                          title: Text(
                            episode!,
                            style: AppStyles.s20w500,
                          ),
                        ),
                      );
                    }),
              )),
        ],
      ),
    );
  }
}
