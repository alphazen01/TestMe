

import 'package:demo/screens/login.dart';
import 'package:demo/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileBio extends StatefulWidget {
  static final String path="ProfileBio";
  final String?name;
  final String?email;

  

  const ProfileBio({ Key? key,this.name,this.email, }) : super(key: key);

  @override
  State<ProfileBio> createState() => _ProfileBioState();
}

class _ProfileBioState extends State<ProfileBio> {

      bool isLoading=false;
      
 logout()async{
  setState(() {
    isLoading=true;
  });
 await  FirebaseAuth.instance.signOut();
  SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.remove("email");
 
 Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>TextFieldLogIn()));
setState(() {
  isLoading=false;
});
 }
  //  final FirebaseAuth auth = FirebaseAuth.instance;
  // //signout function 
  // signOut() async {
  //   await auth.signOut();
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => TextFieldLogIn()));
  // }
   
   int selectedIndex=0;
  //  List<Color>clr=[
  //    Colors.green,
  //    Colors.green,
  //    Colors.green
  //  ];
  
  @override
  Widget build(BuildContext context) {

    return Scaffold( 
      // backgroundColor: clr[selectedIndex],
      appBar: AppBar(
        actions: [
         isLoading?CircularProgressIndicator(
          color: Colors.red,
         ): ElevatedButton.icon(
            label:Text("Log Out") ,
            onPressed: (){
             logout();
            }, 
            // onPressed: (){
            //   signOut();
            // },
            icon: Icon(Icons.logout),
            
          )
        ],
      ),
      body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "Profile",
                style: TextStyle(fontSize: 24),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("assets/pubg.jpg"),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              widget.name??"Mr. John Doe",
               style: TextStyle(fontSize: 36),
            ),
            SizedBox(
              height: 15,
            ),
             Text(
              widget.name??"email@email.com",
               style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 8,
            ),
             Text(
              "password",
               style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
             Text(
              "Phone: 012345678901",
               style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: double.infinity,
              child: Card(
                child:Center(child: Text(
                  "Created Date & Time: 12/12/2021 06.30 AM",
                  style: TextStyle(fontSize: 16),
                  )
                  ) ,
                // color: Colors.red,
              ),
            ),
             SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.location_on_sharp),
                  Text(
                    "Location",
                    style: TextStyle(fontSize: 18),
                  ),
                  
                ],
              ),
            ),
            Container(
                    height: 227,
                    width: double.infinity,
                    child: Image.asset("assets/image 1.png"),
                  )
          ],
        ),
      ),
      
    ),
    );
  }
}






