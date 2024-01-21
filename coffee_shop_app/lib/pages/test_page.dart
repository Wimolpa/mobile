import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestPage extends StatelessWidget{
  const TestPage({super.key});
  Widget buildItem(IconData icon,String label){
      return Column(
            children: [
              Icon(icon,color: Colors.pink,),
              Text(label,style: GoogleFonts.notoSansThai(color: Colors.pink,
              fontSize:20.0)),
            ],
          );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildItem(Icons.phone,"โทร"),
            buildItem(Icons.route,"เส้นทาง"),
            buildItem(Icons.share,"แชร์"),
            buildItem(Icons.person,"ฉัน"),
            ],
        ),
      ),
    );
  }
}