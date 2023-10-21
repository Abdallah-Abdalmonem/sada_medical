import 'package:flutter/material.dart';

import '../../constants/constant/appcolor.dart';
import '../../constants/constant/constants.dart';
import '../Room.dart';

class PatientTabBody extends StatelessWidget {
  const PatientTabBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.primaryColor,
                Color(0xffe5f7f8),
              ]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Room()),
                  );
                },
                child: Container(
                  width: 123,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.primaryColor,
                  ),
                  child: const Center(
                      child: Text(
                    'Room1',
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  )),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: 123,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColor.primaryColor,
                ),
                child: const Center(
                    child: Text(
                  'Room2',
                  style: TextStyle(
                    fontSize: 28,
                  ),
                )),
              ),
              const SizedBox(height: 16),
              Container(
                width: 123,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColor.primaryColor,
                ),
                child: const Center(
                    child: Text(
                  'Room3',
                  style: TextStyle(
                    fontSize: 28,
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
