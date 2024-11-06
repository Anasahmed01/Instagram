// To parse this JSON data, do
//
//     final homePostModel = homePostModelFromJson(jsonString);

import 'dart:convert';

HomePostModel homePostModelFromJson(String str) =>
    HomePostModel.fromJson(json.decode(str));

String homePostModelToJson(HomePostModel data) => json.encode(data.toJson());

class HomePostModel {
  List<Datum> data;

  HomePostModel({
    required this.data,
  });

  factory HomePostModel.fromJson(Map<String, dynamic> json) => HomePostModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String userName;
  String profilePicture;
  String post;
  String discription;

  Datum({
    required this.userName,
    required this.profilePicture,
    required this.post,
    required this.discription,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userName: json["user_name"],
        profilePicture: json["profile_picture"],
        post: json["post"],
        discription: json["discription"],
      );

  Map<String, dynamic> toJson() => {
        "user_name": userName,
        "profile_picture": profilePicture,
        "post": post,
        "discription": discription,
      };
}

List postData = [];
List cameraPostData = [];
