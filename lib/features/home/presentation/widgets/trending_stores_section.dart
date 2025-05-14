import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/domain/entities/store.dart';

class TrendingStoresSection extends StatelessWidget {
  final List<Store> stores;

  const TrendingStoresSection({
    super.key,
    required this.stores,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: stores.length,
        itemBuilder: (context, index) {
          final store = stores[index];
          return TrendingStoreCard(store: store);
        },
      ),
    );
  }
}

class TrendingStoreCard extends StatelessWidget {
  final Store store;

  const TrendingStoreCard({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              'assets/images/store_placeholder.png',
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 100,
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: Icon(Icons.image, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  store.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  store.address,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
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
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${store.distance} km',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${store.timeMinutes} mins',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
