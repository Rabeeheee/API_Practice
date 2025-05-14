import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/domain/entities/promotion.dart';

class PromotionsSection extends StatelessWidget {
  final List<Promotion> promotions;

  const PromotionsSection({
    super.key,
    required this.promotions,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: promotions.length,
        itemBuilder: (context, index) {
          final promotion = promotions[index];

          Color bgColor = index == 0
              ? const Color(0xFF00C853) 
              : const Color(0xFF685BCB); 

          return PromotionCard(
            promotion: promotion,
            backgroundColor: bgColor,
          );
        },
      ),
    );
  }
}

class PromotionCard extends StatelessWidget {
  final Promotion promotion;
  final Color backgroundColor;

  const PromotionCard({
    super.key,
    required this.promotion, required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350, // Adjust as needed
      height: 160,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // Fruit image positioned to the right
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.asset(
                'assets/images/fruit.png',
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Text and button on the left
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text(
                  promotion.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    height: 1.2,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8918), // Orange color
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    promotion.buttonText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
