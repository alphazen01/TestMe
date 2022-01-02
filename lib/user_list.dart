import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/new_user.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  static final String path="UserList";
  const UserList({ Key? key }) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
   int count=0;

  // ignore: unused_element
  _onCountPressed(){
    setState(() {
      count++;
    });
  }

  List _user=[];
  Future getUser()async{
   CollectionReference instance=  FirebaseFirestore.instance.collection('users');
   instance .get().then((QuerySnapshot querySnapshot) {
       _user =querySnapshot.docs;
       print("_user:$_user");
    });
  }
  @override
  void initState() {
   getUser();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios,color: Colors.blue,),
              Text(
              "Back",
              style: TextStyle(
                color:Colors.blue,
              ),
            ), 
            ],
          ),
        ),
        centerTitle: true,
        title: Text(
            "User List",
            style: TextStyle(
              fontSize:18,
              color:Colors.black,
              fontWeight: FontWeight.w700
            ),
          ), 
      ),
      body:  Column(
        children: [
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
                  onPressed: (){
                     Navigator.pushNamed(context, NewUser.path);
                  },
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
              itemCount: _user.length,
              itemBuilder: (BuildContext context,int index){
                return ListTile(
              leading: 
                  
              CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage("${_user[index]["profile_image"]}")
              ),
              title: Text("${_user[index]["full_name"]}"),
              subtitle: Text("${_user[index]["email"]}"),
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
  } ,
    );
  }
