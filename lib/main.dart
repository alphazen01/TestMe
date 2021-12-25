

import 'package:demo/add_new_user.dart';
import 'package:demo/login.dart';
import 'package:demo/profile.dart';
import 'package:demo/profile_bio.dart';
import 'package:demo/sign_up.dart';
import 'package:demo/user_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
   MaterialApp(
     debugShowCheckedModeBanner: false,
    //  home: ProfileScreen()
    // home: TextFieldLogIn(),
    // home: TextFieldSignUp(),
    // home: ProfileBio(),
    // home: UserList(),
    // home: AddNewUser(),
    initialRoute: ProfileScreen.path,
    routes: {
      ProfileScreen.path:(context)=>ProfileScreen(),
      TextFieldLogIn.path:(context)=>TextFieldLogIn(),
      TextFieldSignUp.path:(context)=>TextFieldSignUp(),
      ProfileBio.path:(context)=>ProfileBio(),
      UserList.path:(context)=>UserList(),
      AddNewUser.path:(context)=>AddNewUser(),

    },
   )
   );
}

