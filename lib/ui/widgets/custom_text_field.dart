import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.maxLength,
    required this.textEditingController,
    required this.maxLines,
    required this.hintText,
    required this.keyboardType,
    this.filterTextInputFormatter,
    required this.focusNode,
    required this.isAutoFocus,
    this.onSubmited,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final int maxLines;
  final int maxLength;
  final String hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? filterTextInputFormatter;
  final FocusNode focusNode;
  final bool isAutoFocus;
  final void Function(String)? onSubmited;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: textEditingController,
        maxLength: maxLength,
        maxLines: 1,
        textInputAction: TextInputAction.done,
        keyboardType: keyboardType,
        inputFormatters: filterTextInputFormatter,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.all(10),
        ),
        focusNode: focusNode,
        autofocus: isAutoFocus,
        onSubmitted: onSubmited,
      ),
    );
  }
}
