import 'package:grocery_app/features/home/domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required String id,
    required String name,
    required String icon,
    required String color,
  }) : super(
          id: id,
          name: name,
          icon: icon,
          color: color,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      color: json['color'] ?? '#FF9800',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'color': color,
    };
  }
}
