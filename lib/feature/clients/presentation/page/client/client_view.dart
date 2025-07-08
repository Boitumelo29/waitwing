import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitwing/core/extenstions/localization_extensions.dart';
import 'package:waitwing/core/extenstions/theme_extensions.dart';
import 'package:waitwing/core/routers/router.dart';
import 'package:waitwing/feature/clients/bloc/client/clients_bloc.dart';

@RoutePage()
class ClientView extends StatelessWidget {
  const ClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientsBloc, ClientsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.loc.addClient),
            actions: [
              IconButton(
                  onPressed: () {
                    context.router.push(AddClientWrapperRoute());
                  },
                  icon: Icon(
                    Icons.add,
                    size: 30,
                    color: context.colorScheme.primary,
                  ))
            ],
          ),
          body: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (state.clients.isEmpty) ...[
                    Center(
                      child: Text(
                        context.loc.noClient,
                        style: TextStyle(
                          color: context.colorScheme.primary,
                          fontStyle: FontStyle.italic,
                          fontSize: 40,
                        ),
                      ),
                    )
                  ],
                ]),
          ),
        );
      },
    );
  }
}
