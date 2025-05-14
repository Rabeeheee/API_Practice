import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/domain/entities/category.dart';

class CategoriesSection extends StatelessWidget {
  final List<Category> categories;

  const CategoriesSection({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    // List of images for each category (must be aligned with category order)
    final List<String> categoryImages = [
      'assets/images/food delivary.png',
      'assets/images/medicine 1.png',
      'assets/images/pets.png',
      'assets/images/gifts.png',
      'assets/images/meat.png',
      'assets/images/Make Up.png',
      'assets/images/stationary.png',
      'assets/images/store.png',
    ];

    return Column(
      children: [
        SizedBox(
          height: 220, // Slightly increased to avoid overflow
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final imagePath = categoryImages[index];
              return CategoryItem(
                category: category,
                index: index,
                imagePath: imagePath,
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'More',
              style: TextStyle(
                fontSize: 13,
                color: Colors.green,
                fontWeight: FontWeight.bold 
              ),
            ),
            SizedBox(width: 2),
            Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              color: Colors.green,
            ),
          ],
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;
  final int index;
  final String imagePath;

  const CategoryItem({
    super.key,
    required this.category,
    required this.index,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    bool showDiscount = index < 3 || index == 7;

    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 239, 239, 239),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
            if (showDiscount)
              Positioned(
                top: -6,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '10% Off',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          category.name,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
