import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase CRUD"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("todo").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child : Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20),
                  child: CircularProgressIndicator(
                    value: 0.8,
                  )
              )
            );
          }else{
            return ListView(
              children: snapshot.data!.docs.map((todoData){
                return Text(todoData["title"]);
              }).toList(),
            );
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   shape: RoundedRectangleBorder(),
      //   onPressed: (){
      //     showDialog(context: context, builder: (context){
      //       return AlertDialog(
      //         title: Text("Add ToDo"),
      //         content: TextField(
      //           controller: formData,
      //           decoration: InputDecoration(
      //             hintText: "Add a todo"
      //           ),
      //         ),
      //         actions: [
      //           RaisedButton(
      //               onPressed: (){
      //                 Navigator.of(context).pop();
      //               },
      //             child: Text("Cancel"),
      //               ),RaisedButton(
      //               onPressed: (){
      //                 addTodo();
      //               },
      //             child: Text("Add"),
      //               ),
      //         ],
      //       );
      //     });
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
