import 'package:app2/Animations/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:app2/database/note.dart';
import 'package:app2/utils/database_helper.dart';
import 'package:intl/intl.dart';

class NoteDetail extends StatefulWidget {

	final String appBarTitle;
	final Note note;

	NoteDetail(this. note, this.appBarTitle);

	@override
  State<StatefulWidget> createState() {

    return NoteDetailState(this.note, this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {

	static var _priorities = ['High', 'Low'];

	DatabaseHelper helper = DatabaseHelper();

	String appBarTitle;
	Note note;

	TextEditingController titleController = TextEditingController();
	TextEditingController lockernoController = TextEditingController();
  TextEditingController lockerkeynoController = TextEditingController();
  TextEditingController rollnoController = TextEditingController();
  TextEditingController streamController = TextEditingController();
  TextEditingController sphoneController = TextEditingController();
  TextEditingController pphoneController = TextEditingController();
  TextEditingController emailidController = TextEditingController();
  TextEditingController addressController = TextEditingController();

	NoteDetailState(this.note, this.appBarTitle);

	@override
  Widget build(BuildContext context) {

		TextStyle textStyle = TextStyle(color: Colors.white);

		titleController.text = note.title;
		lockernoController.text = note.lockerno;
    lockerkeynoController.text = note.lockerkeyno;
    rollnoController.text = note.rollno;
    streamController.text = note.stream;
    sphoneController.text = note.sphone;
    pphoneController.text = note.pphone;
    emailidController.text = note.emailid;
    addressController.text = note.address;

    return WillPopScope(

	    onWillPop: (){
        moveToLastScreen();
      },

	    child: Scaffold(
	    appBar: AppBar(
		    title: Text(appBarTitle),
		    leading: IconButton(icon: Icon(
				    Icons.arrow_back),
				    onPressed: () {
		    	    // Write some code to control things, when user press back button in AppBar
		    	    moveToLastScreen();
				    }
		    ),
	    ),
      backgroundColor: Colors.transparent,
	    body: Padding(
		    padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
		    child: ListView(
			    children: <Widget>[

			    	// First element
            SizedBox(height: 35,),
            FadeAnimation(1,Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromRGBO(225, 225, 225, 1),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.add_a_photo),
                onPressed: (){},
                iconSize: 50,
              ),
              ),), 
            SizedBox(height: 30,),
				    // Second Element
				    FadeIn(1.2,Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: titleController,
						    style: textStyle,
						    onChanged: (value) {
						    	debugPrint('Something changed in Title Text Field');
						    	updateTitle();
						    },
						    decoration: InputDecoration(
							    labelText: 'Name',
							    labelStyle: textStyle,
							    border: OutlineInputBorder(
								    borderRadius: BorderRadius.circular(15.0)
							    )
						    ),
					    ),
				      ),
				    ),
				    // Third Element
				    FadeIn(1.4,Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: lockernoController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in Description Text Field');
							    updateLockerno();
						    },
						    decoration: InputDecoration(
								    labelText: 'Locker No',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(15.0)
								    )
						    ),
					    ),
				      ),
				    ),

