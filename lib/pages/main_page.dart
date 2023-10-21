import 'package:flutter/material.dart';
import 'package:application/constants/constant/constants.dart';
import 'package:application/widgets/bodies/home_tab_body.dart';
import 'package:application/widgets/bodies/patient_tab_body.dart';
import 'package:application/widgets/passing.dart';

import '../constants/constant/appcolor.dart';
import '../widgets/bodies/notifications_tab_body.dart';
import '../widgets/bodies/tasks_tab_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
          leadingWidth: 150,
          leading: Row(
            children: [
              // Expanded(
              //   child: IconButton(
              //     icon: const Icon(Icons.menu),
              //     onPressed: () {

              //     },
              //   ),
              // ),
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    showMenu(
                      color: AppColor.primaryColor.withOpacity(.85),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      context: context,
                      position: const RelativeRect.fromLTRB(0, 80, 100, 100),
                      items: [
                        const PopupMenuItem<String>(
                          child: Text('Settings'),
                        ),
                        PopupMenuItem<String>(
                          child: const Text('Passing'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Passing(),
                                ));
                          },
                        ),
                        const PopupMenuItem<String>(
                          child: Text('Profile'),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Handle notifications button tap
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // Handle account button tap
                  },
                ),
              ),
            ],
          ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.personal_injury)),
              Tab(icon: Icon(Icons.notifications)),
              Tab(icon: Icon(Icons.list_alt_outlined)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
        ),
        body: GestureDetector(
          child: const TabBarView(
            children: [
              HomeTabBody(),
              PatientTabBody(),
              NotificationsTabBody(),
              TasksTabBody(),
              Center(child: Text('Content for Tab 5')),
            ],
          ),
        ),
      ),
    );
  }
}
