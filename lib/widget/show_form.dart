// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShowForm extends StatelessWidget {
  final String hint;
  final Function(String) changeFunc;
  final TextEditingController? textEditingController;
  const ShowForm({
    Key? key,
    required this.hint,
    required this.changeFunc,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: 250,
      child: TextFormField(controller: textEditingController,
        onChanged: changeFunc,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
