import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yotproj/states/multi_directional_scrollview.dart';
import 'package:yotproj/widget/show_button.dart';
import 'package:yotproj/widget/show_form.dart';
import 'package:yotproj/widget/show_text.dart';

class ProcessChooseItem extends StatefulWidget {
  const ProcessChooseItem({super.key});

  @override
  State<ProcessChooseItem> createState() => _ProcessChooseItemState();
}

class _ProcessChooseItemState extends State<ProcessChooseItem> {
  String? carNo, startDate, endDate;
  DateTime dateTime = DateTime.now();

  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startController.text = changeDateToString(dateTime: dateTime);
    endController.text = changeDateToString(dateTime: dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ShowForm(
              hint: 'CarNo :',
              changeFunc: (p0) {
                carNo = p0.trim();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShowForm(
                  hint: 'StartDate:',
                  changeFunc: (p0) {},
                  textEditingController: startController,
                ),
                ShowButtom(
                  label: 'Start',
                  changeFunc: () {
                    processDatePicker(
                        startBool: true,
                        dateString: startController.text,
                        context: context);
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShowForm(
                  hint: 'EndDate',
                  changeFunc: (p0) {},
                  textEditingController: endController,
                ),
                ShowButtom(
                  label: 'End',
                  changeFunc: () {
                    processDatePicker(
                        startBool: false,
                        dateString: endController.text,
                        context: context);
                  },
                )
              ],
            ),
            ShowButtom(
                label: 'List Data',
                changeFunc: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MultiDirectionalScrollView(
                          carNo: carNo ?? '',
                          startDate:
                              changeYear(yearString: startController.text),
                          endDate: changeYear(yearString: endController.text),
                        ),
                      ));
                })
          ],
        ),
      ),
    );
  }

  String changeYear({required String yearString}) {
    var strings = yearString.split('-');
    int year = int.parse(strings[0]) + 543;
    strings[0] = year.toString();
    return '${strings[0]}-${strings[1]}-${strings[2]}';
  }

  String changeDateToString({required DateTime dateTime}) {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    String string = dateFormat.format(dateTime);
    return string;
  }

  Future<void> processDatePicker(
      {required bool startBool,
      required String dateString,
      required BuildContext context}) async {
    var strings = dateString.split('-');
    for (var i = 0; i < strings.length; i++) {
      strings[i] = strings[i].trim();
    }

    DateTime dateTime = DateTime(
        int.parse(strings[0]), int.parse(strings[1]), int.parse(strings[2]));

    DateTime? chooseDateTime = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(dateTime.year - 5),
      lastDate: DateTime(dateTime.year + 5),
    );

    if (chooseDateTime != null) {
      String string = changeDateToString(dateTime: chooseDateTime);

      if (startBool) {
        //Start
        setState(() {
          startController.text = string;
        });
      } else {
        //End
        setState(() {
          endController.text = string;
        });
      }
    }
  }
}
