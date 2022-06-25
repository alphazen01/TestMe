

import 'package:demo/screens/login.dart';
import 'package:demo/new_user.dart';
import 'package:demo/screens/welcome.dart';
import 'package:demo/profile_bio.dart';
import 'package:demo/screens/sign_up.dart';
import 'package:demo/user_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
 Future<void> main()async {
  init();
   SharedPreferences prefs = await SharedPreferences.getInstance();
 var email = prefs.getString("email");

   runApp( MyApp(email: email,));
   }
   Future init()async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

}
class MyApp extends StatelessWidget {
  final String? email;
  const MyApp({
    Key? key,
    this.email
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
     home: email == null? WelcomeScreen():ProfileBio()
    // home: TextFieldLogIn(),
    
    //  initialRoute: WelcomeScreen.path,
    //  routes: {
    //    WelcomeScreen.path:(context)=>WelcomeScreen(),
    //    TextFieldLogIn.path:(context)=>TextFieldLogIn(),
    //    TextFieldSignUp.path:(context)=>TextFieldSignUp(),
    //    ProfileBio.path:(context)=>ProfileBio(),
    //    UserList.path:(context)=>UserList(),
    //    NewUser.path:(context)=>NewUser(),
       
    //  },
    );
  }
}

