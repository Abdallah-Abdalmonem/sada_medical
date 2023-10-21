import 'package:flutter/material.dart';
import 'package:application/widgets/Notification_item.dart';

import '../../constants/constant/appcolor.dart';
import '../../constants/constant/constants.dart';

class NotificationsTabBody extends StatelessWidget {
  const NotificationsTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.primaryColor,
                Color(0xffe5f7f8),
              ]),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const NotificationItem();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
