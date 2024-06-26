import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import 'package:web_socket_channel/io.dart';

class WebSocketRepository {
  late WebSocketChannel channel;
  final String serverUrl =
      'ws://localhost:9999/ws'; // Replace with your server's WebSocket URL

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
     channel.sink.add(jsonEncode({
      "sender": "Display",
      "token": "Display",
      "type": "login",
      "timestamp": DateTime.now().millisecondsSinceEpoch,
      "content": {
        "location": {"": ""},
        "position": {"": "", "": ""}
      }
    }));
    print('Message sent');
  }

  void closeConnection() {
    channel.sink.close();
  }

  void sendMessage(String station, double name) {
    final data = jsonEncode({
      "sender": "Display",
      "token": "XXXXXXX",
      "type": "driving",
      "timestamp": "XXXXXXX",
      "content": {
        "type": "display",
        "position": {"type": station, "name": "$name"}
      }
    });
    channel.sink.add(data);
  }
}
/*
void main() async {
  // Remplacez par l'URL WebSocket de votre serveur
  const String serverUrl = 'ws://localhost:3000/ws';

  // Créez une instance de WebSocketRepository
  final WebSocketRepository webSocketRepository = WebSocketRepository();

  // Ouvrez une connexion WebSocket et écoutez les messages reçus
  webSocketRepository.openConnection((message) {
    print('Received message: $message');
    final data=jsonDecode(message);
    if(data['content']['position']['type']=='station'){
        //afficher directement la station courant

    }else if(data['content']['position']['type']=='interstation'){

            // afficher next station  
    }
  });

  // Exemple d'envoi de messages
  webSocketRepository.sendMessage('Station1', 123.45);
  await Future.delayed(const Duration(
      seconds: 2)); // Attendre un peu avant d'envoyer le prochain message
  webSocketRepository.sendMessage('Station2', 678.90);

  // Attendre un peu avant de fermer la connexion
  await Future.delayed(const Duration(seconds: 5));
  webSocketRepository.closeConnection();
}
*/