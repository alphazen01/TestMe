

import 'package:demo/widgets/custom_new_user.dart';
import 'package:flutter/material.dart';


class NewUser extends StatefulWidget {
  static final String path="NewUser";
  const NewUser({ Key? key }) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
   int selectedIndex=0;
   List<Color>clr=[
     Colors.red,
     Colors.green,
     Colors.white
   ];
   List<Widget>screens=[
     Container(
        width: double.infinity,
     height: double.infinity,
       color: Colors.red,
     ),
      Container(
         width: double.infinity,
     height: double.infinity,
       color: Colors.green,
     ), 
    CustomNewUser()
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clr[selectedIndex],
      body:screens.elementAt(selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40)
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/Vector (3).png"),
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person) ,
              label: "person"
            ),BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "share"
            ),
          ],
          onTap: (int index){
            setState(() {
              selectedIndex=index;
            });
          },
          currentIndex: selectedIndex,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
        ),
      ),
      
    );
  }
}