// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';

import '../../../constants/constant/appcolor.dart';
import '../../../constants/constant/image_constant.dart';
import '../../../models/row_model.dart';
import '../../../reusable_components/cache_helper.dart';
import '../../custom_widgets/custom_table_continer.dart';
import '../../custom_widgets/custom_table_row.dart';

class TwentyScreen extends StatefulWidget {
  // File? fileImage;
  String? fileImage;
  String name;
  String date;
  String? typeOfEcho;
  List<CustomModel> coagulationModelList;
  List<CustomModel> chemistryModelList;
  List<CustomModel> hematologyModelList;

  TwentyScreen({
    Key? key,
    this.fileImage,
    required this.name,
    required this.date,
    required this.typeOfEcho,
    required this.chemistryModelList,
    required this.coagulationModelList,
    required this.hematologyModelList,
  }) : super(key: key);

  @override
  State<TwentyScreen> createState() => _TwentyScreenState();
}

class _TwentyScreenState extends State<TwentyScreen> {
  @override
  void initState() {
    CacheHelper.getList();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: mediaQuery.width,
          height: mediaQuery.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.49, 0),
              end: Alignment(0.49, 1),
              colors: [
                Color(0xff79C1C5),
                Color(0xffCEDFE6),
              ],
            ),
          ),
          child: Form(
            // key: _formKey,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Column(
                  children: [
                    const Divider(),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppImages.imgPerson,
                                height: 30, width: 30),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                widget.name,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.imgDate,
                              height: 25,
                              width: 30,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                widget.date.substring(0, 10),
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            'Type of medical tests',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    CustomTableContiner(
                        categoryName: 'Hematology',
                        table: Column(
                          children: [
                            CustomTableRowForTwentyScreen(
                              title: widget.hematologyModelList[0].text,
                              isEnable:
                                  widget.hematologyModelList[0].isSelected,
                              priority: widget.hematologyModelList[0].prority
                                  .toString(),
                              context: context,
                            ),
                            CustomTableRowForTwentyScreen(
                              title: widget.hematologyModelList[1].text,
                              isEnable:
                                  widget.hematologyModelList[1].isSelected,
                              priority: widget.hematologyModelList[1].prority
                                  .toString(),
                              context: context,
                            ),
                            CustomTableRowForTwentyScreen(
                              title: widget.hematologyModelList[2].text,
                              isEnable:
                                  widget.hematologyModelList[2].isSelected,
                              priority: widget.hematologyModelList[2].prority
                                  .toString(),
                              context: context,
                            ),
                            CustomTableRowForTwentyScreen(
                              title: widget.hematologyModelList[3].text,
                              isEnable:
                                  widget.hematologyModelList[3].isSelected,
                              priority: widget.hematologyModelList[3].prority
                                  .toString(),
                              context: context,
                            ),
                            CustomTableRowForTwentyScreen(
                              title: widget.hematologyModelList[4].text,
                              isEnable:
                                  widget.hematologyModelList[4].isSelected,
                              priority: widget.hematologyModelList[4].prority
                                  .toString(),
                              context: context,
                            ),
                            CustomTableRowForTwentyScreen(
                              title: widget.hematologyModelList[5].text,
                              isEnable:
                                  widget.hematologyModelList[5].isSelected,
                              priority: widget.hematologyModelList[5].prority
                                  .toString(),
                              context: context,
                            ),
                          ],
                        )),
                    const SizedBox(height: 20),
                    CustomTableContiner(
                      categoryName: 'Coagulation',
                      table: Column(
                        children: [
                          CustomTableRowForTwentyScreen(
                              title: widget.coagulationModelList[0].text,
                              isEnable:
                                  widget.coagulationModelList[0].isSelected,
                              priority: widget.coagulationModelList[0].prority
                                  .toString(),
                              context: context),
                          CustomTableRowForTwentyScreen(
                              title: widget.coagulationModelList[1].text,
                              isEnable:
                                  widget.coagulationModelList[1].isSelected,
                              priority: widget.coagulationModelList[1].prority
                                  .toString(),
                              context: context),
                          CustomTableRowForTwentyScreen(
                              title: widget.coagulationModelList[2].text,
                              isEnable:
                                  widget.coagulationModelList[2].isSelected,
                              priority: widget.coagulationModelList[2].prority
                                  .toString(),
                              context: context),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTableContiner(
                      categoryName: 'Chemistry',
                      table: Column(
                        children: [
                          CustomTableRowForTwentyScreen(
                              title: widget.chemistryModelList[0].text,
                              isEnable: widget.chemistryModelList[0].isSelected,
                              priority: widget.chemistryModelList[0].prority
                                  .toString(),
                              context: context),
                          CustomTableRowForTwentyScreen(
                              title: widget.chemistryModelList[1].text,
                              isEnable: widget.chemistryModelList[1].isSelected,
                              priority: widget.chemistryModelList[1].prority
                                  .toString(),
                              context: context),
                          CustomTableRowForTwentyScreen(
                              title: widget.chemistryModelList[2].text,
                              isEnable: widget.chemistryModelList[2].isSelected,
                              priority: widget.chemistryModelList[2].prority
                                  .toString(),
                              context: context),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (widget.typeOfEcho != null)
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Type of Echo',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Text(
                              '${widget.typeOfEcho}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    if (widget.fileImage != null)
                      Container(
                        decoration: BoxDecoration(
                            color: AppColor.continerColor,
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Image.file(
                              File(widget.fileImage!),
                              fit: BoxFit.fill,
                              // height: 200,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
