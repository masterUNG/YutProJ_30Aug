import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yotproj/models/user_model.dart';
import 'package:yotproj/states/read_data.dart';
import 'package:yotproj/utility/my_dialog.dart';
import 'package:yotproj/widget/show_button.dart';
import 'package:yotproj/widget/show_form.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  String? user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShowForm(
              hint: 'User :',
              changeFunc: (p0) {
                user = p0.trim();
              },
            ),
            ShowForm(
              hint: 'Password :',
              changeFunc: (p0) {
                password = p0.trim();
              },
            ),
            ShowButtom(
              label: 'Login',
              changeFunc: () {
                if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
                  MyDialog(context: context).normalDialog(
                      title: 'Have Space', subtitle: 'Please Fill Every Blank');
                } else {
                  processCheckUser();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> processCheckUser() async {
    String path =
        'https://buathipvsms.com/app/getUserWhereUser.php?isAdd=true&User_Name=$user';
    await Dio().get(path).then((value) {
      if (value.toString() == 'null') {
        MyDialog(context: context).normalDialog(
            title: 'User False?', subtitle: 'NO $user in my database');
      } else {
        print('value ==> $value');
        var result = json.decode(value.data);
        print('result ==> $result');

        for (var element in result) {
          UserModel userModel = UserModel.fromMap(element);
          if (password == userModel.User_Password) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => ReadData(),
                ),
                (route) => false);
          } else {
            MyDialog(context: context).normalDialog(
                title: 'Password False ?', subtitle: 'Please Try again');
          }
        }
      }
    });
  }
}
