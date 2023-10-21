// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:application/widgets/patient_info.dart';

import '../constants/constant/appcolor.dart';
import '../constants/constant/constants.dart';

class Room extends StatelessWidget {
  const Room({super.key});

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PatientInfo(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 128,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColor.primaryColor,
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Mohamed',
                                    style: TextStyle(
                                      fontSize: 28,
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  Text(
                                    '15/7/2023',
                                    style: TextStyle(
                                      fontSize: 28,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 30),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '50 years',
                                    style: TextStyle(
                                      fontSize: 28,
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  Text(
                                    '15 Days',
                                    style: TextStyle(
                                      fontSize: 28,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
