import 'package:flutter_sample_sutra/blocs/authentication/authentication_repository.dart';
import 'package:flutter_sample_sutra/models/current_user.dart';

class HardcodeAuthenticationRepository extends AuthenticationRepository {
  @override
  Future<CurrentUser> getCurrentUser() async {
    return CurrentUser(
      id: "0",
      name: "guest",
      photoUrl:
          "https://3.bp.blogspot.com/-lgB1OwGumf8/XMZ9z9tVrnI/AAAAAAABSlc/QZfoeyR5YvcGDWd7lrVdI-5vkxE8odJhACLcBGAs/s800/drink_tapioka_tea_schoolgirl.png",
      isAnonymous: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  @override
  Future<bool> isSignedIn() async {
    // 固定でfalseを返す
    return false;
  }

  @override
  Future<void> signOut() {
    // nothing
  }
}
