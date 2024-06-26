import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'models.dart'; // Import your model classes

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE stations (
    id INTEGER PRIMARY KEY,
    nameAR TEXT,
    nameEN TEXT,
    nameFR TEXT
  )
''');

    await db.execute('''
  CREATE TABLE lines (
    id INTEGER PRIMARY KEY,
    code TEXT,
    color INTEGER,
    lineType INTEGER,
    departureStationId INTEGER,
    terminusStationId INTEGER,
    FOREIGN KEY (departureStationId) REFERENCES stations(id),
    FOREIGN KEY (terminusStationId) REFERENCES stations(id)
  )
''');

    await db.execute('''
  CREATE TABLE lineStations (
    id INTEGER PRIMARY KEY,
    lineId INTEGER,
    stationId INTEGER,
    `order` INTEGER,
    direction TEXT,
    FOREIGN KEY (lineId) REFERENCES lines(id),
    FOREIGN KEY (stationId) REFERENCES stations(id)
  )
''');
  }

  Future<void> insertLine(Line line) async {
    final db = await database;
    await db.insert('lines', {
      'id': line.id,
      'code': line.code,
      'color': line.color,
      'lineType': line.lineType,
      'departureStationId': line.departureStation.id,
      'terminusStationId': line.terminusStation.id,
    });
  }

  Future<void> insertStation(Station station) async {
    final db = await database;
    await db.insert('stations', {
      'id': station.id,
      'nameAR': station.nameAR,
      'nameEN': station.nameEN,
      'nameFR': station.nameFR,
    });
  }

  Future<void> insertLineStation(LineStation lineStation, int lineId) async {
    final db = await database;
    await db.insert('lineStations', {
      'id': lineStation.id,
      'lineId': lineId,
      'stationId': lineStation.station.id,
      'order': lineStation.order,
      'direction': lineStation.direction,
    });
  }
}
