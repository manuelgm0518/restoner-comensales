import 'dart:math';
import 'package:faker/faker.dart';

final _faker = Faker();

class Food {
  int id;
  String name;
  String picture;
  int stock;
  String description;
  double price;

  Food({
    required this.id,
    required this.name,
    required this.picture,
    required this.stock,
    required this.description,
    required this.price,
  });

  Food.random()
      : id = 1,
        name = _faker.food.dish(),
        picture = _faker.image.image(keywords: ['food']),
        stock = Random().nextInt(20),
        description = _faker.lorem.sentence(),
        price = Random().nextInt(200) + Random().nextDouble();

  Food copyWith({
    int? id,
    String? name,
    String? picture,
    int? stock,
    String? description,
    double? price,
  }) {
    return Food(
      id: id ?? this.id,
      name: name ?? this.name,
      picture: picture ?? this.picture,
      stock: stock ?? this.stock,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'picture': picture,
      'stock': stock,
      'description': description,
      'price': price,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      picture: map['picture'] ?? '',
      stock: map['stock'] ?? 0,
      description: map['description'] ?? '',
      price: map['price'] ?? 0.0,
    );
  }

  @override
  String toString() {
    return 'Food(id: $id, name: $name, picture: $picture, stock: $stock, description: $description, price: $price)';
  }
}
