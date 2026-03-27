import 'package:dattebayo/core/networking/cubit/network_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../networking/cubit/network_state.dart';

class NetworkBlocListener extends StatelessWidget {
  final Widget child;
  final VoidCallback? whenConnected;
  final VoidCallback? whenDisConnected;

  const NetworkBlocListener({
    super.key,
    required this.child,
    this.whenConnected,
    this.whenDisConnected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkCubit, NetworkState>(
      listener: (context, state) {
        state.maybeWhen(
          connected: whenConnected,
          disConnected: whenDisConnected,
          orElse: () {},
        );
      },
      child: child,
    );
  }
}
