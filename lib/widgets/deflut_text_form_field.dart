import 'package:flutter/material.dart';
import 'package:news_app/cubits/app_cubit/app_cubit.dart';

class DefultTextFormField extends StatelessWidget {
  const DefultTextFormField({
    super.key,
    this.validator,
    this.hintText,
    required this.onChanged,
  });

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    var isDark = AppCubit.get(context).isDark;
    return TextFormField(
        onChanged: onChanged,
        validator: validator,
        cursorColor: Colors.grey,
        style: TextStyle(color: isDark ? Colors.grey : Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: isDark ? Colors.white : Colors.grey),
          prefixIcon: const Icon(Icons.search),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ));
  }
}
