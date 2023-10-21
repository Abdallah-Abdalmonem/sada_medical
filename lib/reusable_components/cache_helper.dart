import 'dart:convert';

import 'package:application/widgets/passing.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<PatientModel> patientDataList = [];

class CacheHelper {
  static SharedPreferences? prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setList() async {
    List items = patientDataList.map((e) => e.toMap()).toList();
    await CacheHelper.prefs?.setString('list', jsonEncode(items));
  }

  static void getList() async {
    patientDataList = [];
    final List<dynamic> jsonData =
        jsonDecode(CacheHelper.prefs?.getString('list') ?? '[]');

    for (var element in jsonData) {
      patientDataList.add(PatientModel.fromMap(element));
    }
  }
}
