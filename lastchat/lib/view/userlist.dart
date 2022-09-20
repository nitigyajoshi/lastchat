import 'package:flutter/material.dart';

import 'package:lastchat/model/user_model.dart';
import 'package:lastchat/model/userlistmodel.dart';
import 'package:stacked/stacked.dart';

class Userlist extends StatefulWidget {
  Userlist({Key? key}) : super(key: key);

  @override
  State<Userlist> createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  @override
  void initState() {
//m?.futureToRun('''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' ''''''');

    super.initState();
    
  }
   List<UserModel> ?users;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UsersListViewModel>.nonReactive(
      builder: (context, model, child) => Container(
        margin: EdgeInsets.only(top: 20),
        child: ListView.separated(
          separatorBuilder: (_, __) => Divider(
            color: Colors.grey[400],
          ),
          itemCount: users!.length,
          itemBuilder: (ctx, idx) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${users![idx].name[0]}'),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                onPressed: () => model.navigateToChatScreen(users![idx]),
              ),
              title: Text('${users![idx].name}'),
              subtitle: Text('${users![idx].email}'),
              onTap: () => model.navigateToChatScreen(users![idx]),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => UsersListViewModel(),
    );
  }
}

/////////////////////////////////////////////////////////////


// class UsersList extends StatelessWidget {
//   // @override
//   // void initState() {
//   //   UsersListViewModel model=UsersListViewModel();
//   //   model.futureToRun();
//   //   //super.initState();
    
//   // }
//   // const UsersList({
//   //   Key ?key,
//   //   required this.users,
//   // }) : super(key: key);

//   //final 
//  List<UserModel> ?users;

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<UsersListViewModel>.nonReactive(
//       builder: (context, model, child) =>
//       model.data==null?LinearProgressIndicator():
//       Container(
//         margin: EdgeInsets.only(top: 20),
//         child: ListView.separated(
//           separatorBuilder: (_, __) => Divider(
//             color: Colors.grey[400],
//           ),
//           itemCount: model.data!.length,
//           itemBuilder: (ctx, idx) => Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: ListTile(
//               leading: CircleAvatar(
//                 child: Text('${model.data![idx].name[0]}'),
//               ),
//               trailing: IconButton(
//                 icon: Icon(
//                   Icons.arrow_forward_ios,
//                   size: 15,
//                 ),
//                 onPressed: () => null
//                 //model.navigateToChatScreen(users[idx]),
//               ),
//               title: Text('${model.data![idx].name}'),
//               subtitle: Text('${model.data![idx].email}'),
//               onTap: () =>null
//               // model.navigateToChatScreen(users[idx]),
//             ),
//           ),
//         ),
//       ),
//       viewModelBuilder: () => UsersListViewModel(),
//     );
//   }
// }
// class MyWidget extends StatefulWidget {
//   const MyWidget({Key? key}) : super(key: key);

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }
