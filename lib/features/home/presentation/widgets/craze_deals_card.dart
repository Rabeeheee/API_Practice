import 'package:flutter/material.dart';

class CrazeDealsCard extends StatelessWidget {
  const CrazeDealsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160, // Set a fixed height for the card
      width: 340, // Set a fixed width for the card
      margin: const EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Customer favourite',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
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
                    children: [
                      Text(
                        'Explore',
                        style: TextStyle(
                          color: const Color(0xFFEA7E00),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: const Color(0xFFEA7E00),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Right side with vegetable image
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/vegitables.png'),
                  fit: BoxFit.cover,
                ),
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