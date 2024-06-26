import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../data/station_service.dart';


import '../../constantes/constantes.dart';


final List<String> initialStations = [
  "Downtown",
  "El Fedj Neighborhood",
  "Djenane Zitoune",
  'Constantine University 1',
  "Mentouri",
  "Zarzara",
  "Zouaghi slimane",
  "Sonatiba Neighborhood",
  "Zenith",
  "Airport - Old terminal",
  "Airport - New terminal"
];

int findStationIndex(String stationName) {
  for (int i = 0; i < initialStations.length; i++) {
    if (initialStations[i] == stationName) {
      return i;
    }
  }
  return -1; // Return -1 if stationName is not found
}

class Body extends StatefulWidget {
  final ScrollController scrollController;
  final PageStorageKey storageKey;
  const Body(
      {required this.scrollController, required this.storageKey, super.key});
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  final FocusNode _focusNode = FocusNode();

  List<String> stations = List.from(initialStations);
  // a regler
  final Color _colorarrive = const Color.fromARGB(255, 0, 0, 0);
  final Color _colornext = const Color.fromARGB(255, 255, 145, 0);
  final Color _colorcircle = const Color.fromARGB(255, 255, 255, 255);

  int _currentStationIndex = 0;

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
    _currentStationIndex = PageStorage.of(context)
            .readState(context, identifier: widget.storageKey) as int? ??
        0;
    handleinitialstation();
  }

  void handleinitialstation() async {
    print('Starting to fetch stations');
    StationService s = StationService();
    try {
      List<String> fetchedStations = [];
      print('Fetched stations: $fetchedStations');
      setState(() {
        print('The initial station is:');
        print(initialStations);
        stations = List.from(initialStations);
      });
    } catch (e) {
      print('Error fetching stations: $e');
    }
  }

  void scrollinterstation(String station) {
    int index = findStationIndex(station);
    //print('INDEX $station');
    if (index != -1) {
      setState(() {
        _currentStationIndex = index - 1;
      });
      double screenHeight = MediaQuery.of(context).size.height;
      double itemHeight =
          screenHeight * 0.2; // Ajuster en fonction de votre design

      widget.scrollController.animateTo(
        itemHeight * index,
        duration: const Duration(milliseconds: 3000),
        curve: Curves.easeInOut,
      );
    } else {
      //print('Station "$station" not found');
    }
  }

  void initscroll() {
    setState(() {
      final double screenHeight = MediaQuery.sizeOf(context).height;
      double itemHeight = screenHeight * 0.2; // Height of each item in the list
      if (widget.scrollController.hasClients) {
        widget.scrollController.animateTo(
          widget.scrollController.position.pixels + itemHeight,
          duration: const Duration(milliseconds: 3000),
          curve: Curves.easeInOut,
        );
      }
      PageStorage.of(context).writeState(context, _currentStationIndex,
          identifier: widget.storageKey);
    });
  }

  void scrollToNextStation() {
    setState(() {
      final double screenHeight = MediaQuery.sizeOf(context).height;
      double itemHeight = screenHeight * 0.2; // Height of each item in the list
      if (widget.scrollController.hasClients) {
        widget.scrollController.animateTo(
          widget.scrollController.position.pixels + itemHeight,
          duration: const Duration(milliseconds: 3000),
          curve: Curves.easeInOut,
        );
      }
      _currentStationIndex++;
      if (_currentStationIndex >= stations.length) {
        _currentStationIndex = 0;
      }
      PageStorage.of(context).writeState(context, _currentStationIndex,
          identifier: widget.storageKey);
    });
  }

  String getCurrentStationName() {
    return stations[_currentStationIndex + 1];
  }

  void setCurrentStation(String name) {
    // not  necessary now
  }
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (RawKeyEvent event) {
        if (event.logicalKey == LogicalKeyboardKey.keyN) {
          scrollToNextStation();
        }
        if (event.logicalKey == LogicalKeyboardKey.keyB) {
          // Implement scroll to previous station if needed
        }
      },
      child: SizedBox(
        width: double.infinity,
        height: screenHeight * 0.65,
        child: Stack(
          children: [
            Container(color: containerColor),
            Container(
              margin: EdgeInsets.only(left: screenHeight * 0.11 * 0.7 / 2 + 19),
              width: 30,
              color: ligneColor,
            ),
            ListView.builder(
              controller: widget.scrollController,
              itemCount: stations.length,
              itemBuilder: (context, index) {
                Color circleColor;
                if (index < _currentStationIndex) {
                  circleColor =
                      _colorarrive; // Passed stations and current station color
                } else if (index == _currentStationIndex) {
                  circleColor = _colorarrive; // Current station color
                } else if (index == _currentStationIndex + 1) {
                  circleColor = _colornext; // Next station color
                } else {
                  circleColor = Colors.white; // Remaining stations color
                }

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 40.0,
                        height: 40.0,
                        margin: EdgeInsets.only(
                            left: screenHeight * 0.11 * 0.7 / 2 + 19 - 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: circleColor,
                          border: Border.all(
                            color: textColor,
                            width: 4.0, // Adjust border width as needed
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Text(
                          stations[index],
                          style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                              fontFamily: 'Arial'),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
