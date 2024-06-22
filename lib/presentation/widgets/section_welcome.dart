import 'package:flutter/material.dart';
import 'package:itrans/constantes.dart';

class Sectionwelcomestation extends StatelessWidget {
  const Sectionwelcomestation(
      {super.key, required this.FirstStation, required this.LastStation});
  final String FirstStation;
  final String LastStation;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.65,
      color: const Color(0x1Abfa000),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: screenHeight * 0.11 * 0.7 / 2 + 12),
                width: 20,
                color: ligneColor,
              ),
              Container(
                width: 30.0,
                height: 30.0,
                margin: EdgeInsets.only(
                    left: screenHeight * 0.11 * 0.7 / 2 + 12 - 5,
                    top: screenHeight * 0.1),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: textColor,
                    width: 2.0, // Adjust border width as needed
                  ),
                ),
              ),
              Container(
                width: 30.0,
                height: 30.0,
                margin: EdgeInsets.only(
                    left: screenHeight * 0.11 * 0.7 / 2 + 12 - 5,
                    top: screenHeight * 0.5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: textColor,
                    width: 2.0, // Adjust border width as needed
                  ),
                ),
              ),
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.02,
                top: MediaQuery.of(context).size.height * 0.05,
              ),
              width: MediaQuery.of(context).size.width * 0.65,
              height: MediaQuery.of(context).size.height * 0.15,
              //color: Colors.red,
              //margin: const EdgeInsets.only(left: 10),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double containerHeight = constraints.maxHeight;
                  double containerWidth = constraints.maxWidth;

                  // Calculate the text size based on container dimensions
                  double textSize = screenWidth * 0.038;

                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      FirstStation,
                      style: TextStyle(
                        fontSize: textSize,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.02,
                top: MediaQuery.of(context).size.height * 0.25,
              ),
              width: MediaQuery.of(context).size.width * 0.65,
              height: MediaQuery.of(context).size.height * 0.15,
              //color: Colors.red,
              //margin: const EdgeInsets.only(left: 10),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double containerHeight = constraints.maxHeight;
                  double containerWidth = constraints.maxWidth;

                  // Calculate the text size based on
                  double textSize = screenWidth * 0.038;

                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      LastStation,
                      style: TextStyle(
                        fontSize: textSize,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            )
          ]),
        ],
      ),
    );

    /*Row(
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              color: const Color.fromRGBO(253, 228, 242, 7),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * (1 / 32) + 10,
              child: Container(
                width: 20,
                height: (MediaQuery.of(context).size.height * 0.6),
                color: Colors.red,
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.05,
              top: MediaQuery.of(context).size.width * 0.05,
              child: Container(
                width: 20.0,
                height: 20.0,
                // margin: const EdgeInsets.only(right: 100, top: 20),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.1,
              top: MediaQuery.of(context).size.width * 0.02,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.10,
                //color: Colors.red,
                alignment: Alignment.centerLeft,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    double containerHeight = constraints.maxHeight;
                    double containerWidth = constraints.maxWidth;

                    // Calculate the text size based on container dimensions
                    double textSize = containerHeight * 0.8;

                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        CurrentStation,
                        style: TextStyle(
                          fontSize: textSize,
                          color: const Color.fromRGBO(4, 102, 200, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
                //margin: const EdgeInsets.only(right: 100, top: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                      top: MediaQuery.of(context).size.height * 0.20),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //color: Color.fromARGB(255, 201, 237, 0),
                      border: Border.all(
                        color: const Color.fromRGBO(4, 102, 200, 1),
                        width: 4.0, // Adjust border width as needed
                      ),
                    ),
                    child: Center(
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          double containerHeight = constraints.maxHeight;
                          double containerWidth = constraints.maxWidth;

                          // Calculate the text size based on container dimensions
                          double textSize = containerHeight * 0.5;

                          return Center(
                            child: Text(
                              'B',
                              style: TextStyle(
                                fontSize: textSize,
                                color: const Color.fromRGBO(4, 102, 200, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.height * 0.20,
                  ),
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                  ),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double containerHeight = constraints.maxHeight;
                      double containerWidth = constraints.maxWidth;

                      // Calculate the text size based on container dimensions
                      double textSize = containerHeight * 0.5;

                      return Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                            fontSize: textSize,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05,
                    top: MediaQuery.of(context).size.height * 0.20,
                  ),
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 49, 123, 147),
                  ),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double containerHeight = constraints.maxHeight;
                      double containerWidth = constraints.maxWidth;

                      // Calculate the text size based on container dimensions
                      double textSize = containerHeight * 0.5;

                      return Center(
                        child: Text(
                          '5',
                          style: TextStyle(
                            fontSize: textSize,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                      top: MediaQuery.of(context).size.height * 0.35),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //color: Color.fromARGB(255, 201, 237, 0),
                      border: Border.all(
                        color: Colors.green,
                        width: 4.0, // Adjust border width as needed
                      ),
                    ),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        double containerHeight = constraints.maxHeight;
                        double containerWidth = constraints.maxWidth;

                        // Calculate the text size based on container dimensions
                        double textSize = containerHeight * 0.5;

                        return Center(
                          child: Text(
                            'T',
                            style: TextStyle(
                              fontSize: textSize,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.35),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 158, 71, 187),
                      border: Border.all(
                        color: const Color.fromARGB(255, 158, 71, 187),
                        width: 4.0, // Adjust border width as needed
                      ),
                    ),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        double containerHeight = constraints.maxHeight;
                        double containerWidth = constraints.maxWidth;

                        // Calculate the text size based on container dimensions
                        double textSize = containerHeight * 0.5;

                        return Center(
                          child: Text(
                            '3',
                            style: TextStyle(
                              fontSize: textSize,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.35),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 209, 97, 97),
                      border: Border.all(
                        color: const Color.fromARGB(255, 209, 97, 97),
                        width: 4.0, // Adjust border width as needed
                      ),
                    ),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        double containerHeight = constraints.maxHeight;
                        double containerWidth = constraints.maxWidth;

                        // Calculate the text size based on container dimensions
                        double textSize = containerHeight * 0.5;

                        return Center(
                          child: Text(
                            '6',
                            style: TextStyle(
                              fontSize: textSize,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1,
                      top: MediaQuery.of(context).size.height * 0.50),
                  child: const TaxiIcon(),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.50),
                  width: 150,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromARGB(255, 83, 131, 168),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double containerHeight = constraints.maxHeight;
                      double containerWidth = constraints.maxWidth;

                      // Calculate the text size based on container dimensions
                      double textSize = containerHeight * 0.5;

                      return Center(
                        child: Text(
                          'Elkhroub',
                          style: TextStyle(
                            fontSize: textSize,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.50),
                  width: 150,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromARGB(255, 255, 128, 217),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      double containerHeight = constraints.maxHeight;
                      double containerWidth = constraints.maxWidth;

                      // Calculate the text size based on container dimensions
                      double textSize = containerHeight * 0.5;

                      return Center(
                        child: Text(
                          'Boussouf',
                          style: TextStyle(
                            fontSize: textSize,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            )
          ],
        )
      ],
    );*/
  }
}
