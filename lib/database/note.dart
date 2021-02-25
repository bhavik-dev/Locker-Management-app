class Note {

	int _id;
	String _title;
	String _lockerno;
  String _lockerkeyno;
  String _rollno;
  String _stream;
  String _sphone;
  String _pphone;
  String _emailid;
  String _address;
	String _date;
	int _priority;

	Note(this._title, this._lockerno, this._date, this._priority, this._lockerkeyno, this._rollno, this._stream, this._sphone, this._pphone, [this._emailid, this._address]);

	Note.withId(this._id, this._title, this._lockerno, this._date, this._priority, this._lockerkeyno, this._rollno, this._stream, this._sphone, this._pphone, [this._emailid, this._address]);

	int get id => _id;

	String get title => _title;

	String get lockerno => _lockerno;

  String get lockerkeyno => _lockerkeyno;

  String get rollno => _rollno;

  String get stream => _stream;

  String get sphone => _sphone;

  String get pphone => _pphone;

  String get emailid => _emailid;

  String get address => _address;

	int get priority => _priority;

	String get date => _date;

	set title(String newTitle) {
		if (newTitle.length <= 25) {
			this._title = newTitle;
		}
	}

	set lockerno(String newLockerno) {
		if (newLockerno.length <= 4) {
			this._lockerno = newLockerno;
		}
	}

  set lockerkeyno(String newLockerkeyno) {
		if (newLockerkeyno.length <= 4) {
			this._lockerkeyno = newLockerkeyno;
		}
	}

  set rollno(String newRollno) {
		if (newRollno.length <= 3) {
			this._rollno = newRollno;
		}
	}

  set stream(String newStream) {
		if (newStream.length <= 10) {
			this._stream = newStream;
		}
	}

  set sphone(String newSphone) {
		if (newSphone.length <= 10) {
			this.sphone = newSphone;
		}
	}

  set pphone(String newPphone) {
		if (newPphone.length <= 10) {
			this._pphone = newPphone;
		}
	}

  set emailid(String newEmailid) {
		if (newEmailid.length <= 20) {
			this._emailid = newEmailid;
		}
	}

  set address(String newAddress) {
		if (newAddress.length <= 200) {
			this._address = newAddress;
		}
	}

	set priority(int newPriority) {
		if (newPriority >= 1 && newPriority <= 2) {
			this._priority = newPriority;
		}
	}

	set date(String newDate) {
		this._date = newDate;
	}

	// Convert a Note object into a Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (id != null) {
			map['id'] = _id;
		}
		map['title'] = _title;
		map['lockerno'] = _lockerno;
    map['lockerkeyno'] = _lockerkeyno;
    map['rollno'] = _rollno;
    map['stream'] = _stream;
    map['sphone'] = _sphone;
    map['pphone'] = _pphone;
    map['emailid'] = _emailid;
    map['address'] = _address;
		map['priority'] = _priority;
		map['date'] = _date;

		return map;
	}

	// Extract a Note object from a Map object
	Note.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._title = map['title'];
		this._lockerno = map['lockerno'];
    this._lockerkeyno = map['lockerkeyno'];
    this._rollno = map['rollno'];
    this._stream = map['stream'];
    this._sphone = map['sphone'];
    this._pphone = map['pphone'];
    this._emailid = map['emailid'];
    this._address = map['address'];
		this._priority = map['priority'];
		this._date = map['date'];
	}
}
