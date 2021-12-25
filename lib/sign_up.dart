import 'package:flutter/material.dart';

class TextFieldSignUp extends StatefulWidget {
  const TextFieldSignUp({ Key? key }) : super(key: key);

  @override
  State<TextFieldSignUp> createState() => _TextFieldSignUpState();
}

class _TextFieldSignUpState extends State<TextFieldSignUp> {
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
                        alignment: Alignment.topLeft,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(
                              "assets/pubg.jpg",
                            ),
                          ),
                          Positioned(
                           top: 90,
                            child: CircleAvatar(
                              radius: 20,
                              // backgroundImage: AssetImage("assets/"),
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
                        child:TextButton(
                              onPressed: (){}, 
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
                              onPressed: (){}, 
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