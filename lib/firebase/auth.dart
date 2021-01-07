import 'package:firebase_auth/firebase_auth.dart';
import 'package:gymbodybuilding/firebase/user.dart';

import 'DatabaseManager.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  Useer _userFromFirebaseUser(User user){
    return user != null ? Useer(uid: user.uid) : null;
  }
  Stream<Useer> get user{
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future SignInWithEmailAndPassword(String email,String password)async
  {

    UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: password);
    User user = result.user;
    return _userFromFirebaseUser(user);

  }
  Future registerWithEmailAndPassword(String email,String password)async
  {

      UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
  }
  Future signOut() async
  {
    try{
    return await _auth.signOut();
    }catch(e)
    {
        print(e.toString());
        return null;
    }
  }
}

