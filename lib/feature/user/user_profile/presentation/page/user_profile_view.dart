import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitwing/common_widgets/widgets/buttons/long_button.dart';
import 'package:waitwing/common_widgets/widgets/drawer/user_drawer.dart';
import 'package:waitwing/common_widgets/widgets/loading/loading_widget.dart';
import 'package:waitwing/core/extenstions/localization_extensions.dart';
import 'package:waitwing/core/extenstions/theme_extensions.dart';
import 'package:waitwing/core/routers/router.dart';
import 'package:waitwing/feature/user/user_profile/bloc/user_bloc.dart';

@RoutePage()
class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final user = state.currentUser;
        return Scaffold(
            body: user != null
                ? Center(
                    child: Column(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        state.userImage.isNotEmpty
                            ? SizedBox(
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
                              )
                            : CircleAvatar(
                                backgroundColor: context.colorScheme.primary,
                                child: Text(state.username[0]),
                              ),
                        Text(state.username),
                        Text(user.email ?? context.loc.guest,),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: LongButton(
                            onTap: () {
                              context.router.push(EditUserProfileRoute());
                            },
                            title: context.loc.editProfile,
                          ),
                        ),
                        SizedBox(
                          width: 350,
                          child: Divider(
                            color: context.colorScheme.primary,
                          ),
                        ),
                        UserProfileDrawer(
                            iconData: Icons.shop, title: context.loc.store),
                        UserProfileDrawer(
                            iconData: Icons.star, title: context.loc.review),
                        UserProfileDrawer(
                            iconData: Icons.store,
                            title: context.loc.workspace),
                        SizedBox(
                          width: 350,
                          child: Divider(
                            color: context.colorScheme.primary,
                          ),
                        ),
                        UserProfileDrawer(
                            iconData: Icons.help,
                            title: context.loc.helpSupport),
                        UserProfileDrawer(
                            iconData: Icons.question_mark,
                            title: context.loc.faq),
                        UserProfileDrawer(
                            iconData: Icons.exit_to_app,
                            title: context.loc.logout)
                      ],
                    ),
                  )
                : LoadingWidget());
      },
    );
  }
}
