import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/new_user.dart';
import 'package:demo/widgets/custom_alert.dart';
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

  List<QueryDocumentSnapshot<Object?>> _user=[];
  Future getUser()async{
   CollectionReference instance=  FirebaseFirestore.instance.collection('users');
   instance .get().then((QuerySnapshot querySnapshot) {
       _user =querySnapshot.docs;
       print("_user:$_user");
       setState(() {
         
       });
    });
  }
  int countTotalUser(List user){
    return user.length;
  }
  @override
  void initState() {
   getUser();
    super.initState();
  }
  Future removeUser(String id)async{
   await FirebaseFirestore.instance.collection('users').doc(id).delete();
   getUser();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        
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
      body:  Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Icons.person,size: 40,),
                      Text(
                        "Total User",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(
                        "${(countTotalUser)(_user)}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
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
                    onTap: (){},
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
                    showDialog(
                        barrierDismissible: false,
                        context: context, 
                        builder:(BuildContext context){
                          return CustomAlert(
                            onTap: removeUser,
                            id: _user[index].id,
                          );
                        } ,
                          );
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
    );
  }
}



