import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:lastchat/model/user_model.dart';
import 'package:lastchat/service/auth_service.dart';
class FirestoreService {
 final CollectionReference _usersCollectionReference =FirebaseFirestore.instance.collection('users');
FirebaseAuth firebaseAuth=FirebaseAuth.instance;
AuthService authService=AuthService();
Future getAllUsersOnce (String currentUserUID) async {

    try {
      var usersDocumentSnapshot = await _usersCollectionReference.get();
      // _usersCollectionReference.get();
   
     print('get all user once......//////');
      if (usersDocumentSnapshot.docs.isNotEmpty) {
       
        return usersDocumentSnapshot.docs
            .map((user) => UserModel.fromMap(user.data() as Map<String,dynamic>)).where((user) => user.id != currentUserUID
            //currentUserUID
            //authService.currentUser?.id
            )
            .toList();
            //user.data
      //as Map<String, dynamic>
      
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }



}