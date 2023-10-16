// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:application/constants/constant/constants.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(girl),
                    radius: 40,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 206,
                      child: Text(
                        "Dr. Ahmed Reda posted a post with a crown for a patient in a room1 - bed N 5.",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "3 hours",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
