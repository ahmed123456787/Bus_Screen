import 'package:flutter/material.dart';
import './../../constantes.dart';

final List<String> stations = [
  "Downtown",
  "El Fedj Neighborhood",
  "Djenane Zitoune",
  'Constantine University 1',
  "Mentouri",
];

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: double.infinity,
      height: screenHeight * 0.65,
      child: Stack(
        children: [
          Container(color: containerColor),
          Container(
            margin: EdgeInsets.only(left: screenHeight * 0.11 * 0.7 / 2 + 12),
            width: 20,
            color: ligneColor,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; i <= 3; i++) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 30.0,
                      height: 30.0,
                      margin: EdgeInsets.only(
                          left: screenHeight * 0.11 * 0.7 / 2 + 12 - 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: textColor,
                          width: 2.0, // Adjust border width as needed
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Text(
                        stations[i],
                        style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                            fontFamily: 'Arial'),
                      ),
                    )
                  ],
                )
              ]
            ],
          ),
        ],
      ),
    );
  }
}
