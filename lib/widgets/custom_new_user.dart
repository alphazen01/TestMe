import 'package:flutter/material.dart';

class CustomNewUser extends StatefulWidget {
  const CustomNewUser({ Key? key }) : super(key: key);

  @override
  State<CustomNewUser> createState() => _CustomNewUserState();
}

class _CustomNewUserState extends State<CustomNewUser> {
 
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Center(
                   child: Text(
                      "Add new User",
                      style: TextStyle(
                        fontSize:18,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                 ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
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
                    Transform.translate(
                        offset: Offset(-5,90),
                       child: ElevatedButton(
                           onPressed: () {
                             
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
      ),
    );
  }
}