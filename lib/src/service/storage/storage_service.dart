import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveUser({
    required String password,
    required String userEmail,
  }) async {
    await _prefs.setString("password", password);
    await _prefs.setString("email", userEmail);
  }

  static String? getUserEmail() {
    return _prefs.getString("email");
  }

  static String? getpassword() {
    return _prefs.getString("password");
  }

  static Future<void> deleteUser() async {
    await _prefs.remove("password");
    await _prefs.remove("email");
  }
}



































// class LocalStorageServices {
//   static late SharedPreferences _prefs;

//   static Future<void> init() async {
//     _prefs = await SharedPreferences.getInstance();
//   }

//   static Future<void> savePostDetails({
//     required String postImageUrl,
//     required String postDiscription,
//   }) async {
//     await _prefs.setString("postImageUrl", postImageUrl);
//     await _prefs.setString("postDiscription", postDiscription);
//   }

//   static String? postImageUrl() {
//     return _prefs.getString("postImageUrl");
//   }

//   static String? postDiscription() {
//     return _prefs.getString("postDiscription");
//   }

//   static Future<void> deletePost() async {
//     await _prefs.remove("postImageUrl");
//     await _prefs.remove("postDiscription");
//   }
// }

// class LocalStorageListServices {
//   static late SharedPreferences _prefs;

//   static Future<void> init() async {
//     _prefs = await SharedPreferences.getInstance();
//   }

//   static Future<void> savePostDetails(List<dynamic> list) async {
//     final prefs = await SharedPreferences.getInstance();
//     String encodedList = jsonEncode(list);
//     await prefs.setString('myList', encodedList);
//   }

//   static String? postImageUrl() {
//     return _prefs.getString("postList");
//   }

//   static Future<void> deletePostList() async {
//     await _prefs.remove("postList");
//   }
// }
