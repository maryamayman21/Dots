import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class MyDatePicker extends StatelessWidget {
  const MyDatePicker({super.key, this.onChanged, this.validator});
 final void Function(DateTime?)? onChanged;
 final String? Function(DateTime?)? validator;
  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate;

    return DateTimeFormField(
       validator: validator,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      decoration: InputDecoration(
        hintText: 'DD/MM/YY',
        filled: true,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context)
                .scaffoldBackgroundColor, // Border color when unfocused
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context)
                .scaffoldBackgroundColor, // Border color when unfocused
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context)
                .scaffoldBackgroundColor, // Border color when focused
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon:
            Icon(Icons.calendar_today, color: Theme.of(context).primaryColor),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      mode: DateTimeFieldPickerMode.date,
      onChanged:onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
