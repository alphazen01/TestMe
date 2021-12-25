import 'package:flutter/material.dart';

class AddNewUser extends StatefulWidget {
  const AddNewUser({ Key? key }) : super(key: key);

  @override
  State<AddNewUser> createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  int _value=1;
   int selectedIndex=0;
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
     Container(
        width: double.infinity,
     height: double.infinity,
       color: Colors.orange,
     )
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Center(
                 child: Text(
                    "Add new User",
                    style: TextStyle(
                      fontSize:18
                    ),
                  ),
               ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 35,
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
      //  screens.elementAt(selectedIndex),
     
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