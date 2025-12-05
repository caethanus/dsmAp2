import 'dart:async';

import 'package:ap2/model/userModel.dart';
import 'package:ap2/utils/results.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<UserModel> get user {
    return _auth.authStateChanges().map((user) {
      return UserModel(email: user?.email ?? '');
    });
  }

  final StreamController<Results> _resultsLogin =
  StreamController<Results>.broadcast();

  Stream<Results> get resultsLogin => _resultsLogin.stream;

  signIn(String email, String password) async {
    _resultsLogin.add(LoadingResult());

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _resultsLogin.add(SuccessResult());
    } on FirebaseAuthException catch (exception, e) {
      _resultsLogin.add(ErrorResult(code: exception.code));
      debugPrint(e.toString());
    }
  }

  register(String fullName, String email, String password) async {
    try {
      final usuario = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await usuario.user?.updateDisplayName(fullName);
      _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  logout() async {
    await _auth.signOut();
  }
}