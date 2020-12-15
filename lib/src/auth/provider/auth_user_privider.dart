import 'package:firebase_auth/firebase_auth.dart';
import 'package:prueba_flutter/src/models/auth_user.dart';

class AuthUserProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //object user
  AuthUser _userFromFirebase(User user) {
    return user != null ? AuthUser(uid: user.uid) : null;
  }

  //Registration with email and password
  Future<AuthUser> createUserWithEmailAndPassword(
    String email,
    String password,
    String nombre,
  ) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User user = result.user;
    await updateProfile(nombre,user);
    return _userFromFirebase(user);
    } catch (e) {
      print( e.toString());
    }
    return null;
  }
  //update Profile
  Future updateProfile(
    String nombre,
    User user
  ) async {
    await user.updateProfile(
      displayName: nombre,
    );
    await user.reload();
  }

  //Signin whit email and password
  Future<AuthUser> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
    return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  //reset password
  Future sendPasswordResetEmail(String email) async {
    return await _auth.sendPasswordResetEmail(email: email);
  }

  //get current uid
  Future<String> getCurrenUID() async {
    return _auth.currentUser.uid;
  }

  //logout
  Future logout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString() );
    }
  }

  //change
  Stream<AuthUser> get user {
    return _auth.authStateChanges().map((User user) => _userFromFirebase(user));
  }

}
