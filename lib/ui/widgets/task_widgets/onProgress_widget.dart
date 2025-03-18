import 'package:flutter/material.dart';

class OnprogressTask extends StatelessWidget {
  const OnprogressTask({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Card(

          elevation: 5, // Gives the Card a shadow effect
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners for the Card
          ),
          child: Container(
            height: 200,
            width: 350,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.pink, // Bottom border color
                  width: 8.0,         // Bottom border width
                ),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Design UI ToDo App',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      height: 10,
                      width: 10,
                    ),
                  ],
                ),
                Text(
                  'Friday, 08 July 2024',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                  endIndent: 10,
                  indent: 10,
                ),
                Text(
                  'Description:',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'Design a simple homepage with a clean layout and a color based on the guidelines xsbusbeubcuebcuedbcuebc ',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      );


  }
}
