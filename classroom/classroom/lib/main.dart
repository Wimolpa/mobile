import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildRow([1, 2, 3]),
          _buildRow([4, 5, 6]),
          _buildRow([7, 8, 9]),
        ],
      ),
    );
  }

  Expanded _buildRow(List<int> numList) {
    List<Widget> widgets = [];

    numList.map((num) {
      Widget w = _buildButton(num);
      widgets.add(w);
    }).toList();

    // for (var num in numList) {
    //   Widget w = _buildButton(num);
    //   widgets.add(w);
    // }

    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widgets,
      ),
    );
  }

  Widget _buildButton(int num) {
    // array of string for text
    List<String> textList = [
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

    return Expanded(
      child: Container(
        width: 60.0, // 160 = 1 inch
        height: 60.0,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurple),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(num.toString()),
              Text(textList[num]),
            ],
          ),
        ),
      ),
    );
  }
}
