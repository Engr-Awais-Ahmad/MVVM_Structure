import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvvm_app/core/models/app_user.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  AppUser appUser = AppUser();

  Future<dynamic> registerUser(AppUser appUser) async {
    final credentials = await auth.createUserWithEmailAndPassword(
      email: appUser.email ?? "",
      password: appUser.password ?? "",
    );
    return credentials;
  }
}
