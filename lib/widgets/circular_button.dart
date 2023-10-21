import 'package:flutter/material.dart';

import '../constants/constant/appcolor.dart';
import '../constants/constant/constants.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
