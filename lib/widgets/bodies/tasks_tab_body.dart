import 'dart:io';

import 'package:application/widgets/passing.dart';
import 'package:flutter/material.dart';

import '../../constants/constant/appcolor.dart';
import '../../constants/constant/image_constant.dart';
import 'twenty_screen/twenty_screen.dart';

class TasksTabBody extends StatefulWidget {
  const TasksTabBody({super.key});

  @override
  State<TasksTabBody> createState() => _TasksTabBodyState();
}

class _TasksTabBodyState extends State<TasksTabBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.primaryColor,
              Color(0xffe5f7f8),
            ],
          ),
        ),
        child: patientDataList.length <= 0
            ? Center(child: Text('No Data'))
            : ListView.builder(
                itemCount: patientDataList.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TwentyScreen(
                          chemistryModelList: patientDataList[index]
                              .chemistryModelList!
                              .toList(),
                          coagulationModelList: patientDataList[index]
                              .coagulationModelList!
                              .toList(),
                          hematologyModelList: patientDataList[index]
                              .hematologyModelList!
                              .toList(),
                          fileImage: patientDataList[index].fileImage,
                          name: patientDataList[index].name.toString(),
                          date: patientDataList[index].date.toString(),
                          typeOfEcho:
                              patientDataList[index].typeOfEcho.toString(),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.imgPerson,
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    'Name: ${patientDataList[index].name}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.imgDate,
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Date: ${patientDataList[index].date?.substring(0, 10)}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
