import 'package:moshkah_app/models/home_model/home_model.dart';

class HomeStates {}

class HomeStateStart extends HomeStates {}

class HomeStateSuccess extends HomeStates {
  HomeModel homeModel;

  HomeStateSuccess({this.homeModel});
}

class HomeStateFailed extends HomeStates {
  int errType;
  String msg;
  String field;
  HomeStateFailed({this.errType, this.msg, String field});
}
