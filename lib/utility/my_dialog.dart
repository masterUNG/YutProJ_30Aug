// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:yotproj/widget/show_text_button.dart';

class MyDialog {
  final BuildContext context;
  MyDialog({
    required this.context,
  });

  Future<void> normalDialog(
      {required String title, required String subtitle}) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(subtitle),
        actions: [
          ShowTextButton(
            label: 'OK',
            pressFunc: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
