import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:lastchat/model/user_model.dart';
class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _usersCollectionReference = FirebaseFirestore.instance.collection('users');
  //final FirestoreService _firestoreService = locator<FirestoreService>();
  UserModel  ?_currentUser;
  UserModel? get currentUser => _currentUser;
  
  Future loginWithEmail({
    required 
    String email,
    required
     String password}) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      //return e.message;
    }
  }

  Future signUpWithEmail({
  required String email,
    required String password,
    required String name,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // create a new user profile on firestore
      _currentUser = UserModel(
        id: authResult.user!.uid,
        email: email,
        name: name,
      );

      //await FirebaseFirestore.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
    //  return e.message;
    }
  }

  // Future<bool> isUserLoggedIn() async {
  //   var user = await _firebaseAuth.currentUser!();
  //   if (user != null) {
  //     await _populateCurrentUser(user);
  //   }
  //   return user != null;
  // }

  Future _populateCurrentUser(User ?user) async {
    if (user != null) {
      _currentUser = await getUser(user.uid);
    }
 
    //   var userData = await _usersCollectionReference.doc(user.uid).get();

    // //  return UserModel.fromData(userData.data);
    // } catch (e) {
    //   // TODO: Find or create a way to repeat error handling without so much repeated code
    //   if (e is PlatformException) {
    //     return e.message;
    //   }

    //   return e.toString();
    // }


  }

 Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.doc(uid).get();

      return UserModel.fromData(userData.data as Map<String, dynamic>);
      //userData.data
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }


  void logOut() {
    _firebaseAuth.signOut();
  }
}