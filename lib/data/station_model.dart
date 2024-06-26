import 'dart:convert';import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constantes/constantes.dart';

class StationModel {
  Future<void> fetchStations(String direction, String station_language) async {
    direction = "going";
    List<dynamic> dataList = List.empty(); // To inialize the list .

    try {
      String url = "http://localhost:3000/$direction";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        dataList = data["data"];
        lineNumber = data['data'][0]['line']; // To get the line number .

        for (var item in dataList) {
          String nameAR = item[station_language];
          nameARList.add(nameAR);
        }
      }
    } catch (err) {
      print('Error fetching data: $err');
    }
  }
}
