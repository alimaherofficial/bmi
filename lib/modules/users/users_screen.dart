import 'package:bmi/models/user/user_model.dart';
import 'package:flutter/material.dart';


// ignore: use_key_in_widget_constructors
// ignore: must_be_immutable
class UsersScreen extends StatelessWidget {
   UsersScreen({ Key? key }) : super(key: key);
  List<UserModel> users = [
    UserModel(id: 1, name: 'ali maher', phone: '+0112911235'),
    UserModel(id: 2, name: 'youssef maher', phone: '+654654654'),
    UserModel(id: 1, name: 'abdo maher', phone: '+46548'),
    UserModel(id: 1, name: 'ali maher', phone: '+0112911235'),
    UserModel(id: 2, name: 'youssef maher', phone: '+654654654'),
    UserModel(id: 1, name: 'abdo maher', phone: '+46548'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 15,
            end: 15,
          ),
          child: Container(
            height: 1.0,
            width: double.infinity,
            color: Colors.grey,
          ),
        ),
        itemCount: users.length,
      ),
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${user.id}',
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  // ignore: unnecessary_string_interpolations
                  '${user.name}',
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '+${user.phone}',
                  style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      );
}
