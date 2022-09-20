
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lastchat/model/user_model.dart';
import 'package:lastchat/service/auth_service.dart';
import 'package:lastchat/service/firestore.dart';
import 'package:lastchat/view/loginview.dart';
import 'package:lastchat/view/signupview.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class DashboardViewModel extends StatefulWidget {
  FirebaseAuth auth=FirebaseAuth.instance;

  // UserModel get user => _authService.currentUser;
AuthService _authService=AuthService();
FirestoreService service=FirestoreService();
  //final Firestore _firestoreService = FirestoreService();
  //final NavigationService _navigationService = NavigationServi
   UserModel? get user => _authService.currentUser;
  FirebaseFirestore _firestore=FirebaseFirestore.instance;
  //User get user => auth.currentUser;

  Future<List<UserModel>> users() async {
    return await service.getAllUsersOnce(_authService.currentUser!.id);
  }

 @override
  Future<List<UserModel>> futureToRun() {
    return users();
  }

  void signOut(BuildContext context) {
    auth.signOut();
   
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>login()));
  }
  
  // @override
  // Future<List> futureToRun() {

  //   // TODO: implement futureToRun
  //   throw UnimplementedError();
  // }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}