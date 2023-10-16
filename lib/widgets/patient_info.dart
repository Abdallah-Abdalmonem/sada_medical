import 'package:flutter/material.dart';

import '../constants/constant/constants.dart';
import 'circular_button.dart';

class PatientInfo extends StatelessWidget {
  const PatientInfo({super.key});

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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 227,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: primaryColor,
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage(hospitalization),
                            height: 40,
                            width: 40,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 32, horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name: Mohamed Mahmoud\nAge: 50 Years\ndata of entry: 15/7/2023\nDiagnosis of the disease: suffers from Generalized Anxiety Disorder and experiences constant and severe worry about daily matters and the future.",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: primaryColor,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: const EdgeInsets.all(30),
                              width: 280,
                              child: const Text(
                                  "Disease name: Advanced Mobile Paralysis Syndrome (AMPS) \n Definition of the disease: AMPS is a rare disease that affects the mobile nervous system, leading to the loss of the ability to move and move around normally. \n Symptoms of the disease: The main symptoms include loss of voluntary movement in the extremities, muscle weakness, tingling and numbness in the extremities, and difficulty breathing and swallowing. \n Causes of the disease: The causes of AMPS are still not completely known, but are thought to be related to genetic and environmental factors \n Diagnosis: AMPS is diagnosed by evaluating the patient's symptoms and medical history, performing neurological tests and medical imaging such as MRI and X-ray imaging. \n Treatment of the disease: There is no specific treatment for AMPS yet. The focus is on relieving symptoms and improving patients' quality of life through physical therapy, motor rehabilitation, and medications to relieve pain and improve mobility \n Impact on daily life: Patients with AMPS experience significant daily challenges, needing help moving and doing basic daily activities. They may also need home and vehicle modifications to meet their special needs \n Research and Developments: Research into AMPS continues to understand its causes and develop new treatments. Scientists and doctors are working to improve diagnosis, treatment and improve the quality of life for patients with this rare disease."),
                            );
                          },
                        );
                      },
                      child: const CircularButton(text: 'History')),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: primaryColor,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        context: context,
                        builder: (context) {
                          return Image.asset(
                            'assets/images/sheet 1.png',
                          );
                        },
                      );
                    },
                    child: const CircularButton(text: 'Labs'),
                  ),
                  const SizedBox(width: 8),
                  const CircularButton(text: 'Examination'),
                  const SizedBox(width: 8),
                  const CircularButton(text: 'Risk factors'),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularButton(text: 'following'),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: primaryColor,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        context: context,
                        builder: (context) {
                          return Image.asset(
                            'assets/images/brin 1.png',
                          );
                        },
                      );
                    },
                    child: const CircularButton(text: 'Echo'),
                  ),
                  const SizedBox(width: 8),
                  const CircularButton(text: 'Add'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
