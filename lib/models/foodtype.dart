import 'dart:math';

class FoodType {
  String id;
  String name;
  String picture;

  static final types = ['Pizzería', 'Vegetariano', 'Vegano', 'Shawarma', 'Pastelería', 'Criollo', 'Desayuno', 'Marino'];

  static List<String> randomTypes() {
    final list = <String>[];
    for (final type in types) {
      if (Random().nextBool()) {
        list.add(type);
      }
    }
    return list;
  }

  FoodType({
    required this.id,
    required this.name,
    required this.picture,
  });

  FoodType copyWith({
    String? id,
    String? name,
    String? picture,
  }) {
    return FoodType(
      id: id ?? this.id,
      name: name ?? this.name,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'picture': picture,
    };
  }

  factory FoodType.fromMap(Map<String, dynamic> map) {
    return FoodType(
      id: map['id'],
      name: map['name'],
      picture: map['picture'],
    );
  }

  @override
  String toString() => 'FoodType(id: $id, name: $name, picture: $picture)';
}
