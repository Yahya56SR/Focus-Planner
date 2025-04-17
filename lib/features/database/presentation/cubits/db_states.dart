abstract class DbStates {}

//initial
class DbInitial extends DbStates {}

// loading
class DbLoading extends DbStates {}

// get data
class DbData extends DbStates {
  final List<Map<String, dynamic>> data;
  DbData(this.data);
}

// create data
class DbCreate extends DbStates {
  final Map<String, dynamic> data;
  DbCreate(this.data);
}

// delete data
class DbDelete extends DbStates {
  final Map<String, dynamic> data;
  DbDelete(this.data);
}

// update data
class DbUpdate extends DbStates {
  final Map<String, dynamic> data;
  DbUpdate(this.data);
}

// errors
class DbError extends DbStates {
  final String message;
  DbError(this.message);
}
