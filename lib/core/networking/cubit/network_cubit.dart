import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final Connectivity _connectivity = Connectivity();
  final InternetConnection _internetChecker = InternetConnection();
  StreamSubscription? _connectivitySubscription;
  NetworkCubit() : super(const NetworkState.initial()) {
    _checkInternetConnection();
  }

  void _checkInternetConnection() {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      result,
    ) async {
      if (result.contains(ConnectivityResult.none)) {
        emit(const NetworkState.disConnected());
      } else {
        final hasInternet = await _internetChecker.hasInternetAccess;
        if (hasInternet) {
          emit(const NetworkState.connected());
        } else {
          emit(const NetworkState.disConnected());
        }
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
