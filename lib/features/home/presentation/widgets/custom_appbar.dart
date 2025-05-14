import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback onNotificationTap;

  const CustomAppBar({
    super.key,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Location row
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.green),
              const SizedBox(width: 8),
              const Text(
                'ABCD, New Delhi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.keyboard_arrow_down,color: Colors.green,),
            ],
          ),
          const SizedBox(height: 16),

          // Search field with notification and favorite icons
          Row(
            children: [
              // Expanded search field
              Expanded(
                child: TextField(
                  
                  decoration: InputDecoration(
                    
                    hintText: 'Search for products/stores',
                    suffixIcon: const Icon(Icons.search,color: Colors.green,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 8),
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // Notification icon with badge
              

                   Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_outlined,color: Colors.red,),
                        onPressed: onNotificationTap,
                      ),
                    
                        Positioned(
                          right: 9,
                          top: 8,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: const Text(
                              '2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                
              

              // Favorite icon
              IconButton(
                icon: Iconify(Mdi.tag_outline,color: Color(0xFFFFA115),),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
