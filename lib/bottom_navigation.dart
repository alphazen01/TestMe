import 'package:demo/profile_bio.dart';
import 'package:demo/screens/welcome.dart';
import 'package:demo/user_list.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({ Key? key }) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
   int selectedIndex=1;
     List<Color>clr=[
     Colors.red,
     Colors.white,
     Colors.white
   ];
   List<Widget>screens=[
     WelcomeScreen(),
     UserList(),
     ProfileBio()
    
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: screens.elementAt(selectedIndex),
      
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
                      label: "USERS"
                    ),BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: "PROFILE"
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