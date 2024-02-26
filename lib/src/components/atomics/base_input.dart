import 'package:flutter/material.dart';

class BaseInput extends StatelessWidget {
  final bool? isTextObscured;
  final TextEditingController? controller;
  final String? placeholder;
  final IconButton? suffixIcon;
  final String? errorMessage;
  final String? labelText;
  final Function(String)? onChanged;

  const BaseInput(
      {super.key,
      this.isTextObscured,
      this.controller,
      this.suffixIcon,
      this.errorMessage,
      this.labelText,
      this.onChanged,
      this.placeholder});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black87),
      obscureText: isTextObscured ?? false,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
          labelText: labelText,
          errorText: errorMessage,
          errorStyle: errorMessage != null && errorMessage!.isNotEmpty
              ? const TextStyle(color: Colors.redAccent)
              : const TextStyle(
                  color: Colors.black), // Transparent color if no error message
          errorBorder: errorMessage != null && errorMessage!.isNotEmpty
              ? const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
                )
              : const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.black87, width: 1.5),
          ),
          contentPadding:
              const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
          hintText: placeholder,
          hintStyle: const TextStyle(fontSize: 10.0, color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
          ),
          suffixIcon: suffixIcon),
    );
  }
}
