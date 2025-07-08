import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitwing/common_widgets/widgets/buttons/long_button.dart';
import 'package:waitwing/common_widgets/widgets/containers/notes_container.dart';
import 'package:waitwing/common_widgets/widgets/textfield/phone_number_input_fields.dart';
import 'package:waitwing/common_widgets/widgets/textfield/textfields.dart';
import 'package:waitwing/core/extenstions/localization_extensions.dart';
import 'package:waitwing/core/extenstions/theme_extensions.dart';
import 'package:waitwing/feature/clients/bloc/add_client/add_client_bloc.dart';
import 'package:waitwing/utils/validation/validation.dart';

class AddClientView extends StatelessWidget {
  const AddClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddClientBloc, AddClientState>(
      builder: (context, state) {
        final TextEditingController fullName = TextEditingController();
        final TextEditingController email = TextEditingController();
        final TextEditingController phoneNumber = TextEditingController();
        final TextEditingController notes = TextEditingController();
        final TextEditingController dobController = TextEditingController();
        return Scaffold(
          appBar: AppBar(
            title: Text(context.loc.addClient),
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<AddClientBloc>().add(AddClient(
                        fullName: fullName.text,
                        email: email.text,
                        phoneNumber: phoneNumber.text,
                        notes: notes.text));
                  },
                  icon: Icon(Icons.save_alt_outlined))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                spacing: 15,
                children: [
                  Icon(
                    Icons.person,
                    size: 120,
                    color: context.colorScheme.primary,
                  ),
                  SizedBox(
                    width: 350,
                    child: Divider(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  LongTextFieldForm(
                      controller: fullName,
                      onChanged: (value) {},
                      labelText: context.loc.fullName,
                      validator: (value) {
                        return Validation.textValidation(value);
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 180,
                        child: LongTextFieldForm(
                            onChanged: (value) {},
                            labelText: context.loc.gender,
                            validator: (value) {
                              return Validation.textValidation(value);
                            }),
                      ),
                      SizedBox(
                        width: 180,
                        child: LongTextFieldForm(
                            controller: dobController,
                            onChanged: (value) {},
                            labelText: context.loc.dob,
                            validator: (value) {
                              return Validation.textValidation(value);
                            }),
                      ),
                    ],
                  ),
                  LongTextFieldForm(
                      controller: email,
                      onChanged: (value) {},
                      labelText: context.loc.email,
                      validator: (value) {
                        return Validation.emailValidation(value);
                      }),
                  PhoneNumberInputField(
                    controller: phoneNumber,
                    onChanged: (value) {},
                  ),
                  NotesContainer(
                    controller: notes,
                  ),
                  LongButton(
                      onTap: () {
                        context.read<AddClientBloc>().add(AddClient(
                            fullName: fullName.text,
                            email: email.text,
                            phoneNumber: phoneNumber.text,
                            notes: notes.text));
                      },
                      title: context.loc.save),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

// Future<void> _selectDate(BuildContext context) async {
//   final DateTime? picked = await showDatePicker(
//     context: context,
//     initialDate: DateTime(2000),
//     firstDate: DateTime(1900),
//     lastDate: DateTime.now(),
//   );
//
//   if (picked != null) {
//     _dobController.text = DateFormat('yyyy-MM-dd').format(picked);
//   }
// }
}




