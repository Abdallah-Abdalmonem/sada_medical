import 'package:flutter/material.dart';
import 'package:application/constants/constant/constants.dart';
import 'package:application/reusable_components/custom_text_form_field.dart';
import 'package:application/widgets/post_item.dart';

class HomeTabBody extends StatelessWidget {
  const HomeTabBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                child: Row(
                  children: [
                    SizedBox(
                      width: 28.3,
                      height: 26.7,
                      child: Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 16),
                    SizedBox(
                      height: 32,
                      width: 260,
                      child: CustomTextField(
                        labelText: 'Write a post',
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return const PostItem();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
