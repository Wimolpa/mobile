import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorstate();
}

class _calculatorstate extends State<calculator> {
  // state variables
  String _number = "0";
  String r_number = "";
  String start = "0";
  int c = 0;

  Widget buildItem({
    required String number, //optional
    Color color = Colors.black,
    required name,
    IconData? icon,
  }) {
    if (name.length == 2) {
      return Container(
          margin: EdgeInsets.only(right: 10.0, left: 10.0),
          child: InkWell(
            onTap: () {
              setState(() {
                if (number == "-2") {
                  r_number = r_number.substring(0, r_number.length - 1);
                  _number = r_number;
                }
              });
            },
            child: Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.grey[350],
              ),
              child: Icon(icon),
            ),
          ));
    } else if (name.length == 1) {
      return Container(
        margin: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            setState(() {
              //_text = Random().nextInt(100).toString();
              if (number == "C" || number == "\u003D") {
                _number = "0";
                r_number = "";
              } else if (number == "\u00F7") {
                if (c == 2) {
                  r_number = r_number.substring(0, r_number.length - 1);
                  _number = r_number;
                  c = 0;
                } else {
                  r_number += "\u00F7";
                  _number = r_number;
                }
                c++;
              } else if (number == "\u00D7") {
                c++;
                if (c == 2) {
                  r_number = r_number.substring(0, r_number.length - 1);
                  _number = r_number;
                  c = 0;
                } else {
                  r_number += "\u00D7";
                  _number = r_number;
                }
                c++;
              } else if (number == "\u2212") {
                
                if (c ==2) {
                  r_number = r_number.substring(0, r_number.length - 1);
                  _number = r_number;
                  c = 0;
                } else {
                  r_number += "\u2212";
                  _number = r_number;
                }
                c++;
              } else if (number == "\u002B") {
              
                if (c==2) {
                  r_number = r_number.substring(0, r_number.length - 1);
                  _number = r_number;
                  c = 0;
                } else {
                  r_number += "\u002B";
                  _number = r_number;
                }c++;
              }
            });
          },
          child: Container(
            width: 50.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.grey[350],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  number,
                  style: GoogleFonts.notoSansThai(
                    color: color,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else if (name.length == 7) {
      return Container(
        margin: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            setState(
              () {
                //_text = Random().nextInt(100).toString();
                if (number == "C" || number == "\u003D") {
                  _number = "0";
                  r_number = "";
                }
              },
            );
          },
          child: Container(
            width: 500.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.red[400],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  number,
                  style: GoogleFonts.notoSansThai(
                    color: color,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            setState(() {
              //_text = Random().nextInt(100).toString();
              r_number += number;
              _number = r_number;
            });
          },
          child: Container(
            width: 120.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.red[100],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  number,
                  style: GoogleFonts.notoSansThai(
                    color: color,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  // Widget buildTextWithBackground({
  @override
  Widget build(BuildContext context) {
    var itemList1 = [
      buildItem(number: "C", name: "1"),
      buildItem(icon: Icons.backspace_outlined, name: "-2", number: "-2"),
    ];
    var itemList2 = [
      buildItem(number: "7", name: "seven"),
      buildItem(number: "8", name: "eight"),
      buildItem(number: "9", name: "nine"),
      buildItem(number: "\u00F7", name: "3"),
    ];
    var itemList3 = [
      buildItem(number: "4", name: "four"),
      buildItem(number: "5", name: "five"),
      buildItem(number: "6", name: "six"),
      buildItem(number: "\u00D7", name: "4"),
    ];
    var itemList4 = [
      buildItem(number: "1", name: "one"),
      buildItem(number: "2", name: "two"),
      buildItem(number: "3", name: "three"),
      buildItem(number: "\u2212", name: "5"),
    ];
    var itemList5 = [
      buildItem(number: "0", name: "zero"),
      buildItem(number: "\u002B", name: "6"),
    ];
    var itemList6 = [
      buildItem(number: "\u003D", name: "1111111"),
    ];

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 16.0),
        margin: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment : MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    _number,
                    style: GoogleFonts.kanit(fontSize: 40.0),
                    selectionColor: Colors.blue,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    color: Colors.blue,
                  ),
                  Row(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: itemList1),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: itemList2),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: itemList3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: itemList4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: itemList5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: itemList6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}