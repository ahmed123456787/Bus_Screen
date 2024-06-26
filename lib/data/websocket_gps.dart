import 'package:itrans/domain/entities/Position.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import './../constantes/connection.dart';

class WebSocketRepository {
  late WebSocketChannel channel;
  final String serverUrl =
      'ws://localhost:8080/ws'; // Replace with your server's WebSocket URL

  void openConnection(Function(String) onMessageReceived) {
    channel = WebSocketChannel.connect(Uri.parse(serverUrl));

    channel.stream.listen(
      (message) {
        handleMessage(jsonDecode(message)); // transform it to json
      },
      onError: (error) {
        print('WebSocket error: $error');
      },
      onDone: () {
        print('WebSocket connection closed');
      },
    );
  }

  void closeConnection() {
    channel.sink.close();
  }

//

//

  void handleMessage(Map<String, dynamic> message) {
    if (message['type'] == MESSAGE_TYPE_GEOLOCATION) {
      handleGeolocationMessage(message);
    }

    if (message['type'] == MESSAGE_TYPE_DRIVING) {
      handleDrivingMessage(message);
    }
  }

  void handleGeolocationMessage(Map<String, dynamic> message) {
    Map<String, dynamic> content = message['content']; // get the content .
    Map<String, dynamic> pos = content['position'];

    if (current_pos.type == '') {
      Position current_pos = Position(type: pos['type'], name: pos['name']);
    }

    if (pos["type"] == "station") {
      if (current_pos.type == 'station' && current_pos.name == pos['name']) {
        return;
      }

      if (current_pos.type ==
              'interstation' && // before the arriving at a station .
          current_pos.name != pos['name']) {
        // switch to the current (name) ;
      }

      // ougoing from a station
    }

    if (pos["type"] == "interstation") {
      if ((current_pos.type == "station") &&
          (current_pos.name != pos['name'])) {
        // display the interstation .
      }
    }
    current_pos = Position(type: pos['type'], name: pos['name']);
  }

  void handleDrivingMessage(Map<String, dynamic> message) {
    if (message['driving_type'] == "calibrate") {
      // Calibrate station .
    }

    if (message['driving_type'] == "start") {
      // display the start .
    }
    if (message['driving_type'] == "finish") {
      // displat the welcome .
    }
  }
}
