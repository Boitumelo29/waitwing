import 'package:flutter/material.dart';
import 'package:waitwing/core/extenstions/localization_extensions.dart';
import 'package:waitwing/core/extenstions/theme_extensions.dart';
import 'package:waitwing/utils/validation/validation.dart';

class NotesContainer extends StatelessWidget {
  final TextEditingController controller;

  const NotesContainer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          return Validation.textValidation(value);
        },
        maxLines: 2,
        decoration: InputDecoration(
          hintText: context.loc.addNotes,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: context.colorScheme.primary,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: context.colorScheme.primary,
              width: 0.7,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}