            FadeIn(1.6,Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: lockerkeynoController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in Description Text Field');
							    updateLockerkeyno();
						    },
						    decoration: InputDecoration(
								    labelText: 'Locker Key No',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(15.0)
								    )
						    ),
					    ),
				      ),
				    ),

            FadeIn(2,Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: rollnoController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in Description Text Field');
							    updateRollno();
						    },
						    decoration: InputDecoration(
								    labelText: 'Roll no',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(15.0)
								    )
						    ),
					    ),
				      ),
				    ),

            FadeIn(2.2,Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: streamController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in Description Text Field');
							    updateStream();
						    },
						    decoration: InputDecoration(
								    labelText: 'Enter your Stream',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(15.0)
								    )
						    ),
					    ),
				      ),
				    ),

            FadeIn(2.4,ListTile(
					    title: Center(
					      child: DropdownButton(
							    items: _priorities.map((String dropDownStringItem) {
							    	return DropdownMenuItem<String> (
									    value: dropDownStringItem,
									    child: Text(dropDownStringItem),
								    );
							    }).toList(),

							    style: TextStyle(backgroundColor: Colors.black),

							    value: getPriorityAsString(note.priority),

							    onChanged: (valueSelectedByUser) {
							    	setState(() {
							    	  debugPrint('User selected $valueSelectedByUser');
							    	  updatePriorityAsInt(valueSelectedByUser);
							    	});
							    }
					      ),
					    ),
				    ),
            ),

            FadeIn(2.6,Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: sphoneController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in Description Text Field');
							    updateSphone();
						    },
						    decoration: InputDecoration(
								    labelText: 'Student Phone no',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(15.0)
								    )
						    ),
					    ),
				      ),
				    ),

            FadeIn(1,Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: pphoneController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in Description Text Field');
							    updatePphone();
						    },
						    decoration: InputDecoration(
								    labelText: 'Parent Phone no',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(15.0)
								    )
						    ),
					    ),
				      ),
				    ),

            FadeIn(1.2,Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: emailidController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in Description Text Field');
							    updateEmailid();
						    },
						    decoration: InputDecoration(
								    labelText: 'Enter enail Id',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(15.0)
								    )
						    ),
					    ),
				      ),
				    ),
				    //

            FadeIn(1.4,Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: addressController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in Description Text Field');
							    updateAddress();
						    },
						    decoration: InputDecoration(
								    labelText: 'Address',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(15.0)
								    )
						    ),
					    ),
				      ),
				    ),
				    //
				    // Fourth Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: Row(
						    children: <Widget>[
						    	Expanded(
								    child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
									    color: Theme.of(context).primaryColorDark,
									    textColor: Theme.of(context).primaryColorLight,
									    child: Text(
										    'Save',
										    textScaleFactor: 1.5,
									    ),
									    onPressed: () {
									    	setState(() {
									    	  debugPrint("Save button clicked");
									    	  _save();
									    	});
									    },
								    ),
							    ),

							    Container(width: 5.0,),

							    Expanded(
								    child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
									    color: Theme.of(context).primaryColorDark,
									    textColor: Theme.of(context).primaryColorLight,
									    child: Text(
										    'Delete',
										    textScaleFactor: 1.5,
									    ),
									    onPressed: () {
										    setState(() {
											    debugPrint("Delete button clicked");
											    _delete();
										    });
									    },
								    ),
							    ),

						    ],
					    ),
				    ),

			    ],
		    ),
	    ),

    ));
  }

  void moveToLastScreen() {
		Navigator.pop(context, true);
  }

	// Convert the String priority in the form of integer before saving it to Database
	void updatePriorityAsInt(String value) {
		switch (value) {
			case 'High':
				note.priority = 1;
				break;
			case 'Low':
				note.priority = 2;
				break;
		}
	}

	// Convert int priority to String priority and display it to user in DropDown
	String getPriorityAsString(int value) {
		String priority;
		switch (value) {
			case 1:
				priority = _priorities[0];  // 'High'
				break;
			case 2:
				priority = _priorities[1];  // 'Low'
				break;
		}
		return priority;
	}

	// Update the title of Note object
  void updateTitle(){
    note.title = titleController.text;
  }

	// Update the description of Note object
	void updateLockerno() {
		note.lockerno = lockernoController.text;
	}

  void updateLockerkeyno(){
    note.lockerkeyno = lockerkeynoController.text;
  }

  void updateRollno(){
    note.rollno = rollnoController.text;
  }

  void updateStream(){
    note.stream = streamController.text;
  }

  void updateSphone(){
    note.sphone = sphoneController.text;
  }

  void updatePphone(){
    note.pphone = pphoneController.text;
  }

  void updateEmailid(){
    note.emailid = emailidController.text;
  }

  void updateAddress(){
    note.address = addressController.text;
  }
	// Save data to database
	void _save() async {

		moveToLastScreen();

		note.date = DateFormat.yMMMd().format(DateTime.now());
		int result;
		if (note.id != null) {  // Case 1: Update operation
			result = await helper.updateNote(note);
		} else { // Case 2: Insert Operation
			result = await helper.insertNote(note);
		}

		if (result != 0) {  // Success
			_showAlertDialog('Status', 'Note Saved Successfully');
		} else {  // Failure
			_showAlertDialog('Status', 'Problem Saving Note');
		}

	}

	void _delete() async {

		moveToLastScreen();

		// Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
		// the detail page by pressing the FAB of NoteList page.
		if (note.id == null) {
			_showAlertDialog('Status', 'No Note was deleted');
			return;
		}

		// Case 2: User is trying to delete the old note that already has a valid ID.
		int result = await helper.deleteNote(note.id);
		if (result != 0) {
			_showAlertDialog('Status', 'Note Deleted Successfully');
		} else {
			_showAlertDialog('Status', 'Error Occured while Deleting Note');
		}
	}

	void _showAlertDialog(String title, String message) {

		AlertDialog alertDialog = AlertDialog(
			title: Text(title),
			content: Text(message),
		);
		showDialog(
				context: context,
				builder: (_) => alertDialog
		);
	}

}
