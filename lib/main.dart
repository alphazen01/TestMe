


import 'package:demo/login.dart';
import 'package:demo/new_user.dart';
import 'package:demo/screens/welcome.dart';
import 'package:demo/profile_bio.dart';
import 'package:demo/sign_up.dart';
import 'package:demo/user_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

 Future<void> main()async {
  init();
   runApp(const MyApp());
   }
   Future init()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    //   home: ProfileScreen()
    //  home: TextFieldLogIn(),
    //  home: TextFieldSignUp(),
    //  home: ProfileBio(),
    //  home: UserList(),
    //  home: AddNewUser(),
    
     initialRoute: WelcomeScreen.path,
     routes: {
       WelcomeScreen.path:(context)=>WelcomeScreen(),
       TextFieldLogIn.path:(context)=>TextFieldLogIn(),
       TextFieldSignUp.path:(context)=>TextFieldSignUp(),
       ProfileBio.path:(context)=>ProfileBio(),
       UserList.path:(context)=>UserList(),
       NewUser.path:(context)=>NewUser()

     },
    
    );
  }
}

