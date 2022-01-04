
import 'package:demo/bottom_navigation.dart';
import 'package:demo/screens/welcome.dart';
import 'package:demo/screens/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TextFieldLogIn extends StatefulWidget {
  static final String path="TextFieldLogIn";
  final VoidCallback?onTap;
  
  const TextFieldLogIn({ Key? key,this.onTap,}) : super(key: key);

  @override
  State<TextFieldLogIn> createState() => _TextFieldLogInState();
}

class _TextFieldLogInState extends State<TextFieldLogIn> {
 bool isHiddenPassword=true;
 bool isLoading=false;
  Future signIn()async{
    setState(() {
      isLoading=true;
    });
    try{
    UserCredential userCredential = await
    FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text
  );
  if(userCredential.user != null){
    Route route =MaterialPageRoute(builder: (ctx)=>BottomNavigation());
    Navigator.push(context, route);
    
  }
  }catch(e){
  print("Error:$e");
  }
  setState(() {
    isLoading=false;
  });
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
       child: SafeArea(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16),
           child: Column(
             children: [
               Row(
                    children: [
                      TextButton(
                       onPressed: (){
                         Navigator.pop(context, WelcomeScreen);
                       }, 
                       child: Row(
                         children: [
                           Icon(Icons.arrow_back_ios),
                           Text("Back"),
                         ],
                       ),
                       ),
                    ],
                  ),
                SizedBox(
                  height: 52,
                ),
                  Container(
                    height: 41,
                    width: double.infinity,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 32
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 52,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter your email address and",
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                        Text(
                          "password to access your account",
                          style: TextStyle(
                          fontSize: 20
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      fillColor: Color(0xffF2F2F7),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          color: Color(0xffF2F2F7)
                        ),
                        
                      ),
                      
                  )
                  ),
                  SizedBox(
                    height: 12,
                  ),
                   TextField(
                     controller: passwordController,
                     keyboardType: TextInputType.text,
                     obscureText: isHiddenPassword,
                     obscuringCharacter: "*",
                     decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: ClipOval(
                        child: Material( 
                          color:  Color(0xffF2F2F7),
                          child: InkWell(
                            child: IconButton(
                              onPressed: (){
                                setState(() {
                                 isHiddenPassword=!isHiddenPassword;
                                });
                              }, 
                              icon: Icon(
                               isHiddenPassword? Icons.visibility_off_rounded
                               :Icons.visibility,
                               )
                            ),
                          ),
                        ),
                      ),
                      fillColor: Color(0xffF2F2F7),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(
                          color: Color(0xffF2F2F7)
                        ),
                        borderRadius: BorderRadius.circular(6), 
                      ), 
                  )
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  isLoading?CircularProgressIndicator():Container(
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextButton(
                            onPressed: (){
                             
                            signIn();
                             
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
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text(
                            "Don’t have an account?",
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, TextFieldSignUp.path);
                            }, 
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                              fontSize: 16
                            ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white
                            ),
                          )
                        ],
                      )
             ],
           ),
         ),
       ),
     ),

    );
  }
}