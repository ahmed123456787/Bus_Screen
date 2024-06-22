import 'package:flutter/material.dart';
import 'package:itrans/presentation/widgets/footer.dart';
import 'package:itrans/presentation/widgets/header.dart';
import 'package:itrans/presentation/widgets/section_current_station.dart';

class Currentstationpage extends StatelessWidget {
  const Currentstationpage({super.key, required this.current_station});
  final String current_station;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Header(),
            Sectioncurrentstation(CurrentStation: current_station),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
