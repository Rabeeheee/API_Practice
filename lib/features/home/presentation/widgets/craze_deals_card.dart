import 'package:flutter/material.dart';


class CrazeDealsCard extends StatelessWidget {
  const CrazeDealsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 345,
      margin: const EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(
        children: [
          // Text and content area
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Customer favourite',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'top supermarkets',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    Text(
                      'Explore',
                      style: TextStyle(
                        color: Color(0xFFEA7E00),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: Color(0xFFEA7E00),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Positioned image on the right
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.asset(
                'assets/images/vegitables.png',
                width: 120,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class HorizontalCrazeDeals extends StatelessWidget {
  const HorizontalCrazeDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        SizedBox(
          height: 160, // Same height as the card
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 16.0),
            scrollDirection: Axis.horizontal,
            itemCount: 2, // You can adjust the number of cards
            itemBuilder: (context, index) {
              return const CrazeDealsCard();
            },
          ),
        ),
      ],
    );
  }
}