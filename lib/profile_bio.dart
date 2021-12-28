import 'package:flutter/material.dart';

class ProfileBio extends StatefulWidget {
  static final String path="ProfileBio";

  const ProfileBio({ Key? key }) : super(key: key);

  @override
  State<ProfileBio> createState() => _ProfileBioState();
}

class _ProfileBioState extends State<ProfileBio> {
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
              "Mr. John Doe",
               style: TextStyle(fontSize: 36),
            ),
            SizedBox(
              height: 15,
            ),
             Text(
              "email@email.com",
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






