import 'package:flutter/material.dart';
import 'package:itrans/main.dart';
import './time_screen.dart';
import '../../constantes/constantes.dart';
import './../../domain/entities/info.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: double.infinity,
      height: screenHeight * 0.13,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: screenHeight * 0.11,
                    width: screenHeight * 0.11,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: busColor, width: 5.0),
                    ),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        double parentWidth = constraints.maxWidth;
                        double textSize = parentWidth * 0.7;
                        return Center(
                          child: Text(
                            "B",
                            style: TextStyle(
                                fontSize: textSize,
                                color: textColor,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            height: screenHeight * 0.11,
            width: screenHeight * 0.11,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ligneColor,
            ),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double parentWidth = constraints.maxWidth;
                double textSize = parentWidth * 0.7;
                return Center(
                  child: Text(
                    lineNumber.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: textSize,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
          Container(
            height: screenHeight * 0.11,
            width: screenWidth * 0.6,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double screenHeight = constraints.maxHeight;
                double textSize = screenHeight * 0.75;
                return Text(
                  Info.directionName,
                  style: TextStyle(
                      color: textColor,
                      fontSize: textSize,
                      fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
          const Spacer(),
          Container(
            width: screenWidth * 0.1,
            height: screenHeight * 0.09,
            // padding: const EdgeInsets.only(left: 5, right: 5),
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: const Center(
              child: TimeScren(),
            ),
          )
        ],
      ),
    );
  }
}
