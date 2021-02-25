
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:app2/database/note.dart';
import 'package:app2/utils/database_helper.dart';
import 'package:app2/lists/note_detail.dart';
import 'package:sqflite/sqflite.dart';


class NoteList extends StatefulWidget {

	@override
  State<StatefulWidget> createState() {

    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {

	DatabaseHelper databaseHelper = DatabaseHelper();
	List<Note> noteList;
	int count = 0;

	@override
  Widget build(BuildContext context) {

		if (noteList == null) {
			noteList = List<Note>();
			updateListView();
		}

    return Scaffold(

	    appBar:  PreferredSize(
        preferredSize: Size(null, 100),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)
            ),
            child: Container(
              color: Colors.blue[900],
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.navigate_before),
                      iconSize: 40.0,
                      color: Colors.white,
                      onPressed: () => Navigator.of(context).pop()
                    ),
                    Text("Lockers List",style: TextStyle(fontSize: 30,color: Colors.white),),
                    Icon(Icons.navigate_before,color: Colors.transparent,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
	    body: getNoteListView(),

    );
  }

  ListView getNoteListView() {

		TextStyle titleStyle = Theme.of(context).textTheme.subhead;

		return ListView.builder(
			itemCount: count,
			itemBuilder: (BuildContext context, int position) {
				return Column(
				  children: <Widget>[
            SizedBox(height: .5,),
				    Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
				    	color: Colors.white,
				    	elevation: 2.0,
				    	child: ListTile(

				    		leading: CircleAvatar(
				    			backgroundColor: getPriorityColor(this.noteList[position].priority),
				    			child: getPriorityIcon(this.noteList[position].priority),
				    		),

				    		title: Text(this.noteList[position].lockerno, style: titleStyle,),

				    		subtitle: Text(this.noteList[position].date),

				    		trailing: GestureDetector(
				    			child: Icon(Icons.delete, color: Colors.grey,),
				    			onTap: () {
				    				_delete(context, noteList[position]);
				    			},
				    		),

				    		onTap: () {
				    			debugPrint("ListTile Tapped");
				    			navigateToDetail(this.noteList[position],'Edit Note');
				    		},
				    	),
				    ),           
				  ],
				);
			},
		);
  }

  // Returns the priority color
	Color getPriorityColor(int priority) {
		switch (priority) {
			case 1:
				return Colors.red;
				break;
			case 2:
				return Colors.green;
				break;

			default:
				return Colors.green;
		}
	}

	// Returns the priority icon
	Icon getPriorityIcon(int priority) {
		switch (priority) {
			case 1:
				return Icon(Icons.play_arrow);
				break;
			case 2:
				return Icon(Icons.keyboard_arrow_right);
				break;

			default:
				return Icon(Icons.keyboard_arrow_right);
		}
	}

	void _delete(BuildContext context, Note note) async {

		int result = await databaseHelper.deleteNote(note.id);
		if (result != 0) {
			_showSnackBar(context, 'Note Deleted Successfully');
			updateListView();
		}
	}

	void _showSnackBar(BuildContext context, String message) {

		final snackBar = SnackBar(content: Text(message));
		Scaffold.of(context).showSnackBar(snackBar);
	}

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
}