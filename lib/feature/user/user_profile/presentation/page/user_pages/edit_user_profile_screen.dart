import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitwing/common_widgets/widgets/buttons/long_button.dart';
import 'package:waitwing/common_widgets/widgets/loading/loading_widget.dart';
import 'package:waitwing/common_widgets/widgets/textfield/textfields.dart';
import 'package:waitwing/core/extenstions/localization_extensions.dart';
import 'package:waitwing/core/extenstions/theme_extensions.dart';
import 'package:waitwing/feature/user/user_profile/bloc/user_bloc.dart';
import 'package:waitwing/utils/validation/validation.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

@RoutePage()
class EditUserProfileScreen extends StatelessWidget {
  const EditUserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final user = state.currentUser;
        return Scaffold(
          appBar: AppBar(
            title: Text(context.loc.editProfile),
          ),
          body: user != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      spacing: 30,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              Center(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    state.userImage.isEmpty
                                        ? Icon(
                                            Icons.person,
                                            color: context.colorScheme.primary,
                                            size: 100,
                                          )
                                        : SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Center(
                                              child: ClipOval(
                                                child: Image.memory(
                                                  base64Decode(state.userImage),
                                                  fit: BoxFit.cover,
                                                  width: 100,
                                                  height: 100,
                                                ),
                                              ),
                                            ),
                                          ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: () {
                                          _showPicker(context,
                                              state.currentUser?.id ?? "Guest");
                                        },
                                        icon: Icon(
                                          Icons.camera,
                                          size: 30,
                                          color: state.userImage.isEmpty
                                              ? Colors.grey
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(state.username),
                              Text(user.email ?? context.loc.guest),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 350,
                          child: Divider(
                            color: context.colorScheme.primary,
                          ),
                        ),
                        LongTextFieldForm(
                            onChanged: (value) {},
                            labelText: context.loc.fullName,
                            validator: (value) {
                              return Validation.textValidation(value);
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 190,
                              child: LongTextFieldForm(
                                  onChanged: (value) {},
                                  labelText: context.loc.gender,
                                  validator: (value) {
                                    return Validation.textValidation(value);
                                  }),
                            ),
                            SizedBox(
                              width: 190,
                              child: LongTextFieldForm(
                                  onChanged: (value) {},
                                  labelText: context.loc.dob,
                                  validator: (value) {
                                    return Validation.textValidation(value);
                                  }),
                            ),
                          ],
                        ),
                        LongTextFieldForm(
                            onChanged: (value) {},
                            labelText: context.loc.email,
                            validator: (value) {
                              return Validation.emailValidation(value);
                            }),
                        LongTextFieldForm(
                            onChanged: (value) {},
                            labelText: context.loc.phoneNumber,
                            validator: (value) {
                              return Validation.cellphoneValidation(value);
                            }),
                        LongButton(onTap: () {}, title: context.loc.save)
                      ],
                    ),
                  ),
                )
              : LoadingWidget(),
        );
      },
    );
  }

  void _showPicker(BuildContext context, String accountId) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: (Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: Text(context.loc.pickPic),
                    trailing: const Icon(Icons.chevron_right_outlined),
                    onTap: () {
                      context.read<UserBloc>().add(GetUserImage(
                          accountId: accountId, img: ImageSource.gallery));
                      Navigator.of(context).pop();
                    })
              ],
            )),
          );
        });
  }
}
