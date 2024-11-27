class ApiRoutes {
  static const String _baseUrl = "https://trogon.info/interview/php/api";

  String subjects = "$_baseUrl/subjects.php";
  String modules = "$_baseUrl/modules.php?subject_id=";
  String videos = "$_baseUrl/videos.php?module_id=";
}
