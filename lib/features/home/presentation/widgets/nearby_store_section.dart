import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/domain/entities/store.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/nearby.png',
            height: 80,
            width: 72,
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
            padding: const EdgeInsets.only(left: 12.0, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                            "Sweets, North Indian",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    
                    Column(
                      children: [

                        Row(
                          children: [
                            Icon(Icons.star_rounded, color: Color(0xff505050),size: 16,),
                            Text(" 4.1",style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff505050)),),
                          ],
                        ),
                        Text(
                          '${store.timeMinutes} mins',
                          style: TextStyle(
                            color: Colors.orange.shade800,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                Row(
                  children: [
                   
                    Text(
                      'Site No - 1',
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(" | "),
                    Text(
                      '${store.distance} km',
                      style: const TextStyle(fontSize: 12), 
                    ),
                  ],
                ),
                Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 222, 222, 222),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Top Store',
                        style: TextStyle(
                          color: Color(0xff505050),
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                Divider(),
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Iconify(Mdi.percent_circle,
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
                      Row(
                        children: [
                        Image.asset("assets/images/icon.png",height: 15,width: 15,),
                  Text(
                    "${store.itemsAvailable!}  ",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 12,
                    ),
                  ),
                        ],
                      )
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
