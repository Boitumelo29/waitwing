import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitwing/common_widgets/widgets/buttons/long_button.dart';
import 'package:waitwing/common_widgets/widgets/containers/auth_container.dart';
import 'package:waitwing/common_widgets/widgets/textfield/textfields.dart';
import 'package:waitwing/core/extenstions/localization_extensions.dart';
import 'package:waitwing/core/extenstions/theme_extensions.dart';
import 'package:waitwing/feature/user/user_registration/bloc/user_registration_bloc.dart';
import 'package:waitwing/gen/assets.gen.dart';
import 'package:waitwing/utils/validation/validation.dart';

class UserRegistrationView extends StatelessWidget {
  const UserRegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserRegistrationBloc, UserRegistrationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final loginSelected = state.loginSelected;
        final signupSelected = state.signUpSelected;
        return Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: [
                Text(
                  context.loc.waitWing,
                  style: context.textTheme.headlineLarge
                      ?.copyWith(color: Colors.purple),
                ),
                Text(context.loc.waitWingSub),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    Assets.lib.assets.loginSignupQeueLogo.path,
                    height: 300,
                    width: 300,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 750,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        spacing: 15,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RegistrationButton(
                                onTap: () {
                                  context.read<UserRegistrationBloc>().add(
                                      RegistrationSelected(
                                          registrationType: RegistrationType.login));
                                },
                                title: context.loc.login,
                                selected: loginSelected,
                              ),
                              RegistrationButton(
                                onTap: () {
                                  context.read<UserRegistrationBloc>().add(
                                      RegistrationSelected(
                                          registrationType: RegistrationType.sign));
                                },
                                title: context.loc.signup,
                                selected: signupSelected,
                              )
                            ],
                          ),
                          signupSelected
                              ? LongTextFieldForm(
                                  onChanged: (value) {},
                                  labelText: context.loc.username,
                                  validator: (value) {
                                    return Validation.usernameValidation(value);
                                  })
                              : SizedBox(),
                          LongTextFieldForm(
                              onChanged: (value) {},
                              labelText: context.loc.email,
                              hintText: context.loc.email,
                              validator: (value) {
                                return Validation.emailValidation(value);
                              }),
                          LongTextFieldForm(
                              onChanged: (value) {},
                              labelText: context.loc.password,
                              hintText: context.loc.password,
                              validator: (value) {
                                return Validation.passwordValidation(value);
                              }),
                          if (loginSelected)
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(context.loc.forgotPassword),
                              ),
                            ),
                          signupSelected
                              ? LongTextFieldForm(
                                  onChanged: (value) {},
                                  labelText: context.loc.confirmPassword,
                                  hintText: context.loc.confirmPassword,
                                  validator: (value) {
                                    return Validation.passwordConformValidation(
                                        value, "");
                                  })
                              : SizedBox(),
                          LongButton(
                              onTap: () {},
                              title: loginSelected
                                  ? context.loc.login
                                  : context.loc.signup,
                              isLoading: false),
                          loginSelected
                              ? Divider(
                                  color: Colors.purple,
                                )
                              : SizedBox(),
                          loginSelected
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AuthContainer(
                                        onPressed: () {},
                                        iconData: Icons.facebook),
                                    AuthContainer(
                                        onPressed: () {},
                                        iconData: Icons.g_mobiledata),
                                    AuthContainer(
                                        onPressed: () {}, iconData: Icons.apple)
                                  ],
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class RegistrationButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final bool selected;

  const RegistrationButton(
      {super.key,
      required this.onTap,
      required this.title,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 190,
        decoration: BoxDecoration(
            border: selected
                ? Border(
                    bottom: BorderSide(
                    color: Colors.purple,
                    width: 5,
                  ))
                : null),
        child: Center(
            child: Text(
          title,
          style: context.textTheme.headlineMedium,
        )),
      ),
    );
  }
}
