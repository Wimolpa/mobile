import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:term_project/pages/homepage.dart';


class ReviewpPage extends StatelessWidget{

  String? title;
  int? price;
  String? description;
  String? images;

  ReviewpPage(String? title, int? price, String? description, String? images) {
    this.title = title;
    this.price = price;
    this.description = description;
    this.images = images;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text(
          'รีวิว',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      images.toString(),
                      width: 150.0,
                      height: 150.0,
                    ),
                  ),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title.toString(),
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 35.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'ราคา: $price USD',
                        style: GoogleFonts.poppins(
                          color: Color(0xFFAEAEAE),
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: Text(
                    'ความคิดเห็น',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
