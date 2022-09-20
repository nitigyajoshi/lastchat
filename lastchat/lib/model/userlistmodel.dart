

import 'package:firebase_auth/firebase_auth.dart';
import 'package:lastchat/model/user_model.dart';
import 'package:lastchat/service/auth_service.dart';
import 'package:lastchat/service/firestore.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UsersListViewModel extends FutureViewModel<List<UserModel>> {
 // NavigationService _navigationService = locator<NavigationService>();
FirestoreService ?_firestoreService=new FirestoreService();
//FirestoreService();

AuthService ?authService=AuthService();
Future<List<UserModel>>users()async{
print('runned././././..//..//');
return await _firestoreService!.getAllUsersOnce(authService!.currentUser!.id);
}
// Future<List <Map<String,dynamic>>>users()async{
// print('runned././././..//..//');
// return await _firestoreService!.getAllUsersOnce(authService!.currentUser!.id);
// }
// Future<List<UserModel>>futuretorun()async{
// return users();
// }

  void navigateToChatScreen(UserModel friend) {
    // _navigationService.navigateTo(
    //   Routes.chatViewRoute,
    //   arguments: ChatViewArguments(friend: friend),
    // );


  }
  
  @override
  Future<List<UserModel>> futureToRun() {
    return users();
    // TODO: implement futureToRun
    //throw UnimplementedError();
  }
  //  Future<List<Map<String,dynamic>>> futureToRun() {
  //   return users();
  //   // TODO: implement futureToRun
  //   //throw UnimplementedError();
  // }
  //@override
//   Future futureToRun() async {

// return users();
//     // TODO: implement futureToRun
//     throw UnimplementedError();
//   }
}
// class model{
// // NavigationService _navigationService = locator<NavigationService>();
// FirestoreService ?_firestoreService
// =new FirestoreService();
// //FirestoreService();
// AuthService ?authService=AuthService();
// Future<List<UserModel>>users()async{
// print('runned././././..//..//');
// return await _firestoreService!.getAllUsersOnce(authService!.currentUser!.id);
// }
// // Future<List <Map<String,dynamic>>>users()async{
// // print('runned././././..//..//');
// // return await _firestoreService!.getAllUsersOnce(authService!.currentUser!.id);
// // }
// // Future<List<UserModel>>futuretorun()async{
// // return users();
// // }

//   void navigateToChatScreen(UserModel friend) {
//     // _navigationService.navigateTo(
//     //   Routes.chatViewRoute,
//     //   arguments: ChatViewArguments(friend: friend),
//     // );


//   }
  
//   @override
//   Future<List<UserModel>> futureToRun() {
//     return users();
//     // TODO: implement futureToRun
//     //throw Unimplemented

//   }


// }