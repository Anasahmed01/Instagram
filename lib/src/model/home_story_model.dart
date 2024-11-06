// To parse this JSON data, do
//
//     final homeStoryModel = homeStoryModelFromJson(jsonString);

import 'dart:convert';

HomeStoryModel homeStoryModelFromJson(String str) => HomeStoryModel.fromJson(json.decode(str));

String homeStoryModelToJson(HomeStoryModel data) => json.encode(data.toJson());

class HomeStoryModel {
  List<Datum> data;

  HomeStoryModel({
    required this.data,
  });

  factory HomeStoryModel.fromJson(Map<String, dynamic> json) => HomeStoryModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String userName;
  String profilePicture;

  Datum({
    required this.userName,
    required this.profilePicture,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userName: json["user_name"],
        profilePicture: json["profile_picture"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": userName,
        "profile_picture": profilePicture,
      };
}
