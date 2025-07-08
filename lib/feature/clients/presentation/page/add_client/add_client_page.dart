import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitwing/feature/clients/bloc/add_client/add_client_bloc.dart';
import 'package:waitwing/feature/clients/presentation/page/add_client/add_client_view.dart';

@RoutePage()
class AddClientWrapperPage extends StatelessWidget {
  const AddClientWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddClientBloc(),
      child: AddClientView(),
    );
  }
}
