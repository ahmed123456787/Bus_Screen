import 'package:flutter/material.dart';



class TaxiIcon extends StatelessWidget {
  const TaxiIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Line above the text
        Container(
          margin: const EdgeInsets.only(
              bottom: 2), // Small space between line and text
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60, // Small width for the line
                height: 4, // Small height for the line
                color: Colors.black,
              ),
            ],
          ),
        ),
        // Text "TAXI"
        const Text(
          'TAXI',
          style: TextStyle(
            fontSize: 25  , // Small font size for the text
            fontWeight: FontWeight.bold,
          ),
        ),
        // Line below the text
        Container(
          margin: const EdgeInsets.only(
              top: 2), // Small space between text and line
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60, // Small width for the line
                height: 4, // Small height for the line
                color: Colors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
