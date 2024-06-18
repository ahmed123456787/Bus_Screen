import 'package:flutter/material.dart';

class BusInfoWidget extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;

  const BusInfoWidget({required this.screenHeight, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: screenHeight * 0.13,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Your bus info UI code here
        ],
      ),
    );
  }
}
