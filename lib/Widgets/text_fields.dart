import 'package:flutter/material.dart';
class TextFields extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool ispassword;
  final String hintText;
  final TextInputType textInputType;
  const TextFields({super.key, required this.textEditingController,  required this.ispassword, required this.hintText, required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),

        ),
        focusedBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
        enabledBorder: OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
        filled: true,

      ),
      obscureText: ispassword,
      keyboardType: textInputType,
    );
  }
}
