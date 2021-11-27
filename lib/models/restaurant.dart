import 'dart:math';

import 'package:restoner_comensales/models/foodtype.dart';

final _names = [
  'La pizza de Don Cangrejo',
  'Nombre innecesariamente largo para pruebas',
  'McDonald\'s',
  'El kentoki',
];

class Restaurant {
  int id;
  String name;
  List<String> foodTypes;
  String? picture;
  bool opened;
  bool hasDelivery;
  bool hasTakeout;
  bool hasLocalAttendance;

  Restaurant({
    required this.id,
    required this.name,
    required this.foodTypes,
    this.picture,
    required this.opened,
    required this.hasDelivery,
    required this.hasTakeout,
    required this.hasLocalAttendance,
  });

  Restaurant.random()
      : id = 0,
        name = _names[Random().nextInt(_names.length)],
        foodTypes = FoodType.randomTypes(),
        opened = Random().nextBool(),
        hasDelivery = Random().nextBool(),
        hasTakeout = Random().nextBool(),
        hasLocalAttendance = Random().nextBool();

  Restaurant copyWith({
    int? id,
    String? name,
    List<String>? foodTypes,
    String? picture,
    bool? opened,
    bool? hasDelivery,
    bool? hasTakeout,
    bool? hasLocalAttendance,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      foodTypes: foodTypes ?? this.foodTypes,
      picture: picture ?? this.picture,
      opened: opened ?? this.opened,
      hasDelivery: hasDelivery ?? this.hasDelivery,
      hasTakeout: hasTakeout ?? this.hasTakeout,
      hasLocalAttendance: hasLocalAttendance ?? this.hasLocalAttendance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'foodTypes': foodTypes,
      'picture': picture,
      'opened': opened,
      'hasDelivery': hasDelivery,
      'hasTakeout': hasTakeout,
      'hasLocalAttendance': hasLocalAttendance,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'],
      name: map['name'],
      foodTypes: List<String>.from(map['foodTypes']),
      picture: map['picture'],
      opened: map['opened'],
      hasDelivery: map['hasDelivery'],
      hasTakeout: map['hasTakeout'],
      hasLocalAttendance: map['hasLocalAttendance'],
    );
  }

  @override
  String toString() {
    return 'Restaurant(id: $id, name: $name, foodTypes: $foodTypes, picture: $picture, opened: $opened, hasDelivery: $hasDelivery, hasTakeout: $hasTakeout, hasLocalAttendance: $hasLocalAttendance)';
  }
}
