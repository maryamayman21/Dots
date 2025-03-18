import 'package:flutter/material.dart';
class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title, this.onPressed});
 final String title;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text( title, style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontWeight:  FontWeight.bold,
              color: Colors.black
          )),
          TextButton(onPressed: onPressed, child: Text('View All', style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Colors.blueAccent
          )) )
        ],
      ),

    );

  }
}
