import 'package:flutter/material.dart';

class PageMatrix extends StatefulWidget {
  const PageMatrix({super.key});

  @override
  State<PageMatrix> createState() => _PageMatrixstate();
}

class _PageMatrixstate extends State<PageMatrix> {
  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'CP-SU LED MATRIX',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.indigo[900],
    );
  }

  var dotsData = [
    // Digit 0
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 1
    [
      [0, 0, 1, 0, 0],
      [0, 1, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 1, 1, 0],
    ],
    // Digit 2
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [1, 1, 1, 1, 1],
    ],
    // Digit 3
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 4
    [
      [0, 0, 0, 1, 0],
      [0, 0, 1, 1, 0],
      [0, 1, 0, 1, 0],
      [1, 0, 0, 1, 0],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 0, 1, 0],
    ],
    // Digit 5
    [
      [1, 1, 1, 1, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 6
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 7
    [
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
    ],
    // Digit 8
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 9
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ]
  ];
  int count = 0;
  String SCount = '00';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        color: Colors.blue[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton(0),
            _buildDisplay(SCount),
            _buildButton(1),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(int type) {
    if (type == 0) {
      return Center(
        child: Container(
            width: 70.0,
            height: 70.0,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: InkWell(
              onTap: () {
                setState(
                  () {
                    if (count < 99) {
                      count++;
                      if (count < 10) {
                        SCount = '0' + count.toString();
                      } else {
                        SCount = count.toString();
                      }
                    } else {
                      count = 0;
                      SCount = '00';
                    }
                  },
                );
              },
              child: Container(
                child: Icon(
                  Icons.arrow_drop_up_outlined,
                  size: 60.0,
                ),
              ),
            )),
      );
    } else {
      return Center(
        child: Container(
            width: 70.0,
            height: 70.0,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: InkWell(
              onTap: () {
                setState(
                  () {
                    if (count <= 0) {
                      count = 99;
                      SCount = '99';
                    } else {
                      count--;
                      if (count < 10) {
                        SCount = '0' + count.toString();
                      } else {
                        SCount = count.toString();
                      }
                    }
                  },
                );
              },
              //
              child: Container(
                child: Icon(
                  Icons.arrow_drop_down_outlined,
                  size: 60.0,
                ),
              ),
            )),
      );
    }
  }

  Widget _buildDot(int num) {
    if (num == 0) {
      return Container(
        width: 20.0,
        height: 20.0,
        margin: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[850],
        ),
      );
    } else {
      return Container(
        width: 20.0,
        height: 20.0,
        margin: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.pinkAccent[700],
        ),
      );
    }
  }

  Widget _buildRow(List<int> dotList) {
    return Row(
      children: [
        _buildDot(dotList[0]),
        _buildDot(dotList[1]),
        _buildDot(dotList[2]),
        _buildDot(dotList[3]),
        _buildDot(dotList[4]),
      ],
    );
  }

  Widget _buildDigit(List<List<int>> rowList) {
    return Column(
      children: [
        _buildRow(rowList[0]),
        _buildRow(rowList[1]),
        _buildRow(rowList[2]),
        _buildRow(rowList[3]),
        _buildRow(rowList[4]),
        _buildRow(rowList[5]),
        _buildRow(rowList[6]),
      ],
    );
  }

  Widget _buildDisplay(String value) {
    String c1 = value[0];
    String c2 = value[1];
    return Container(
      padding: EdgeInsets.all(16.0),
      width: 310.0,
      height: 220.0,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        border: Border.all(
          color: Colors.white,
          width: 10.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildDigit(dotsData[int.parse(c1)]),
          SizedBox(width: 10.0),
          _buildDigit(dotsData[int.parse(c2)]),
        ],
      ),
    );
  }
}
