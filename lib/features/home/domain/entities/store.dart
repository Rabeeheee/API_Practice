import 'package:equatable/equatable.dart';

class Store extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String address;
  final double rating;
  final String category;
  final double distance;
  final int timeMinutes;
  final String? discount;
  final String? itemsAvailable;

  const Store({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.rating,
    required this.category,
    required this.distance,
    required this.timeMinutes,
    this.discount,
    this.itemsAvailable,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        address,
        rating,
        category,
        distance,
        timeMinutes,
        discount,
        itemsAvailable,
      ];
}