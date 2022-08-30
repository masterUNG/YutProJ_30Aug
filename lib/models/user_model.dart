import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String User_ID;
  final String User_Name;
  final String User_Password;
  final String User_Detail;
  final String User_Power;
  final String We_StationCode;
  final String We_StationName;
  UserModel({
    required this.User_ID,
    required this.User_Name,
    required this.User_Password,
    required this.User_Detail,
    required this.User_Power,
    required this.We_StationCode,
    required this.We_StationName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'User_ID': User_ID,
      'User_Name': User_Name,
      'User_Password': User_Password,
      'User_Detail': User_Detail,
      'User_Power': User_Power,
      'We_StationCode': We_StationCode,
      'We_StationName': We_StationName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      User_ID: (map['User_ID'] ?? '' ) as String,
      User_Name: (map['User_Name'] ?? '') as String,
      User_Password: (map['User_Password'] ?? '') as String,
      User_Detail: (map['User_Detail'] ?? '') as String,
      User_Power: (map['User_Power'] ?? '') as String,
      We_StationCode: (map['We_StationCode'] ?? '') as String,
      We_StationName: (map['We_StationName'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
