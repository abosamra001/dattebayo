import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_state.freezed.dart';

@freezed
class NetworkState with _$NetworkState {
  const factory NetworkState.initial() = _Initial;
  const factory NetworkState.connected() = NetworkConnected;
  const factory NetworkState.disConnected() = NetworkDisconnected;
}
