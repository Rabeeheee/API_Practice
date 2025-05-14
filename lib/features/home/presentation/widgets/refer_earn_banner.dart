import 'package:flutter/material.dart';

class ReferEarnBanner extends StatelessWidget {
  const ReferEarnBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xff29D177),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.green.shade100),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '   Refer & Earn',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Invite a friend & earn 15% off',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.arrow_circle_right_rounded,color: Colors.white, size: 18,)
                  ],
                ),
              ],
            ),
          ),
          Image.asset("assets/images/refer.png")
        ],
      ),
    );
  }
}
