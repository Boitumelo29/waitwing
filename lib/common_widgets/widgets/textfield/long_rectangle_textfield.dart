import 'package:flutter/material.dart';

class LongRectangleTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final bool showPrefixIcon;
  final IconData? prefixIcon;
  final dynamic validator;
  final Function(String) onChanged;

  const LongRectangleTextField(
      {super.key,
      this.controller,
      required this.hintText,
      required this.labelText,
      this.showPrefixIcon = false,
      this.prefixIcon,
      this.validator,
      required this.onChanged});

  @override
  State<LongRectangleTextField> createState() => _LongRectangleTextFieldState();
}

class _LongRectangleTextFieldState extends State<LongRectangleTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      onChanged: widget.onChanged,
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: widget.showPrefixIcon ? Icon(widget.prefixIcon) : null),
    );
  }
}
