import 'package:flutter/material.dart';
class TaskColorWidget extends StatelessWidget {
  const TaskColorWidget({super.key, required this.tasKColor, required this.isSelected, });
   final Color tasKColor;
   final bool isSelected;


  @override
  Widget build(BuildContext context) {
       return  Container(
               margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
               width: 30,
               decoration: BoxDecoration(
              //   borderRadius: const BorderRadius.all(Radius.circular(30)),
                 shape: BoxShape.circle,
                 color: tasKColor,
                 boxShadow: isSelected ? [
                   BoxShadow(
                     color: tasKColor.withOpacity(0.7), // Shadow color
                     spreadRadius: 5, // Spread of the shadow
                     blurRadius: 15,  // Blur radius for softness
                     offset: Offset(0, 5), // Offset for the shadow's position
                   ),
                 ] : []
               )


       ) ;
  }
}
