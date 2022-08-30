import 'dart:io';

import 'package:flutter/material.dart';
import 'package:yotproj/states/authen.dart';
import 'package:yotproj/states/multi_directional_scrollview.dart';
import 'package:yotproj/states/process_choose_item.dart';

void main() {
  HttpOverrides.global = MyHttpOverride();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProcessChooseItem(),
    );
  }
}

class MyHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
