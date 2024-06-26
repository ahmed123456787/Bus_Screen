import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:itrans/data/remplirdb.dart';
import 'models.dart'; // Import your model classes
import 'dart:ui' ;

class StationService {
  final String URL = "http://41.111.178.14:8080/infra/line/2";

  Future<Line> fetchLineData() async {
    try {
      final response = await http.get(Uri.parse(URL));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return Line.fromJson(jsonData);
      } else {
        throw Exception('Failed to load line data');
      }
    } catch (e) {
      throw Exception('Failed to load line data: $e');
    }
  }
}

Future<void> main() async {
  final stationService = StationService();

  try {

    final Line lineData = await stationService.fetchLineData();
    await insertLineDataIntoDatabase(lineData);
    print('Data inserted successfully');
    
  } catch (e) {
    print('Failed to insert data: $e');
  }
}
