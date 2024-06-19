import 'package:flutter/material.dart';
import 'package:itrans/presentation/widgets/footer.dart';
import 'package:itrans/presentation/widgets/header.dart';
import 'package:itrans/presentation/widgets/sectioncurrentstation.dart';

class Currentstationpage extends StatelessWidget {
  const Currentstationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return (const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Header(),
            Sectioncurrentstation(CurrentStation: 'Zouaghi Slimane'),
            Footer()
          ],
        ),
      ),
    ));
  }
}
