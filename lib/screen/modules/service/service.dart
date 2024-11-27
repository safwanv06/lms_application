import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lms_project/main.dart';
import 'package:lms_project/model/modules_model.dart';
import 'package:lms_project/utils/middleware/dio_api_handler/dio_api_handler.dart';

class ModulesService {
  static Future<List<ModulesDataModel>> getModules(
      {required int subjectId}) async {
    try {
      Response response =
          await dioApiCall().get("${apiRoutes.modules}$subjectId");
      if (response.statusCode == 200) {
        List data = jsonDecode(response.data);
        List<ModulesDataModel> modules = [];
        for (Map element in data) {
          modules.add(ModulesDataModel(
              id: element["id"]??"",
              title: element["title"]??"",
              description: element["description"]??"",
          ));
        }
        return modules;
      } else {
        throw Error();
      }
    } catch (e) {
      print("the e is $e");
      rethrow;
    }
  }
}
