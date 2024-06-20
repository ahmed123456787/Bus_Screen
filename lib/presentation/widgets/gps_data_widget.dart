import 'package:flutter/material.dart';
import './../../data/websocket_gps.dart';

class GpsDataWidget extends StatefulWidget {
  const GpsDataWidget({super.key});

  @override
  State<GpsDataWidget> createState() => GpsDataState();
}

class GpsDataState extends State<GpsDataWidget> {
  late WebSocketRepository webSocketRepository;
  String receivedData = '';

  @override
  void initState() {
    super.initState();
    webSocketRepository = WebSocketRepository();
    webSocketRepository.openConnection((message) {
      setState(() {
        receivedData = message;
      });
    });
  }

  @override
  void dispose() {
    webSocketRepository.closeConnection();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(receivedData.isNotEmpty ? receivedData : 'No data received');
  }
}
