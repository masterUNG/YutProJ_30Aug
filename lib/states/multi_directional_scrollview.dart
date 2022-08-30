import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yotproj/models/weight_model.dart';
import 'package:yotproj/utility/my_constant.dart';
import 'package:yotproj/widget/show_progress.dart';
import 'package:yotproj/widget/show_text.dart';

class MultiDirectionalScrollView extends StatefulWidget {
  const MultiDirectionalScrollView({Key? key}) : super(key: key);
  @override
  _MultiDirectionalScrollViewState createState() =>
      _MultiDirectionalScrollViewState();
}

class _MultiDirectionalScrollViewState
    extends State<MultiDirectionalScrollView> {
  bool load = true;

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
        child: ShowText(text: listItems[rowX][colY], textStyle: rowX == 0 ? MyConstant().h2Style() : MyConstant().h3Style()  ,),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    readAllData();
  }

  var listItems = <List<String>>[];
  int row = 0, column = 0;
  int? rowCount; // Amount Column
  int? colCount; // Amount Row

  Future<void> readAllData() async {
    String path = 'https://buathipvsms.com/app/getAllWeightData.php';

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
          : InteractiveViewer(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: List.generate(rowCount!, (indexX) {
                      print('indexX ==> $indexX');
                      return Row(
                          children: List.generate(colCount!, (indexY) {
                        print('indexY ==> $indexY');
                        return cell(indexX, indexY);
                      }));
                    }),
                  ),
                ),
              ),
            ),
    );
  }
}
