import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, required this.onPressed, required this.buttonText})
      : super(key: key);
  final void Function() onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
