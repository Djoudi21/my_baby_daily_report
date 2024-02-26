import 'package:flutter/material.dart';

class BaseButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;

  const BaseButton({super.key, required this.onPressed, required this.label});
  @override
  State<BaseButton> createState() => _BaseButton();
}

class _BaseButton extends State<BaseButton> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15, color: Colors.white),
        backgroundColor: Colors.black);

    return ElevatedButton(
        style: style,
        onPressed: widget.onPressed,
        child: Text(widget.label,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white)));
  }
}
