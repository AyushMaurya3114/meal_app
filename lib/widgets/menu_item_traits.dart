import 'package:flutter/material.dart';

class MenuItemTraits extends StatelessWidget{
  const MenuItemTraits({super.key,required this.label,required this.icon});
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: 17,color: Colors.white,),
        const SizedBox(width: 10,),
        Text(label,style: const TextStyle(color: Colors.white),)
      ],
    );
  }
}