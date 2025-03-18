import 'package:flutter/material.dart';
class CustomTaskButtonWidget extends StatelessWidget {
  const CustomTaskButtonWidget({super.key, required this.text, required this.buttonColor, required this.textColor, this.onPressed});
final String text;
final Color buttonColor;
  final Color textColor;
 final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
        ) ,
        color:buttonColor,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 28),
          child:  Text(
            text,
            style: TextStyle(
                color: textColor, fontSize: 20),
          ),
        ));
  }
}
