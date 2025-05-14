import 'package:equatable/equatable.dart';

class Promotion extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String buttonText;
  final String discountText;
  

  const Promotion({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.buttonText,
    required this.discountText,
  });

  @override
  List<Object?> get props => [id, title, description, imageUrl, buttonText, discountText];
}
