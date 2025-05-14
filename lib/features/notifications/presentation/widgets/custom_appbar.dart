import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
      padding: const EdgeInsets.only(left: 28.0),
      child: Container(
        width: 25,
        height: 25,
        decoration: const BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: EdgeInsets.zero, // remove default padding
          iconSize: 20, // reduce icon size
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
    Navigator.pop(context);
          },
        ),
      ),
    ),
    
      title: const Text('Notifications',style: TextStyle(fontWeight: FontWeight.bold),),
      bottom: PreferredSize(preferredSize: Size.fromHeight(1.0), child: Container(color: const Color.fromARGB(255, 201, 201, 201),height: 2.0,),),
      elevation: 0,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}