import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lastchat/view/dashboard.dart';
import 'package:lastchat/view/loginview.dart';
import 'package:lastchat/view/signupviewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:stacked/stacked.dart';

class SignupView extends StatelessWidget {
// static const routeName = '/signup';
final TextEditingController _emailcontroller=TextEditingController();
final TextEditingController _passwordController=TextEditingController();
final TextEditingController _usernameController=TextEditingController();
 final FocusNode _usernameFocus=FocusNode();
 final FocusNode _emailFocus=FocusNode();
 final FocusNode _passwordFocus=FocusNode();
//FirebaseAuth auth;
// ignore: use_key_in_widget_constructors
 //SignupView({ this.auth});
 //const SignupView({}) : super(key: key);
  void _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);}
  @override
  Widget build(BuildContext context) {
 //SignupViewModel s;
var s;
return ViewModelBuilder<SignupViewModel>.reactive(viewModelBuilder: ()=>SignupViewModel(auth:FirebaseAuth.instance),
 builder: (context,model,child){
  
  
 return Scaffold(
            appBar:AppBar(

title: Text('Signup'),

          
        ),
          body: SingleChildScrollView(
child: Column(mainAxisAlignment:MainAxisAlignment.center
,
  children: [

Card(
elevation: 3,
margin: EdgeInsets.symmetric(horizontal: 20),

child: Padding(padding: EdgeInsets.symmetric(vertical: 10),
child: TextField(
textInputAction: TextInputAction.next,
focusNode: _usernameFocus,
onEditingComplete: ()=>
_fieldFocusChange(context, _usernameFocus, _emailFocus),
style: TextStyle(
fontSize: 20,
color: Colors.blueGrey,


),

enabled:!model.isBusy,
controller: _usernameController,
decoration: InputDecoration(
focusedBorder: InputBorder.none,

border: InputBorder.none,
prefixIcon:Icon(
Icons.person,
color:Colors.blueGrey
),
),

),))
,
SizedBox(height: 10),
Card(
elevation: 3,
margin: EdgeInsets.symmetric(horizontal: 20),
child: Padding(padding: const EdgeInsets.symmetric(vertical: 10),
child: 
TextField(
textInputAction:TextInputAction.next ,
focusNode: _emailFocus,

onEditingComplete: ()=>_fieldFocusChange(context,_emailFocus,_passwordFocus),
 style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    enabled: !model.isBusy,
                    controller:_emailcontroller,
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.blueGrey,   ), ),),
),),
SizedBox(height: 20,),


  Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    focusNode: _passwordFocus,
                    onEditingComplete: () => model.signup(
                      email: _emailcontroller.text,
                      password: _passwordController.text,
                      name: _usernameController.text,
                    ),
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    obscureText: model.hidePassword,
                    enabled: !model.isBusy,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.blueGrey,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => model.togglePassword(),
                        icon: Icon(
                          model.hidePassword ? Icons.enhanced_encryption : Icons.remove_red_eye,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
TextButton(onPressed:() async { 
 //FirebaseAuth auth=await auth.createUserWithEmailAndPassword(email: email, password: password);
  //await Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));
  await model.signup(
                  email: _emailcontroller.text,
                  password: _passwordController.text,
                  name: _usernameController.text,
                );
            await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Dashboard()));
         //   await Navigator.pushReplacement(context, MaterialPageRoute(builder: ))
          //if(s.a==1) {
            //  await Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));
           // }    
 }, child: Text('signup')),
TextButton(onPressed:() {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>login()));
}, 
child: Text('login '))



],
),

   )

        );

























  //////////////////////////////////////////
});

    // return ViewModelBuilder<SignupViewModel>.reactive(
    //   builder: (context, model, child) {
    //     return ViewModelBuilder<SignupViewModel>.nonReactive(
    //   builder: (context, model, child) {
      
    
    //   },
    //   viewModelBuilder: () => SignupViewModel(),
    // );
    
      //}, 
      //viewModelBuilder: ()  => SignupViewModel()
  }
    
    
}
  