import 'package:flutter_sample_sutra/blocs/sign_in/sign_in_repository.dart';

class HardcodeSignInRepository extends SignInRepository {
  @override
  Future<void> signInAnonymously() {
    // nothing
  }

  @override
  Future<void> signInWithGoogle() {
    // nothing
  }
}
