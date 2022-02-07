import 'package:moshkah_app/models/single_path_model/single_path_model.dart';

class SinglePathStates {}

class SinglePathStateStart extends SinglePathStates {}

class SinglePathStateSuccess extends SinglePathStates {
  SinglePathModel singlePathModel;

  SinglePathStateSuccess({this.singlePathModel});
}

class SinglePathStateFailed extends SinglePathStates {
  int errType;
  String msg;
  String field;
  SinglePathStateFailed({this.errType, this.msg, String field});
}
