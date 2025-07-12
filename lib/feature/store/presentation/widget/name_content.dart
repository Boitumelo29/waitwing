import 'package:flutter/material.dart';
import 'package:waitwing/common_widgets/widgets/textfield/textfields.dart';
import 'package:waitwing/core/extenstions/localization_extensions.dart';
import 'package:waitwing/utils/validation/validation.dart';

class NameContent extends StatelessWidget {
  const NameContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(context.loc.tellBusiness),
            Text(context.loc.tellBusinessSub),
            LongTextFieldForm(
                labelText: context.loc.businessName,
                validator: (value) {
                  return Validation.textValidation(value);
                }),
            LongTextFieldForm(
                labelText: context.loc.businessEmail,
                validator: (value) {
                  return Validation.textValidation(value);
                }),
            LongTextFieldForm(
                labelText: context.loc.businessSlogan,
                validator: (value) {
                  return Validation.textValidation(value);
                }),
          ],
        ),
      ),
    );
  }
}