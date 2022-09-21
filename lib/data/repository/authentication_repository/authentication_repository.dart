import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../repository.dart';

class AuthenticationRepository extends Repository {
  AuthenticationRepository(super.read);

  Future<UserCredential> authAppGoogle() async {
    final completer = Completer<UserCredential>();

    try {
      await GoogleSignIn().signOut();
      final googleSignIn = await GoogleSignIn().signIn();
      final googleAuth = await googleSignIn!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      /// Once signed in, return the UserCredential
      await FirebaseAuth.instance.signOut();

      final userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
      completer.complete(userCredential);
    } on Exception catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }

  // Future<ApiResult<AuthAppSimpleResponse>> authAppSimple(AuthAppSimpleRequest appSimpleRequest) async {
  //   String basicAuth =
  //       'Basic ${base64Encode(utf8.encode('${appSimpleRequest.}:${appSimpleRequest.password}'))}';
  //   final response = await apiClient().authAppSimple(,);
  //   if(isOk(response.result.toInt())){
  //
  //   }
  //
  // }
}
