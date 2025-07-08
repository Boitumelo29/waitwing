import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitwing/feature/clients/bloc/client/clients_bloc.dart';

@RoutePage()
class ClientWrapperPage extends StatelessWidget {
  const ClientWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientsBloc(),
      child: AutoRouter(),
    );
  }
}
