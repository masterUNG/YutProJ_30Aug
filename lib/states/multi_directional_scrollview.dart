// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:yotproj/models/weight_model.dart';
import 'package:yotproj/utility/my_constant.dart';
import 'package:yotproj/widget/show_progress.dart';
import 'package:yotproj/widget/show_text.dart';

class MultiDirectionalScrollView extends StatefulWidget {
  final String carNo;
  final String startDate;
  final String endDate;
  const MultiDirectionalScrollView({
    Key? key,
    required this.carNo,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);
  @override
  _MultiDirectionalScrollViewState createState() =>
      _MultiDirectionalScrollViewState();
}

class _MultiDirectionalScrollViewState
    extends State<MultiDirectionalScrollView> {
  bool load = true;
  bool? haveData;

  Widget cell(int rowX, int colY) {
    return GestureDetector(
      // onTap: () {
      //   setState(() {
      //     row = rowX;
      //     column = colY;
      //   });
      // },
      child: Container(
        width: 120,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border.all(color: Colors.grey.withOpacity(0.45), width: 1.0)),
        child: ShowText(
          text: listItems[rowX][colY],
          textStyle:
              rowX == 0 ? MyConstant().h2Style() : MyConstant().h3Style(),
        ),
      ),
    );
  }

  String? carNo, startDate, endDate;

  @override
  void initState() {
    super.initState();

    carNo = widget.carNo;
    startDate = widget.startDate;
    endDate = widget.endDate;
    print('carNo ==> $carNo, startDate ==> $startDate, endDate ==> $endDate');

    readAllData();
  }

  var listItems = <List<String>>[];
  int row = 0, column = 0;
  int? rowCount; // Amount Column
  int? colCount; // Amount Row

  Future<void> readAllData() async {
    // String path = 'https://buathipvsms.com/app/getAllWeightData.php';
    // String path = 'https://buathipvsms.com/app/getWeightDataWithCondition.php';

    String path =
        'https://buathipvsms.com/app/getWeightDataWithCondition.php?isRead=true&CarNO=$carNo&StartDate=$startDate&EndDate=$endDate';

    var heads = <String>[];
    heads.add('CarNo');
    heads.add('iMNo');
    heads.add('ProCode');
    heads.add('ProName');
    heads.add('Price');
    heads.add('DateOut');
    heads.add('TimeOut');

    listItems.add(heads);

    await Dio().get(path).then((value) {
      if (value.toString() == 'null') {
        haveData = false;
      } else {
        haveData = true;
        for (var element in json.decode(value.data)) {
          WeightModel weightModel = WeightModel.fromMap(element);

          var items = <String>[];
          items.add(weightModel.We_CarNo);
          items.add(weightModel.We_iMNo);
          items.add(weightModel.We_ProCode);
          items.add(weightModel.We_ProName);
          items.add(weightModel.We_Price);
          items.add(weightModel.We_DateOut);
          items.add(weightModel.We_TimeOut);

          listItems.add(items);
        }

        rowCount = listItems.length;
        colCount = listItems[0].length;
      }

      load = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('multi Direction scroll'),
      ),
      body: load
          ? const ShowProgress()
          : haveData!
              ? InteractiveViewer(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: List.generate(rowCount!, (indexX) {
                          // print('indexX ==> $indexX');
                          return Row(
                              children: List.generate(colCount!, (indexY) {
                            //print('indexY ==> $indexY');
                            return cell(indexX, indexY);
                          }));
                        }),
                      ),
                    ),
                  ),
                )
              : Center(
                  child: ShowText(
                  text: 'No Data',
                  textStyle: MyConstant().h1Style(),
                )),
    );
  }
}
