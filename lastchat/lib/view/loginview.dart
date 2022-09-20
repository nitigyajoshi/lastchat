

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lastchat/view/dashboard.dart';

class login extends StatefulWidget {

  //const login({ Key? key }) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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

static Future <User?>login({required String email,required String password,required BuildContext context})async{
  FirebaseAuth auth=FirebaseAuth.instance;
User?user;
try{
UserCredential userCredential=await auth.signInWithEmailAndPassword(email: email, password: password);
user=userCredential.user;
}on FirebaseAuthException
catch(e){
if(e.code=='user not found'){
  print('no user found for that email');
}


}
return user;
}



  @override
  Widget build(BuildContext context) {
     return Scaffold(
            appBar:AppBar(

title: Text('Signup'),

          
        ),
          body: SingleChildScrollView(
child: Column(mainAxisAlignment:MainAxisAlignment.center
,
  children: [


SizedBox(height: 10),

Card(
  //controller:
elevation: 3,
margin: EdgeInsets.symmetric(horizontal: 20),
child: Padding(padding: const EdgeInsets.symmetric(vertical: 10),
child: 
TextField(
textInputAction:TextInputAction.next ,
focusNode: _emailFocus,
onEditingComplete: ()=>_fieldFocusChange(context,_emailFocus,_passwordFocus),
 style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    //enabled: !model.isBusy,
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
                   controller: _passwordController,
                    // onEditingComplete: () => model.signup(
                    //   email: _emailcontroller.text,
                    //   password: _passwordController.text,
                    //   name: _usernameController.text,
                    // ),
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                   // obscureText: model.hidePassword,
                   // enabled: !model.isBusy,
                   // controller: _passwordController,
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.blueGrey,
                      ),
                      //suffixIcon: IconButton(

                      //   icon:Icon(Icons.)
                      //  // onPressed: () => model.togglePassword(),
                      // //   icon: Icon(
                      // //  //   model.hidePassword ? Icons.enhanced_encryption : Icons.remove_red_eye,
                      // //     color: Colors.blueGrey,
                      // //   ),
                      // ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
TextButton(onPressed:() async { 
 //FirebaseAuth auth=await auth.createUserWithEmailAndPassword(email: email, password: password);
  //await Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));
 User ?user=await login(email:_emailcontroller.text,password:_passwordController.text,context:context);
 if(user!=null){


await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Dashboard()));
 }
         /**emailcontroller=TextEditingController();
final TextEditingController _passwordController */   
            
          //if(s.a==1) {
            //  await Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));
           // }    
 }, child: Text('login')),




],
),

   )

        );

  }
}