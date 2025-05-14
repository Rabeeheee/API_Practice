import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/domain/entities/store.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class NearbyStoresSection1 extends StatelessWidget {
  final List<Store> stores;

  const NearbyStoresSection1({
    super.key,
    required this.stores,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: stores.length,
      itemBuilder: (context, index) {
        final store = stores[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: NearbyStoreCard(store: store),
        );
      },
    );
  }
}

class NearbyStoreCard extends StatelessWidget {
  final Store store;

  const NearbyStoreCard({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Store Image
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
          child: Image.asset(
            'assets/images/store_placeholder.png',
            height: 80,
            width: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 80,
                width: 80,
                color: Colors.grey.shade200,
                child: const Center(
                  child: Icon(Icons.image, color: Colors.grey),
                ),
              );
            },
          ),
        ),
        
        // Store Details
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First row: Store name and rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        store.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${store.rating}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                // Second row: Store categories and location
                const SizedBox(height: 4),
                Text(
                  'Sweets, North Indian',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
                
                // Third row: Site number and distance
                const SizedBox(height: 2),
                Text(
                  'Site No - 1  |  ${store.distance} kms',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
                
                // Fourth row: Top Store badge
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 232, 227, 220),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Top Store',
                    style: TextStyle(
                      color: Color(0xff505050),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                
                // Fifth row: Discount and delivery time
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Discount info
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.percent,
                            color: Colors.red,
                            size: 12,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Upto 10% OFF',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    
                    // Items available
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/icon.png",
                          height: 18,
                          width: 18,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '3400+ items available',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        
        // Delivery time badge
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF3E0),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '${store.timeMinutes} mins',
              style: const TextStyle(
                color: Color(0xFFFF9800),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}