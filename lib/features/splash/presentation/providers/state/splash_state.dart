import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState.initial() = Initial;
  const factory SplashState.checking() = Checking;
  const factory SplashState.noInternet() = NoInternet;
  const factory SplashState.unauthenticated() = Unauthenticated;
  const factory SplashState.authenticated() = Authenticated;
}