import 'package:flutter_sample_sutra/models/current_user.dart';

abstract class AuthenticationRepository {
  Future<void> signOut();

  Future<bool> isSignedIn();

  Future<CurrentUser> getCurrentUser();
}
