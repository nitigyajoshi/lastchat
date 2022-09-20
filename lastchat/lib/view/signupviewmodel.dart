
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lastchat/model/user_model.dart';

import 'package:stacked/stacked.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends BaseViewModel {
  int a=0;
   UserModel ?_currentUser;
  UserModel get currentUser => _currentUser!;
 FirebaseAuth ?auth;
   final CollectionReference _usersCollectionReference = FirebaseFirestore.instance.collection('users');
FirebaseFirestore _auth=FirebaseFirestore.instance;
SignupViewModel({this.auth}) {
    
 }
bool _hidepassword=true;

 bool get hidePassword => _hidepassword;
 
void togglePassword(){
  _hidepassword = !_hidepassword;
    notifyListeners();
}


Future signup({required String email, required String password, required String name})async{
  print('inside method....................');
print(email);

final result=await auth?.createUserWithEmailAndPassword(email: email, password: password);
_currentUser = UserModel(
        id: result!.user!.uid,
        email: email,
        name: name,
      );
 if (result!=null) {


 //MyWidget();
  await createUser(_currentUser!);
      } 
      else {
     
print('signup fail');
       
    } 
}


Future createUser(UserModel user) async {
    try {
      await _usersCollectionReference.doc(
        //auth.currentUser.uid
      user.id

        ).set(
        //user.toJson()
  {
    "name":user.name,
  "email":user.email,

  
  }
        );
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }
    }
}
}


// class MyWidget extends StatefulWidget {
//   const MyWidget({Key? key}) : super(key: key);

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// body: Text('login suceess')

//     );
//   }
// }





