

import 'package:demo/screens/login.dart';
import 'package:demo/screens/sign_up.dart';
// import 'package:demo/sign_up.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static final String path="ProfileScreen";
  const WelcomeScreen({ Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage("assets/pubg.jpg"),
             fit: BoxFit.cover
            )
         ),
         child: Container(
           padding: EdgeInsets.only(top: 280),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center, 
             children: [
              Container(
                child: Center(
                  child: Text(
                    "TestMe",
                    style: TextStyle(
                      fontSize: 53,
                      color: Colors.white
                    ),
                    ),
                ),
              ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: Center(
                          child: Text(
                            "USER  AUTHENTICA",
                            style: TextStyle(

                              color: Colors.white,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child:TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, TextFieldLogIn.path);
                      }, 
                      child:  Text(
                    "Login",
                     style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                     ),
                    ),
                    ),
                ),
                SizedBox(
                  height: 13,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child:  TextButton(
                        onPressed: (){
                         Navigator.pushNamed(context, TextFieldSignUp.path);
                        }, 
                        child:  Text(
                      "Sign up",
                       style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                       ),
                      ),
                      ),
                )  
             ],
           ),
         ),
       ),
     );
  }
}