// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeightModel {
  final String We_CarNo;
  final String We_iMNo;
  final String We_ProCode;
  final String We_ProName;
  final String We_Price;
  final String We_DateOut;
  final String We_TimeOut;
  WeightModel({
    required this.We_CarNo,
    required this.We_iMNo,
    required this.We_ProCode,
    required this.We_ProName,
    required this.We_Price,
    required this.We_DateOut,
    required this.We_TimeOut,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'We_CarNo': We_CarNo,
      'We_iMNo': We_iMNo,
      'We_ProCode': We_ProCode,
      'We_ProName': We_ProName,
      'We_Price': We_Price,
      'We_DateOut': We_DateOut,
      'We_TimeOut': We_TimeOut,
    };
  }

  factory WeightModel.fromMap(Map<String, dynamic> map) {
    return WeightModel(
      We_CarNo: (map['We_CarNo'] ?? '') as String,
      We_iMNo: (map['We_iMNo'] ?? '') as String,
      We_ProCode: (map['We_ProCode'] ?? '') as String,
      We_ProName: (map['We_ProName'] ?? '') as String,
      We_Price: (map['We_Price'] ?? '') as String,
      We_DateOut: (map['We_DateOut'] ?? '') as String,
      We_TimeOut: (map['We_TimeOut'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeightModel.fromJson(String source) =>
      WeightModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
