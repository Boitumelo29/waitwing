import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:waitwing/core/extenstions/localization_extensions.dart';
import 'package:waitwing/utils/validation/validation.dart';

class PhoneNumberInputField extends StatelessWidget {
  final void Function(String fullNumber) onChanged;
  final TextEditingController controller;

  const PhoneNumberInputField(
      {super.key, required this.onChanged, required this.controller});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      decoration: InputDecoration(
        labelText: context.loc.phoneNumber,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.purple,
            width: 0.1,
          ),
        ),
      ),
      initialCountryCode: context.loc.za,
      onChanged: (phone) {
        onChanged(phone.completeNumber);
      },
      validator: (value) {
        return Validation.cellphoneValidation(value);
      },
    );
  }
}