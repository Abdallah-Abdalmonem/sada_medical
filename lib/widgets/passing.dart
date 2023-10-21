// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/constant/appcolor.dart';
import '../constants/constant/image_constant.dart';
import '../models/row_model.dart';
import '../reusable_components/toast_helper.dart';
import 'bodies/twenty_screen/twenty_screen.dart';
import 'custom_widgets/custom_button.dart';
import 'custom_widgets/custom_table_continer.dart';
import 'custom_widgets/custom_table_row.dart';
import 'custom_widgets/custom_text_form_field.dart';

List<PatientData> patientDataList = [];

class Passing extends StatefulWidget {
  const Passing({super.key});

  @override
  State<Passing> createState() => _PassingState();
}

class _PassingState extends State<Passing> {
  TextEditingController nameController = TextEditingController();
  final TextEditingController _hematologyController1 = TextEditingController();
  final TextEditingController _hematologyController2 = TextEditingController();
  final TextEditingController _hematologyController3 = TextEditingController();
  final TextEditingController _hematologyController4 = TextEditingController();
  final TextEditingController _hematologyController5 = TextEditingController();
  final TextEditingController _hematologyController6 = TextEditingController();

  final TextEditingController _coagulationController1 = TextEditingController();
  final TextEditingController _coagulationController2 = TextEditingController();
  final TextEditingController _coagulationController3 = TextEditingController();

  final TextEditingController _chemistryController1 = TextEditingController();
  final TextEditingController _chemistryController2 = TextEditingController();
  final TextEditingController _chemistryController3 = TextEditingController();
  final TextEditingController _chemistryController4 = TextEditingController();

  DateTime? selectedDate;
  TextEditingController typeOfEchoController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<CustomModel> _chemistryModel = [
    CustomModel(text: 'RBS'),
    CustomModel(text: 'Cholesterol'),
    CustomModel(text: 'TGs'),
    CustomModel(text: 'CK'),
  ];
  List<CustomModel> _coagulationModel = [
    CustomModel(text: 'PC'),
    CustomModel(text: 'PT'),
    CustomModel(text: 'LNR'),
  ];
  List<CustomModel> _hematologyModel = [
    CustomModel(text: 'HB'),
    CustomModel(text: 'TLC'),
    CustomModel(text: 'ESR'),
    CustomModel(text: 'CRP'),
    CustomModel(text: 'Reticuloeytes'),
    CustomModel(text: 'Lymph'),
  ];

