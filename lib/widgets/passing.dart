import 'package:flutter/material.dart';
import 'package:application/reusable_components/custom_text_form_field.dart';

import '../constants/constant/constants.dart';

class Passing extends StatelessWidget {
  const Passing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                primaryColor,
                Color(0xffe5f7f8),
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.personal_injury,
                    color: Colors.white,
                    size: 35,
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    height: 32,
                    width: 280,
                    child: CustomTextField(
                      labelText: 'patient name',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.date_range,
                    color: Colors.white,
                    size: 35,
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    height: 32,
                    width: 280,
                    child: CustomTextField(
                      keyboardType: TextInputType.datetime,
                      labelText: 'Date',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Type of medical tests',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: postColor,
                ),
                width: double.infinity,
                height: 209,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hematology',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
