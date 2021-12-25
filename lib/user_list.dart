import 'package:flutter/material.dart';



class UserList extends StatefulWidget {
  const UserList({ Key? key }) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  int count=0;

  _onCountPressed(){
    setState(() {
      count++;
    });
  }


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
        child: Column(
          children: [
            Text(
              "User List",
              style: TextStyle(
                fontSize:18
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.person),
                      Text(
                        "Total User",
                        style: TextStyle(
                          fontSize: 14
                        ),
                      ),
                      Text(
                        "15",
                        style: TextStyle(
                          fontSize: 14
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: (){}, 
                    child: Row(
                      children: [
                         Icon(Icons.person_outline),
                         Text("Add new User")
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(5)
                      )
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
             TextField(
            decoration: InputDecoration(
              hintText: "Search",
              fillColor: Color(0xffF2F2F7),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: Color(0xffF2F2F7)
                ),
                
                
              ),
              prefixIcon: Icon(Icons.search)
              
          )
          ),
          SizedBox(
            height: 15,
          ),
            Divider(
              thickness: 1,
              color: Colors.grey,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 25,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                leading: 
                    
                CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/pubg.jpg"),
                ),
                title: Text("Name"),
                subtitle: Text("Email"),
                trailing:  ElevatedButton(
                  child: Text(
                    'Remove',
                    style: TextStyle(
                      color: Colors.black
                    ),
                    ), 
                  onPressed: () {
                    _showDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary:Color(0xffF2F2F7).withOpacity(0.52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                )
                );
                }
                ),
               ),
                    
          ],
        ),
      ),
      
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

_showDialog(BuildContext context){
  showDialog(
    barrierDismissible: false,
  context: context, 
  builder:(BuildContext context){
    return AlertDialog(
    title: Text("are you sure ?"),
    
    
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: (){
             Navigator.pop(context);
            }, 
            child: Text("Cancel"),
            style: ElevatedButton.styleFrom(
              primary: Color(0xffC4C4C4).withOpacity(0.52)
            ),
            ),
            ElevatedButton(
        onPressed: (){
          
        }, 
        child: Text("Confirm"),
         style: ElevatedButton.styleFrom(
          primary: Color(0xffEA4242).withOpacity(0.52)
            ),
        ),
        ],
      ),
         
    ],
    );
  } 
  );
}
