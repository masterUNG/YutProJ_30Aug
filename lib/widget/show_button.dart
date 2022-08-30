// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShowButtom extends StatelessWidget {
  final String label;
  final Function() changeFunc;
  const ShowButtom({
    Key? key,
    required this.label,
    required this.changeFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: changeFunc, child: Text(label));
  }
}
