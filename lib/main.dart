import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:async';
import 'constantes.dart';
import './info.dart';
import './presentation/widgets/header.dart';
import './data/station_model.dart';

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
              Header(),
              SizedBox(
                width: double.infinity,
                height: screenHeight * 0.65,
                child: Stack(
                  children: [
                    Container(color: containerColor),
                    Container(
                      margin: EdgeInsets.only(
                          left: screenHeight * 0.11 * 0.7 / 2 + 12),
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
                                    left:
                                        screenHeight * 0.11 * 0.7 / 2 + 12 - 5),
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
              ),
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

final List<String> stations = [
  "Downtown",
  "El Fedj Neighborhood",
  "Djenane Zitoune",
  'Constantine University 1',
  "Mentouri",
];

class GpsData extends StatefulWidget {
  @override
  State<GpsData> createState() => GpsState();
}

class GpsState extends State<GpsData> {
  late WebSocketChannel channel;
  String receivedData = '';
  String serverUrl =
      'ws://localhost:8080/ws'; // Replace with your server's WebSocket URL

  @override
  void initState() {
    super.initState();
    _openWebSocketConnection();
    // _sendMessage(2, 2);
  }

  void _openWebSocketConnection() {
    channel = WebSocketChannel.connect(Uri.parse(serverUrl));

    channel.stream.listen(
      (message) {
        setState(() {
          receivedData = message;
          print(receivedData);
        });
      },
      onError: (error) {
        print('WebSocket error: $error');
      },
      onDone: () {
        print('WebSocket connection closed');
      },
    );
  }

  void _closeWebSocketConnection() {
    channel.sink.close();
  }

  // void _reopenWebSocketConnection() {
  //   _closeWebSocketConnection();
  //   _openWebSocketConnection();
  // }

  void _sendMessage(double latitude, double longitude) {
    final data = jsonEncode({
      'latitude': 23,
      'longitude': 00,
    });
    channel.sink.add(data);
  }

  @override
  Widget build(BuildContext context) {
    StreamBuilder(
      stream: channel.stream,
      builder: (context, snapshot) {
        return Text(snapshot.hasData ? '${snapshot.data}' : '');
      },
    );
    return Text("");
  }
}
