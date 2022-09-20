
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';


@module
abstract class ServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
 // @lazySingleton
 // AuthService get authService;
  //@lazySingleton
  //FirestoreService get firestoreService;
  //@lazySingleton
  //FirebasePushNotificationService get pushNotificationService;
}