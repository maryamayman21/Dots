import 'package:flutter/material.dart';
typedef Validator = String? Function(String?);

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, required this.label, this.keyboardType = TextInputType.text, this.isObscure = false,
    required this.validator, required this.controller});
   final TextEditingController? controller;
   final String hintText;
    final String label;
   final TextInputType keyboardType;
 final  bool isObscure;
 final Validator validator;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: TextFormField(
        controller: controller,
         keyboardType: keyboardType,
        obscureText: isObscure,
        validator: validator,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: label,

          filled: true,
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          hintText:  hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:Theme.of(context).scaffoldBackgroundColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:Theme.of(context).scaffoldBackgroundColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
