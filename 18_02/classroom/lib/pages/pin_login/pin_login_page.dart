import 'package:classroom/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class PinLoginPage extends StatefulWidget {
  const PinLoginPage({super.key});

  static const _keypad = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    // -2 = Clear, -1 = Back
    [-2, 0, -1]
  ];

  @override
  State<PinLoginPage> createState() => _PinLoginPageState();
}

class _PinLoginPageState extends State<PinLoginPage> {
  static const inputLength = 6;
  static const password = '123456';
  String _input = '';

  @override
  Widget build(BuildContext context) {
    print('Your input is $_input');

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(Icons.security, size: 80.0),
              SizedBox(height: 8.0),
              Text('PIN LOGIN', style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < _input.length; i++)
                Icon(Icons.radio_button_checked),
              for (var i = 0; i < inputLength - _input.length; i++)
                Icon(Icons.radio_button_unchecked),
            ],
          ),
          _buildKeypad(),
        ],
      ),
    );
  }

  Column _buildKeypad() {
    return Column(
      children: [
        // _buildRow([1, 2, 3]),
        // _buildRow([4, 5, 6]),
        // _buildRow([7, 8, 9]),

        for (var row in PinLoginPage._keypad) _buildRow(row),
      ],
    );
  }

  Widget _buildRow(List<int> numList) {
    List<int> myList = [
      for (var i = 2; i <= 100; i++)
        if (i % 2 == 0) i
    ];

    // var oldList = [1, 2, 3, 4, 5];
    // var newList = oldList.map((int num) => num * 10).toList();

    // List<Widget> widgets = [];
    //
    // for (var num in numList) {
    //   Widget w = _buildButton(num);
    //   widgets.add(w);
    // }

    // High order function
    //var widgets = numList.map((int num) => _buildButton(num)).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      //children: numList.map((int num) => _buildButton(num)).toList(),
      children: [
        // Collection for
        for (var num in numList) _buildButton(num),
      ],
    );
  }

  Widget _buildButton(int num) {
    String? label;
    // num = 0-9
    List<String> labelList = [
      'ZERO',
      'ONE',
      'TWO',
      'THREE',
      'FOUR',
      'FIVE',
      'SIX',
      'SEVEN',
      'EIGHT',
      'NINE',
    ];

    if (num >= 0 && num <= 9) {
      label = labelList[num];
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            if (_input.length >= inputLength) {
              return;
            }

            if (num == -1) {
              _input = _input.substring(0, _input.length - 1);
            } else if (num == -2) {
              _input = '';
            } else {
              _input += num.toString();
            }

            if (_input.length == password.length) {
              if (_input == password) {
                print('Password is correct!!');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              } else {
                _showError();
                _input = '';
              }
            }
          });
        },
        child: Container(
          width: 60.0, // 160 = 1 inch
          height: 60.0,
          //margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: num >= 0 && num <= 9
                ? Border.all(color: Colors.deepPurple)
                : null,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (num >= 0 && num <= 9)
                  Text(
                    num.toString(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (num >= 0 && num <= 9)
                  Text(label ?? '', style: TextStyle(fontSize: 10.0)),
                if (num == -2) Icon(Icons.close),
                if (num == -1) Icon(Icons.backspace),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showError() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sorry!'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Password is incorrect.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
