import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/screens/login.dart';
import 'package:demo/screens/welcome.dart';
import 'package:demo/widgets/custom_alert.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';







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
  bool isHiddenPassword=true;
  bool isLoading=false;
  var imagePath;
  var imageUrl;
  String _value="Male";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController =TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();



  Future signUp()async{
    setState(() {
      isLoading=true;
    });
    try{
    UserCredential userCredential = await
     FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text
  );
  if(userCredential.user != null){
    createProfile(
          nameController.text,
          emailController.text,
          mobileController.text,
          _value.toString(),
          imageUrl.toString(),
        );
    Route route =MaterialPageRoute(
      builder: (ctx)=>TextFieldLogIn());
    Navigator.push(context, route);
    
  }
  }catch(e){
  print("Error:$e");
  }
  setState(() {
    isLoading=false;
  });
  
  }
  
  Future pickedImage()async{
    final ImagePicker _picker = ImagePicker();
    final XFile?image=await _picker.pickImage(
      source: ImageSource.gallery
      );
  if(image !=null){
    setState(() {
      imagePath=File(image.path);
    });
    uploadProfileImage();
  }
  }
  
    Future uploadProfileImage() async {
      String image = imagePath.toString();
      var _image = image.split("/")[6];
      print("image ${_image}");
      Reference reference = FirebaseStorage.instance.ref()
          .child('profileImage/${_image}');
      UploadTask uploadTask = reference.putFile(imagePath);

      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();

    }
    Future createProfile(fullName,email,mobile,gender,profileImage)async{
     CollectionReference users = FirebaseFirestore.instance.collection('users');
    try{
      return users
        .add({
          'full_name': fullName,
          'email': email, 
          'mobile': mobile ,
          'gender': gender,
          'profile_image': profileImage
        })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
      }catch(e){
        print(e);
      } 
    }
   
  
  
  
  
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
                         Navigator.pop(context, WelcomeScreen.path);
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
                         imagePath != null ? CircleAvatar(
                        radius: 60,
                        backgroundImage :  FileImage(imagePath) 
                      ) : CircleAvatar(
                        radius: 60,
                        backgroundImage :  AssetImage("assets/profile_avatar.png")  
                      ),
                           Transform.translate(
                        offset: Offset(
                          -5, 90
                        ),
                        child: ElevatedButton(
                           onPressed: () {
                             pickedImage();
                           
                            
                           },
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              primary: Colors.black 
                             
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
                      controller: nameController,
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
                      height: 12,
                    ),
                     TextField(
                       controller: mobileController,
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
                              value: "Male", 
                              groupValue: _value, 
                              onChanged: (value){
                                 setState(() {
                                   _value="Male";
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
                          value: "Female", 
                          groupValue: _value, 
                          onChanged: (value){
                             setState(() {
                               _value="Female";
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
                   isLoading?CircularProgressIndicator(): Container(
                        
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextButton(
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
                                Navigator.pushNamed(context, TextFieldLogIn.path);
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
