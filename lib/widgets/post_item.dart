import 'package:flutter/material.dart';
import 'package:application/constants/constant/constants.dart';

import '../reusable_components/custom_text_form_field.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: postColor,
            ),
            width: double.infinity,
            height: 128,
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(man),
                        radius: 16,
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr.Ahmed Reda",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "5h",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Text(
                  "الحالة المتواجدة بسرير رقم 5 قمت بعمل لها بعض الفحوصات المطلوبة بالكامل\n ولكن ظهر عليها بعض الاعراض الجديدة فكيف يمكنني الصرف \n@Room1 - bed N 5",
                  style: TextStyle(
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          const Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.white,
              ),
              SizedBox(width: 16),
              SizedBox(
                height: 28,
                width: 205,
                child: CustomTextField(
                  labelText: 'Comment',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
