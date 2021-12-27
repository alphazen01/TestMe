import 'package:demo/login.dart';
import 'package:demo/profile_bio.dart';
import 'package:demo/user_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TextFieldSignUp extends StatefulWidget {
  static final String path="TextFieldSignUp";
  final TextEditingController?controller;
  final String?onTap;
  const TextFieldSignUp({ Key? key,
  this.controller,this.onTap }) : super(key: key);
  
  @override
  State<TextFieldSignUp> createState() => _TextFieldSignUpState();
}

class _TextFieldSignUpState extends State<TextFieldSignUp> {
  bool isLoading=false;
  Future signUp()async{
    setState(() {
      isLoading=true;
    });
    try{
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text
  );
  if(userCredential.user != null){
    Route route =MaterialPageRoute(builder: (ctx)=>TextFieldLogIn());
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
  int _value=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                      children: [
                        TextButton(
                         onPressed: (){
                           
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
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 32
                      ),
                    ),
                    Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topLeft,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(
                              "assets/pubg.jpg",
                            ),
                          ),
                          Positioned(
                            bottom: -5,
                            left: 0,
                            child: ClipOval(
                              child: Material(
                                color: Colors.red,
                                child: InkWell(
                                  onTap: (){},
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage("assets/bx_bxs-camera.png"),
                                  ),
                                ),
                              ),
                            ),
                          )
                         
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Name",
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
                       obscureText: true,
                       obscuringCharacter: "*",
                       decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: ClipOval(
                          child: Material( 
                            color:  Color(0xffF2F2F7),
                            child: InkWell(
                              child: IconButton(
                                onPressed: (){}, 
                                icon: Icon(Icons.visibility)
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
                      height: 12,
                    ),
                     TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Mobile Number",
                        fillColor: Color(0xffF2F2F7),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                          color: Color(0xffF2F2F7)
                          ),
                        ),
                        suffixIcon: TextButton(
                          onPressed: (){}, 
                          child: Text('Verify')
                      )
                    )
                    ),
                    Container(
                      child: Text(
                        "Gender",
                        style: TextStyle(
                          fontSize: 19
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 1, 
                              groupValue: _value, 
                              onChanged: (value){
                                 setState(() {
                                   _value=1;
                                 });
                              }
                            ),
                            SizedBox(
                          width: 10,
                        ),
                            Text("Male")
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Row(
                      children: [
                        Radio(
                          value: 2, 
                          groupValue: _value, 
                          onChanged: (value){
                             setState(() {
                               _value=2;
                             });
                          }
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Female")
                      ],
                    ),  
                      ],
                    ),
                    Container(
                        
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: isLoading?CircularProgressIndicator():TextButton(
                              onPressed: (){
                                signUp();
                              }, 
                              child:  Text(
                            "Sign up",
                             style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                             ),
                            ),
                            ),
                           ),
                             Row(
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontSize: 16
                              ),
                            ),
                            TextButton(
                              onPressed: (){
                                Navigator.pushNamed(context, ProfileBio.path);
                              }, 
                              child: Text(
                                "Login",
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