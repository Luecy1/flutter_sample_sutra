import 'package:equatable/equatable.dart';
import 'package:flutter_sample_sutra/models/current_user.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const []]) : super(props);
}

class AuthenticationInProgress extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';
}

class AuthenticationSuccess extends AuthenticationState {
  final CurrentUser currentUser;

  AuthenticationSuccess(this.currentUser) : super([currentUser]);

  @override
  String toString() => 'AuthenticationSuccess{currentUser: $currentUser}';
}

class AuthenticationFailure extends AuthenticationState {
  @override
  String toString() => 'AuthenticationFailure{}';
}
