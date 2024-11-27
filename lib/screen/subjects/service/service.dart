import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lms_project/main.dart';
import 'package:lms_project/model/subject_model.dart';
import 'package:lms_project/utils/middleware/dio_api_handler/dio_api_handler.dart';

class SubjectsService {

  static Future<List<SubjectDataModel>> getSubjects() async {
    try {
      Response response = await dioApiCall().get(apiRoutes.subjects);
      if (response.statusCode == 200) {
        List data = jsonDecode(response.data);
        List<SubjectDataModel> classes = [];
        for (Map element in data) {
          classes.add(SubjectDataModel(
              id: element["id"],
              subject: element["title"],
              description: element["description"],
              image: element["image"]));
        }
        return classes;
      } else {
        throw Error();
      }
    } catch (e) {
      rethrow;
    }
  }

}
