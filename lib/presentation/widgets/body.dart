import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        final double screenHeight = MediaQuery.sizeOf(context).height;
        double itemHeight =
            screenHeight * 0.217; // Height of each item in the list
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
    });
    //_currentStationIndex = 0;
  }

  void scrollToNextStation() {
    setState(() {
      final double screenHeight = MediaQuery.sizeOf(context).height;
      double itemHeight =
          screenHeight * 0.217; // Height of each item in the list
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
              margin: EdgeInsets.only(left: screenHeight * 0.11 * 0.7 / 2 + 12),
              width: 20,
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
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 30.0,
                        height: 30.0,
                        margin: EdgeInsets.only(
                            left: screenHeight * 0.11 * 0.7 / 2 + 12 - 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: circleColor,
                          border: Border.all(
                            color: textColor,
                            width: 2.0, // Adjust border width as needed
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Text(
                          stations[index],
                          style: TextStyle(
                              fontSize: screenWidth * 0.038,
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
