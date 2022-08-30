import 'package:flutter/material.dart';

class MultiDirectionalScrollView extends StatefulWidget {
  const MultiDirectionalScrollView({Key? key}) : super(key: key);
  @override
  _MultiDirectionalScrollViewState createState() =>
      _MultiDirectionalScrollViewState();
}

class _MultiDirectionalScrollViewState
    extends State<MultiDirectionalScrollView> {
  Widget cell(int rowX, int colY) {
    
    return GestureDetector(
        onTap: () {
          setState(() {
            row = rowX;
            column = colY;
          });
        },
        child: Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: (row == rowX && column == colY)
                    ? Colors.green
                    : Colors.white,
                border: Border.all(
                    color: Colors.grey.withOpacity(0.45), width: 1.0)),
            child: Text('${(rowX *rowCount +colY)+1}')));
  }

  int row = 0, column = 0;
  int rowCount=10;
  int colCount=10;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('multi Direction scroll'),
      ),
      body: InteractiveViewer(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: List.generate(
                  rowCount,
                  (indexX) => Row(
                      children:
                          List.generate(colCount, (indexY) => cell(indexX, indexY)))),
            ),
          ),
        ),
      ),
    );
  }
}
