import 'package:grocery_app/features/home/domain/entities/promotion.dart';

class PromotionModel extends Promotion {
  const PromotionModel({
    required String id,
    required String title,
    required String description,
    required String imageUrl,
    required String buttonText,
    required String discountText,
    
  }) : super(
          id: id,
          title: title,
          description: description,
          imageUrl: imageUrl,
          buttonText: buttonText,
          discountText: discountText,
        );

  factory PromotionModel.fromJson(Map<String, dynamic> json) {
    return PromotionModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      buttonText: json['buttonText'] ?? 'CHECK NOW',
      discountText: json['discountText'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'buttonText': buttonText,
      'discountText': discountText,
    };
  }
}
