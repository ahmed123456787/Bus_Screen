import 'package:flutter/material.dart';

class Logopage extends StatelessWidget {
  const Logopage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              //color: Colors.red,
              width: screenWidth * 0.5,
              height: screenHeight * 0.5,
              child: Image.asset(
                'images/etusc_image.png',
              ),
            ),
            Container(
              width: screenWidth * 0.25,
              height: screenHeight * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 166, 166, 166),
              ),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double parentWidth = constraints.maxWidth;
                  double textSize = 90;
                  return Center(
                    child: Text(
                      "PTrans",
                      style: TextStyle(
                          fontSize: textSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