  File? fileImage;
  var picker = ImagePicker();
  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      fileImage = File(pickedFile.path);
      print(pickedFile.path);
      setState(() {});
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorEnable,
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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.imgPerson,
                              height: 30, width: 30),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomTextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'you should enter name';
                                }
                                return null;
                              },
                              controller: nameController,
                              margin: const EdgeInsets.only(left: 1),
                              hintText: "patient name",
                              textInputType: TextInputType.name,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate:
                                selectedDate ?? DateTime.now(), // Refer step 1
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2025),
                          );
                          if (picked != null && picked != selectedDate) {
                            setState(() {
                              selectedDate = picked;
                            });
                          } else {
                            ToastHelper.toastfailure(
                                msg: 'you should enter date');
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.imgDate,
                              height: 25,
                              width: 30,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomTextFormField(
                                readOnly: true,
                                margin: const EdgeInsets.only(left: 1),
                                hintText: selectedDate == null
                                    ? "Date"
                                    : selectedDate.toString().substring(0, 10),
                              ),
                            ),
                          ],
                        ),
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
                          CustomTableRow(
                              title: 'HB',
                              onTap: () {
                                setState(() {
                                  _hematologyModel[0].isSelected =
                                      !_hematologyModel[0].isSelected;
                                  if (!_hematologyModel[0].isSelected) {
                                    _hematologyController1.clear();
                                    _hematologyModel[0].prority = 0;
                                  }
                                });
                              },
                              onChange: (text) {
                                if (text.isNotEmpty) {
                                  _hematologyModel[0].prority = int.parse(text);
                                }
                              },
                              isEnable: _hematologyModel[0].isSelected,
                              controller: _hematologyController1,
                              readOnly: !_hematologyModel[0].isSelected,
                              context: context),
                          CustomTableRow(
                              title: 'TLC',
                              onTap: () {
                                setState(() {
                                  _hematologyModel[1].isSelected =
                                      !_hematologyModel[1].isSelected;
                                  if (!_hematologyModel[1].isSelected) {
                                    _hematologyController2.clear();
                                    _hematologyModel[1].prority = 0;
                                  }
                                });
                              },
                              onChange: (text) {
                                if (text.isNotEmpty) {
                                  _hematologyModel[1].prority = int.parse(text);
                                }
                              },
                              isEnable: _hematologyModel[1].isSelected,
                              controller: _hematologyController2,
                              readOnly: !_hematologyModel[1].isSelected,
                              context: context),
                          CustomTableRow(
                              title: 'ESR',
                              onTap: () {
                                setState(() {
                                  _hematologyModel[2].isSelected =
                                      !_hematologyModel[2].isSelected;
                                  if (!_hematologyModel[2].isSelected) {
                                    _hematologyController3.clear();
                                    _hematologyModel[2].prority = 0;
                                  }
                                });
                              },
                              onChange: (text) {
                                if (text.isNotEmpty) {
                                  _hematologyModel[2].prority = int.parse(text);
                                }
                              },
                              isEnable: _hematologyModel[2].isSelected,
                              controller: _hematologyController3,
                              readOnly: !_hematologyModel[2].isSelected,
                              context: context),
                          CustomTableRow(
                              title: 'CRP',
                              onTap: () {
                                setState(() {
                                  _hematologyModel[3].isSelected =
                                      !_hematologyModel[3].isSelected;
                                  if (!_hematologyModel[2].isSelected) {
                                    _hematologyController4.clear();
                                    _hematologyModel[3].prority = 0;
                                  }
                                });
                              },
                              onChange: (text) {
                                if (text.isNotEmpty) {
                                  _hematologyModel[3].prority = int.parse(text);
                                }
                              },
                              isEnable: _hematologyModel[3].isSelected,
                              controller: _hematologyController4,
                              readOnly: !_hematologyModel[3].isSelected,
                              context: context),
                          CustomTableRow(
                              title: 'Reticuloeytes',
                              onTap: () {
                                setState(() {
                                  _hematologyModel[4].isSelected =
                                      !_hematologyModel[4].isSelected;
                                  if (!_hematologyModel[4].isSelected) {
                                    _hematologyController5.clear();
                                    _hematologyModel[4].prority = 0;
                                  }
                                });
                              },
                              onChange: (text) {
                                if (text.isNotEmpty) {
                                  _hematologyModel[4].prority = int.parse(text);
                                }
                              },
                              isEnable: _hematologyModel[4].isSelected,
                              controller: _hematologyController5,
                              readOnly: !_hematologyModel[4].isSelected,
                              context: context),
                          CustomTableRow(
                              title: 'Lymph',
                              onTap: () {
                                setState(() {
                                  _hematologyModel[5].isSelected =
                                      !_hematologyModel[5].isSelected;
                                  if (!_hematologyModel[5].isSelected) {
                                    _hematologyController6.clear();
                                    _hematologyModel[5].prority = 0;
                                  }
                                });
                              },
                              onChange: (text) {
                                if (text.isNotEmpty) {
                                  _hematologyModel[5].prority = int.parse(text);
                                }
                              },
                              isEnable: _hematologyModel[5].isSelected,
                              controller: _hematologyController6,
                              readOnly: !_hematologyModel[5].isSelected,
                              context: context),
                        ],
                      )),
                  const SizedBox(height: 20),
                  CustomTableContiner(
                      categoryName: 'Coagulation',
                      table: Column(
                        children: [
                          CustomTableRow(
                              title: 'PC',
                              onTap: () {
                                setState(() {
                                  _coagulationModel[0].isSelected =
                                      !_coagulationModel[0].isSelected;
                                });
                              },
                              onChange: (text) {
                                if (text.isNotEmpty) {
                                  _coagulationModel[0].prority =
                                      int.parse(text);
                                }
                              },
                              isEnable: _coagulationModel[0].isSelected,
                              controller: _coagulationController1,
                              context: context),
                          CustomTableRow(
                              title: 'PT',
                              onTap: () {
                                setState(() {
                                  _coagulationModel[1].isSelected =
                                      !_coagulationModel[1].isSelected;
                                });
                              },
                              onChange: (text) {
                                if (text.isNotEmpty) {
                                  _coagulationModel[1].prority =
                                      int.parse(text);
                                }
                              },
                              isEnable: _coagulationModel[1].isSelected,
                              controller: _coagulationController2,
                              context: context),
                          CustomTableRow(
                              title: 'LNR',
                              onTap: () {
                                setState(() {
                                  _coagulationModel[2].isSelected =
                                      !_coagulationModel[2].isSelected;
                                });
                              },
                              onChange: (text) {
                                if (text.isNotEmpty) {
                                  _coagulationModel[2].prority =
                                      int.parse(text);
                                }
                              },
                              isEnable: _coagulationModel[2].isSelected,
                              controller: _coagulationController3,
                              context: context),
                        ],
                      )),
                  SizedBox(height: 20),
                  CustomTableContiner(
                      categoryName: 'Chemistry',
                      table: Column(
                        children: [
                          CustomTableRow(
                              title: 'RBS',
                              onTap: () {
                                setState(() {
                                  _chemistryModel[0].isSelected =
                                      !_chemistryModel[0].isSelected;
                                });
                              },
                              onChange: (text) {
                                if (text.isNotEmpty) {
                                  _chemistryModel[0].prority = int.parse(text);
                                }
                              },
                              isEnable: _chemistryModel[0].isSelected,
                              controller: _chemistryController1,
                              context: context),
                          CustomTableRow(
                              title: 'Cholesterol',
                              onTap: () {
                                setState(() {
                                  _chemistryModel[1].isSelected =
                                      !_chemistryModel[1].isSelected;
                                });
                              },
                              onChange: (text) {
                                if (text.isNotEmpty) {
                                  _chemistryModel[1].prority = int.parse(text);
                                }
                              },
                              isEnable: _chemistryModel[1].isSelected,
                              controller: _chemistryController2,
                              context: context),
                          CustomTableRow(
                              title: 'TGs',
                              onTap: () {
                                setState(() {
                                  _chemistryModel[2].isSelected =
                                      !_chemistryModel[2].isSelected;
                                });
                              },
                              onChange: (text) {
                                if (text.isNotEmpty) {
                                  _chemistryModel[2].prority = int.parse(text);
                                }
                              },
                              isEnable: _chemistryModel[2].isSelected,
                              controller: _chemistryController3,
                              context: context),
                          CustomTableRow(
                              title: 'CK',
                              onTap: () {
                                setState(() {
                                  _chemistryModel[3].isSelected =
                                      !_chemistryModel[3].isSelected;
                                });
                              },
                              onChange: (text) {
                                if (text.isNotEmpty) {
                                  _chemistryModel[3].prority = int.parse(text);
                                }
                              },
                              isEnable: _chemistryModel[3].isSelected,
                              controller: _chemistryController4,
                              context: context),
                        ],
                      )),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Type of Echo',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.continerColor,
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: CustomTextFormField(
                            controller: typeOfEchoController,
                            hintText: 'Write the type and upload pictures',
                            textStyle: fileImage != null
                                ? const TextStyle(
                                    color: AppColor.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)
                                : null,
                            fillColor: AppColor.continerColor,
                            filled: true,
                          ),
                        ),
                        if (fileImage != null)
                          Image.file(
                            fileImage!,
                            fit: BoxFit.contain,
                            // height: 200,
                            width: double.infinity,
                          ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          getProfileImage();
                        },
                        child: Image.asset(
                          AppImages.imgUploadImage,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          setState(() {
                            fileImage = null;
                          });
                        },
                        child: Image.asset(
                          AppImages.imgRemove,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        onPress: () async {
                          if (selectedDate == null) {
                            ToastHelper.toastfailure(
                                msg: 'you should enter date');
                            return;
                          }
                          if (_formKey.currentState!.validate()) {
                            patientDataList.add(
                              PatientData(
                                name: nameController.text.toString(),
                                date: selectedDate.toString(),
                                typeOfEcho:
                                    typeOfEchoController.text.toString(),
                                fileImage: fileImage,
                                hematologyModelList:
                                    reorderList(_hematologyModel),
                                chemistryModelList:
                                    reorderList(_chemistryModel),
                                coagulationModelList:
                                    reorderList(_coagulationModel),
                              ),
                            );
                            await clearData();
                            setState(() {});
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => TwentyScreen(
                            //       chemistryModelList:
                            //           reorderList(_chemistryModel),
                            //       coagulationModelList:
                            //           reorderList(_coagulationModel),
                            //       hematologyModelList:
                            //           reorderList(_hematologyModel),
                            //       date: selectedDate.toString(),
                            //       fileImage: fileImage,
                            //       typeOfEcho:
                            //           typeOfEchoController.text.toString(),
                            //       name: nameController.text.toString(),
                            //     ),
                            //   ),
                            // );
                            ToastHelper.toastSuccess(msg: 'Success!');
                          }
                        },
                        title: 'Send',
                      ),
                      CustomButton(
                        onPress: () {},
                        title: 'Following',
                      ),
                      CustomButton(
                        onPress: () {},
                        title: 'Order',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  clearData() async {
    nameController.clear();
    typeOfEchoController.clear();
    _hematologyController1.clear();
    _hematologyController2.clear();
    _hematologyController3.clear();
    _hematologyController4.clear();
    _hematologyController5.clear();
    _hematologyController6.clear();
    _coagulationController1.clear();
    _coagulationController2.clear();
    _coagulationController3.clear();
    _chemistryController1.clear();
    _chemistryController2.clear();
    _chemistryController3.clear();
    _chemistryController4.clear();

    selectedDate = null;
    fileImage = null;

    // for (var i = 0; i < _hematologyModel.length; i++) {
    //   _hematologyModel[i].isSelected = false;
    // }
    // for (var i = 0; i < _chemistryModel.length; i++) {
    //   _chemistryModel[i].isSelected = false;
    // }
    // for (var i = 0; i < _coagulationModel.length; i++) {
    //   _coagulationModel[i].isSelected = false;
    // }
  }
}

class PatientData {
  File? fileImage;
  String? name;
  String? date;
  String? typeOfEcho;
  List<CustomModel>? hematologyModelList;
  List<CustomModel>? coagulationModelList;
  List<CustomModel>? chemistryModelList;
  PatientData({
    this.fileImage,
    this.name,
    this.date,
    this.typeOfEcho,
    this.hematologyModelList,
    this.coagulationModelList,
    this.chemistryModelList,
  });
}

List<CustomModel> reorderList(List<CustomModel> list) {
  List<CustomModel> OrderedList = list;
  OrderedList[0] = list[0];

  OrderedList.sort((a, b) => b.prority.compareTo(a.prority));
  for (var i = 0; i < OrderedList.length; i++) {
    print(
        '${OrderedList[i].text} ${OrderedList[i].isSelected} ${OrderedList[i].prority}');
  }
  return OrderedList;
}
