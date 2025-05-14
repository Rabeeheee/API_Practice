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
    final displayStores = stores.length > 4 ? stores.sublist(0, 4) : stores;

    final int columnsNeeded = (displayStores.length / 2).ceil();
    final int columnsToShow = columnsNeeded > 0 ? columnsNeeded : 1;
    
    return SizedBox(
      height: 240, // Adjusted height for 2 rows
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: columnsToShow,
        itemBuilder: (context, columnIndex) {
          return Container(
            width: 250, // Width of each column
            margin: const EdgeInsets.only(right: 16),
            child: Column(
              children: [
                if (columnIndex * 2 < displayStores.length)
                  Expanded(
                    child: TrendingStoreCard(
                      store: displayStores[columnIndex * 2],
                    ),
                  ),
                const SizedBox(height: 8),
                if (columnIndex * 2 + 1 < displayStores.length)
                  Expanded(
                    child: TrendingStoreCard(
                      store: displayStores[columnIndex * 2 + 1],
                    ),
                  ),
                if (columnIndex * 2 < displayStores.length && 
                    columnIndex * 2 + 1 >= displayStores.length)
                  const Expanded(child: SizedBox()),
              ],
            ),
          );
        },
      ),
    );
  }
}

// 4. The TrendingStoreCard remains mostly the same but will now work with the category field
class TrendingStoreCard extends StatelessWidget {
  final Store store;

  const TrendingStoreCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left: Store Image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            store.imageUrl,
            height: 100,
            width: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 100,
                width: 80,
                color: Colors.amber.shade100, // Yellowish background as in image
                child: const Icon(Icons.store, color: Colors.amber),
              );
            },
          ),
        ),
        // Right: Store Info
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Category text
               
                // Store name
                Text(
                  store.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                 Text(
                  store.category,  // This will now work with the updated model
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 10,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                // Address
                Row(
                  children: [
                    Text(
                      store.address,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 11,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(" | "),
                     Text(
                      "6.4 kms",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 11,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Color.fromARGB(255, 0, 0, 0), size: 12),
                    const SizedBox(width: 2),
                    Text(
                      '${store.rating}',
                      style: const TextStyle(fontSize: 10),
                    ),
                    Text(" | "),
                    Text(
                      '${store.timeMinutes} mins',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}