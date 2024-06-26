import 'station_service.dart';

import 'database.dart';
import 'models.dart';

Future<void> insertLineDataIntoDatabase(Line line) async {
  final dbHelper = DatabaseHelper();

  // Insérer la ligne
  await dbHelper.insertLine(line);

  // Insérer les stations de départ et de terminus
  await dbHelper.insertStation(line.departureStation);
  await dbHelper.insertStation(line.terminusStation);

  // Insérer les stations intermédiaires
  for (var lineStation in line.lineStations) {
    await dbHelper.insertStation(lineStation.station);
    await dbHelper.insertLineStation(lineStation, line.id);
  }
}

Future<void> main() async {
  final stationService = StationService();

  final Line lineData = await stationService.fetchLineData();
  await insertLineDataIntoDatabase(lineData);
  print('Data inserted successfully');

  print('Failed to insert data: ');
}
