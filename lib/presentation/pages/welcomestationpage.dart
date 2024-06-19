import 'package:flutter/material.dart';
import 'package:itrans/presentation/widgets/footer.dart';
import 'package:itrans/presentation/widgets/header.dart';
import 'package:itrans/presentation/widgets/sectioncurrentstation.dart';
import 'package:itrans/presentation/widgets/sectionwelcome.dart';

class Welcomestationpage extends StatelessWidget {
  const Welcomestationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return (const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Header(),
            Sectionwelcomestation(
                FirstStation: "FirstStation", LastStation: "LastStation"),
            Footer()
          ],
        ),
      ),
    ));
  }
}
