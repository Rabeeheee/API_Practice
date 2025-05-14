import 'package:grocery_app/features/home/domain/entities/store.dart';

class StoreModel extends Store {
  const StoreModel({
    required String id,
    required String name,
    required String imageUrl,
    required String address,
    required double rating,
    required String category,
    required double distance,
    required int timeMinutes,
    String? discount,
    String? itemsAvailable,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          address: address,
          rating: rating,
          category: category,
          distance: distance,
          timeMinutes: timeMinutes,
          discount: discount,
          itemsAvailable: itemsAvailable,
        );

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      address: json['address'],
      rating: (json['rating'] as num).toDouble(),
      category: json['category'] ?? 'General',  // Added with a default value
      distance: (json['distance'] as num).toDouble(),
      timeMinutes: json['timeMinutes'],
      discount: json['discount'],
      itemsAvailable: json['itemsAvailable'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'address': address,
      'rating': rating,
      'category': category,
      'distance': distance,
      'timeMinutes': timeMinutes,
      'discount': discount,
      'itemsAvailable': itemsAvailable,
    };
  }
}