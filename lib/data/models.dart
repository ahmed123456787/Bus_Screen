class Line {
  final int id;
  final String code;
  final int color;
  final int lineType;
  final Station departureStation;
  final Station terminusStation;
  final List<LineStation> lineStations;

  Line({
    required this.id,
    required this.code,
    required this.color,
    required this.lineType,
    required this.departureStation,
    required this.terminusStation,
    required this.lineStations,
  });

  factory Line.fromJson(Map<String, dynamic> json) {
    return Line(
      id: json['id'],
      code: json['code'],
      color: json['color'],
      lineType: json['lineType'],
      departureStation: Station.fromJson(json['departureStation']),
      terminusStation: Station.fromJson(json['terminusStation']),
      lineStations: (json['lineStations'] as List)
          .map((stationJson) => LineStation.fromJson(stationJson))
          .toList(),
    );
  }
}

class Station {
  final int id;
  final String nameAR;
  final String nameEN;
  final String nameFR;

  Station({
    required this.id,
    required this.nameAR,
    required this.nameEN,
    required this.nameFR,
  });

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      id: json['id'],
      nameAR: json['nameAR'],
      nameEN: json['nameEN'],
      nameFR: json['nameFR'],
    );
  }
}

class LineStation {
  final int id;
  final int order;
  final String direction;
  final Station station;

  LineStation({
    required this.id,
    required this.order,
    required this.direction,
    required this.station,
  });

  factory LineStation.fromJson(Map<String, dynamic> json) {
    return LineStation(
      id: json['id'],
      order: json['order'],
      direction: json['direction'],
      station: Station.fromJson(json['station']),
    );
  }
}
