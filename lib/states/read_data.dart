import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yotproj/models/weight_model.dart';
import 'package:yotproj/utility/my_constant.dart';
import 'package:yotproj/widget/show_progress.dart';
import 'package:yotproj/widget/show_text.dart';

class ReadData extends StatefulWidget {
  const ReadData({super.key});

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  bool load = true;
  var weightModels = <WeightModel>[];

  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    String path = 'https://buathipvsms.com/app/getAllWeightData.php';
    await Dio().get(path).then((value) {
      for (var element in json.decode(value.data)) {
        WeightModel weightModel = WeightModel.fromMap(element);
        weightModels.add(weightModel);
      }

      load = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: load
          ? const ShowProgress()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 100,
                  child: Column(
                    children: [
                      ShowText(
                        text: 'CarNo',
                        textStyle: MyConstant().h2Style(),
                      ),
                      Divider(
                        color: MyConstant.dark,
                      ),
                      showListViewCarNo(),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  child: Column(
                    children: [
                      ShowText(
                        text: 'iMNo',
                        textStyle: MyConstant().h2Style(),
                      ),
                      Divider(
                        color: MyConstant.dark,
                      ),
                      showListViewiMNo(),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  child: Column(
                    children: [
                      ShowText(
                        text: 'ProCode',
                        textStyle: MyConstant().h2Style(),
                      ),
                      Divider(
                        color: MyConstant.dark,
                      ),
                      showListViewProCode(),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  child: Column(
                    children: [
                      ShowText(
                        text: 'ProName',
                        textStyle: MyConstant().h2Style(),
                      ),
                      Divider(
                        color: MyConstant.dark,
                      ),
                      showListViewProName(),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  child: Column(
                    children: [
                      ShowText(
                        text: 'Price',
                        textStyle: MyConstant().h2Style(),
                      ),
                      Divider(
                        color: MyConstant.dark,
                      ),
                      showListViewPrice(),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  child: Column(
                    children: [
                      ShowText(
                        text: 'Date Out',
                        textStyle: MyConstant().h2Style(),
                      ),
                      Divider(
                        color: MyConstant.dark,
                      ),
                      showListViewDateOut(),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  child: Column(
                    children: [
                      ShowText(
                        text: 'Time Out',
                        textStyle: MyConstant().h2Style(),
                      ),
                      Divider(
                        color: MyConstant.dark,
                      ),
                      showListViewTimeOut(),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  ListView showListViewCarNo() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: weightModels.length,
      itemBuilder: (context, index) => Column(
        children: [
          ShowText(text: weightModels[index].We_CarNo),
          Divider(
            color: Colors.grey.shade700,
          ),
        ],
      ),
    );
  }

  ListView showListViewTimeOut() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: weightModels.length,
      itemBuilder: (context, index) =>
          ShowText(text: weightModels[index].We_TimeOut),
    );
  }

  ListView showListViewiMNo() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: weightModels.length,
      itemBuilder: (context, index) =>
          ShowText(text: weightModels[index].We_iMNo),
    );
  }

  ListView showListViewProCode() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: weightModels.length,
      itemBuilder: (context, index) =>
          ShowText(text: weightModels[index].We_ProCode),
    );
  }

  ListView showListViewProName() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: weightModels.length,
      itemBuilder: (context, index) =>
          ShowText(text: weightModels[index].We_ProName),
    );
  }

  ListView showListViewPrice() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: weightModels.length,
      itemBuilder: (context, index) =>
          ShowText(text: weightModels[index].We_Price),
    );
  }

  ListView showListViewDateOut() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: weightModels.length,
      itemBuilder: (context, index) =>
          ShowText(text: weightModels[index].We_DateOut),
    );
  }

  Row showContent({required String head, required String value}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ShowText(
            text: head,
            textStyle: MyConstant().h2Style(),
          ),
        ),
        Expanded(
          flex: 2,
          child: ShowText(text: value),
        ),
      ],
    );
  }
}
