import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/screens/login.dart';
import 'package:demo/widgets/custom_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class NewUser extends StatefulWidget {
  static final String path="NewUser";
  final TextEditingController?controller;
  const NewUser({ Key? key,this.controller}) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}
class _NewUserState extends State<NewUser> {
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
 
  
  Future pickGalleryImage() async {
    final ImagePicker _picker = ImagePicker();
    //   source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imagePath = File(image.path);
      });
      uploadProfileImage();
    }
  }

  Future pickCameraImage() async {
    final ImagePicker _picker = ImagePicker();
    //   source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        imagePath = File(image.path);
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
      setState(() {
        isLoading=true;
      });
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
          .then((value) => Navigator.pop(context));
          
      }catch(e){
        print(e);
      } 
      setState(() {
        isLoading=false;
      });
    }
    

 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Add new User",
            style: TextStyle(
              fontSize:18,
              fontWeight: FontWeight.w500,
              color: Colors.black
            ),
          ), 
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                  SizedBox(
                    height: 20,
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
                        offset: Offset(-5,90),
                       child: ElevatedButton(
                           onPressed: () {
                            //  pickedImage();
                            showDialog(
                              context: context,
                              builder: (ctx) => ImagePickerDialog(
                                pickCameraImage: pickCameraImage,
                                pickGalleryImage: pickGalleryImage,
                              ),
                            );
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
                    height: 20,
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
                            hintText: "Phone",
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
                          height: 15,
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
                            child:TextButton(
                                  onPressed: (){
                                   createProfile(
                                      nameController.text,
                                      emailController.text,
                                      mobileController.text,
                                      _value.toString(),
                                      imageUrl.toString(),
                                    );
                                  }, 
                                  child:  Text(
                                "Save",
                                 style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                 ),
                                ),
                                ),
                               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



