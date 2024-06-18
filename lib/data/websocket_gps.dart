import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

class WebSocketRepository {
  late WebSocketChannel channel;
  final String serverUrl =
      'ws://localhost:8080/ws'; // Replace with your server's WebSocket URL

  void openConnection(Function(String) onMessageReceived) {
    channel = WebSocketChannel.connect(Uri.parse(serverUrl));

    channel.stream.listen(
      (message) {
        onMessageReceived(message);
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

  void sendMessage(double latitude, double longitude) {
    final data = jsonEncode({
      'latitude': latitude,
      'longitude': longitude,
    });
    channel.sink.add(data);
  }
}
