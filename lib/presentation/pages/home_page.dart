import 'package:flutter/material.dart';
import './../../presentation/widgets/bus_info_widget.dart';
import './../../presentation/widgets/time_screen.dart';
import './../../presentation/widgets/gps_data_widget.dart';
import '../../constantes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            children: [
              BusInfoWidget(
                  screenHeight: screenHeight, screenWidth: screenWidth),
              // Other widgets go here...
              const Spacer(),
              TimeScren(),
            ],
          ),
        ),
      ),
    );
  }
}
