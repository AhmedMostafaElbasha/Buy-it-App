import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> signInUser(
      {@required String email, @required String password}) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential;
  }

  Future<UserCredential> signUpUser(
      {@required String email, @required String password}) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential;
  }
}
