import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final String id;
  final void Function(String) onTap;
  const CustomAlert({ Key? key,required this.id,required this.onTap}) : super(key: key);

    @override
  Widget build(BuildContext context) {
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
          onTap(id);
          Navigator.pop(context);
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
}
