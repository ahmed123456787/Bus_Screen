import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            'etusc_image.png',
            width: MediaQuery.of(context).size.width * 0.125,
            height: MediaQuery.of(context).size.height * 0.125,
          )
        ],
      ),
    );
  }
}
