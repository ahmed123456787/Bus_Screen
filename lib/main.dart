import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:async';
import 'constantes.dart';
import './info.dart';
import './presentation/widgets/header.dart';
import './presentation/widgets/body.dart';
import 'package:audioplayers/audioplayers.dart';

Future<void> main() async {
  // await StationModel().fetchStations("going", "nameEN");
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            children: [
              const Header(),
             
              Container(
                width: double.infinity,
                height: screenHeight * 0.18,
                padding: const EdgeInsets.only(left: 90),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: screenHeight * 0.04,
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                double parentHeight = constraints.maxHeight;
                                double textSize = parentHeight * .9;
                                return Text(
                                  "Estimated Arrivals: ",
                                  style: TextStyle(
                                    fontSize: textSize,
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            height: screenHeight * 0.06,
                            width: screenWidth * 0.28,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            color:
                                containerColor, // Replace with  containerColor
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                double parentWidth = constraints.maxWidth;
                                return Row(
                                  children: [
                                    Expanded(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          Info.next_station_1,
                                          style: TextStyle(
                                            fontSize: parentWidth * 0.09,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          Info.estimate_next_station1,
                                          style: TextStyle(
                                            fontSize: parentWidth * 0.09,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: screenHeight * 0.06,
                            width: screenWidth * .28,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            alignment: Alignment.topLeft,
                            color:
                                containerColor, // Replace with  containerColor
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                double parentWidth = constraints.maxWidth;
                                double textSize = parentWidth * .09;
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          Info.next_station_2,
                                          style: TextStyle(
                                            fontSize: parentWidth * 0.09,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Container(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            Info.estimate_next_station2,
                                            style: TextStyle(
                                              fontSize: parentWidth * 0.09,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: screenWidth * 0.06, // Adjust the width as needed
                      height: screenHeight * 0.2,
                      child: Image.asset(
                        'images/etusc_image.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
