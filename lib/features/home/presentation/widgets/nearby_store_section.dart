import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/domain/entities/store.dart';

class NearbyStoresSection extends StatelessWidget {
  final List<Store> stores;

  const NearbyStoresSection({
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
        return NearbyStoreCard(store: store);
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
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/store_placeholder.png',
            height: 100,
            width: 100,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 100,
                width: 100,
                color: Colors.grey.shade200,
                child: const Center(
                  child: Icon(Icons.image, color: Colors.grey),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
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
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${store.timeMinutes} mins',
                        style: TextStyle(
                          color: Colors.orange.shade800,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
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
                    const SizedBox(width: 16),
                    Text(
                      '${store.distance} km',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                if (store.discount != null || store.itemsAvailable != null)
                  const SizedBox(height: 8),
                if (store.discount != null)
                  Row(
                    children: [
                      const Icon(
                        Icons.local_offer,
                        color: Colors.red,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        store.discount!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                if (store.itemsAvailable != null)
                  const SizedBox(height: 4),
                if (store.itemsAvailable != null)
                  Text(
                    store.itemsAvailable!,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
