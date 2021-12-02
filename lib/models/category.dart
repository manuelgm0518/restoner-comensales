import 'package:faker/faker.dart';

final _faker = Faker();

class Category {
  String name;
  String picture;
  Category({
    required this.name,
    required this.picture,
  });

  Category.random()
      : name = _faker.food.cuisine(),
        picture = _faker.image.image(keywords: ['food', 'dish']);

  Category copyWith({
    String? name,
    String? picture,
  }) {
    return Category(
      name: name ?? this.name,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'picture': picture,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'],
      picture: map['picture'],
    );
  }

  @override
  String toString() => 'Category(name: $name, picture: $picture)';
}
