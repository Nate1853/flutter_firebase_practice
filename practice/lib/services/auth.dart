import 'package:firebase_auth/firebase_auth.dart';
import 'package:practice/models/our_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on User
  Our_User? _fromFirebaseUser(User user) {
    return user != null ? Our_User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<Our_User?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _fromFirebaseUser(user!));
  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User user = userCredential.user!;
      return _fromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email&password

  // register with email&password

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
