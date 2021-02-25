
import 'package:app2/welcome.dart';
import 'package:app2/lists/note_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app2/Animations/FadeAnimation.dart';
//import 'package:page_transition/page_transition.dart';

import 'package:app2/lists/note_detail.dart';
import 'dart:ui';
import 'package:app2/database/note.dart';
import 'package:app2/utils/database_helper.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sqflite/sqflite.dart';
//import 'dart:convert';





class HomePage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {

    return _HomePageState();
  }
}


class _HomePageState extends State<HomePage> {
 
  DatabaseHelper databaseHelper = DatabaseHelper();
	List<Note> noteList;
  int count = 0;

  void navigateToDetail(Note note, String title) async {
	  bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
		  return NoteDetail(note, title);
	  }));

	  if (result == true) {
	  	updateListView();
	  }
  }

  void updateListView() {

		final Future<Database> dbFuture = databaseHelper.initializeDatabase();
		dbFuture.then((database) {

			Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
			noteListFuture.then((noteList) {
				setState(() {
				  this.noteList = noteList;
				  this.count = noteList.length;
				});
			});
		});
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 3, 20, 1),
      body: Container(
        child: Stack(
          children: <Widget>[
            Background(),
            Container(
              child: CustomScrollView(slivers: <Widget>[
                SliverList(
                  delegate: new SliverChildListDelegate.fixed([
                    Column(
                      children: <Widget>[
                        Container(
                          child: Stack(
                            children: <Widget>[
                              FadeAnimation(2.5, Container(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 10.0,
                                    sigmaY: 10.0,
                                  ),
                                  child: Container(
                                    width: 360,height: 200,
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Align(alignment: Alignment.bottomCenter,
                                       child: Container(
                                        child: TextField(
                                        onChanged: (val) {
                                          Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: NoteList()));
                                        },
                                        style: new TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                        prefixIcon: IconButton(
                                          color: Colors.white,
                                          icon: Icon(Icons.arrow_back),
                                          iconSize: 20.0,
                                        onPressed: () => Navigator.of(context).pop(),
                                        ),
                                        contentPadding: EdgeInsets.only(left: 25.0),
                                        hintText: '       Search the Locker no',
                                        hintStyle: TextStyle(color: Colors.black54),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(60), 
                                        ),
                                        ),
                                        ),
                                      ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue[900].withOpacity(.3),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30)
                                      )
                                    ),
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ),
                        SizedBox(height:30,),
                        Container(
                          child: Column(
                            children: <Widget>[
                              FadeIn(2.5,Container(
                                width: 300,
                                height: 200,
                                child: RaisedButton(
                                 
                                  onPressed: (){
                                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: NoteList()));
                                  },
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                  color: Colors.purple[900],
                                  splashColor: Colors.black,
                                  child: Column( // Replace with a Row for horizontal icon + text
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.account_circle, size: 70,),
                                      SizedBox(height: 25,),
                                      Text("Show all Users", style: TextStyle(color: Colors.white, fontSize: 35))
                                    ],
                                  )
                                ),
                              ),),
                              SizedBox(height:15,),
                              FadeIn(3,Container(
                                width: 300,
                                height: 200,
                                child: RaisedButton(
                                  onPressed: (){
                                    navigateToDetail(Note('', '','', 2, '', '', '', '', '', ), 'Add Note');
                                  },
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                  color: Colors.white24,
                                  splashColor: Colors.black,
                                  child: Column( // Replace with a Row for horizontal icon + text
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.add, size: 90,),
                                      SizedBox(height: 15,),
                                      Text("Add User", style: TextStyle(color: Colors.white, fontSize: 35))
                                    ],
                                  )
                                ),
                              ),),
                              SizedBox(height:15,),
                              FadeIn(3.5,Container(
                                width: 300,
                                height: 200,
                                child: RaisedButton(
                                  onPressed: (){
                                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: NoteList()));
                                  },
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                  color: Colors.blue[900],
                                  splashColor: Colors.black,
                                  child: Column( // Replace with a Row for horizontal icon + text
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.delete, size: 70,),
                                      SizedBox(height: 25,),
                                      Text("Delete  User", style: TextStyle(color: Colors.white, fontSize: 35))
                                    ],
                                  )
                                ),
                              ),),
                              SizedBox(height:15,),
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                )
              ],),
            ),
          ],
        )
      ),
    );
  }
}
