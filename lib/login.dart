import 'package:demo/profile.dart';
import 'package:flutter/material.dart';

class TextFieldLogIn extends StatelessWidget {
  const TextFieldLogIn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16),
         child: Column(
           children: [
             Row(
                  children: [
                    TextButton(
                     onPressed: (){
                       Navigator.pop(context, ProfileScreen);
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
                  height: 35,
                ),
                Container(
                      
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child:TextButton(
                          onPressed: (){}, 
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
                          onPressed: (){}, 
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

    );
  }
}