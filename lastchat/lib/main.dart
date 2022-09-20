
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:lastchat/view/signupview.dart';
//import 'package:stacked_services/stacked_services.dart';
//  import 'main.reflectable.dart' show initializeReflectable;
//flutter pub run build_runner build
//GetIt locator=GetIt.instance;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //initializeReflectable();
  //setupLocator();
  runApp(
    MaterialApp(
      
//navigatorKey: StackedService.navigatorKey,
  // home: AddCardView(), // Used when testing a view
  //initialRoute: SignupViewRoute.name,
  //onGenerateRoute: Router().onGenerateRoute,
    
home: SignupView(),

  ));
}
