import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lastchat/view/chatroom.dart';
import 'package:lastchat/view/dashboardmodel.dart';
import 'package:lastchat/view/userlist.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
   Map<String, dynamic>? userMap;
bool isLoading = false;
final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DashboardViewModel model=DashboardViewModel();

 String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    setState(() {
      isLoading = true;
    });

    await _firestore
        .collection('users')
        .where("email", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);
    });
  }



  @override
  Widget build(BuildContext context) {
       final size = MediaQuery.of(context).size;
    //   bool isloading=false;

    return Scaffold(
      body:isLoading?Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              ),
            ): Column(
              children: [
                SizedBox(
                  height: size.height / 20,
                ),
                Container(
                  height: size.height / 14,
                  width: size.width,
                  alignment: Alignment.center,
                  child:
                   Container(
                    height: size.height / 14,
                    width: size.width / 1.15,
                    child: TextField(
                      controller: _search,
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                ElevatedButton(
                  onPressed: onSearch,
                  child: Text("Search"),
                ),

                SizedBox(
                  height: size.height / 30,
                ),

                userMap != null
                    ? ListTile(
                      title:Text(userMap!['name']),
                      subtitle:Text(userMap!['email']),
                        onTap: () {
                          String roomId = chatRoomId(
                              _auth.currentUser!.displayName!,
                              userMap!['name']);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChatRoom(
                            //    chatRoomId: roomId,
                              //  userMap: userMap!,
                              ),
                            ),
                          );
                        },
                       // leading: Icon(Icons.account_box, color: Colors.black),
                        // title: Text(
                        //   userMap!['name'],
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 17,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                       // ),
                       // subtitle: Text(userMap!['email']),
                       // trailing: Icon(Icons.chat, color: Colors.black),
                      )
                    : Container(),
              ])
        

     // Userlist()==null?LinearProgressIndicator():Userlist() 
      ,appBar:AppBar(leading: IconButton(onPressed: (){
model.signOut(context);


    }, icon: Icon(Icons.logout)),title:Text('Dashboard View',style:TextStyle())),


    );
  }
}