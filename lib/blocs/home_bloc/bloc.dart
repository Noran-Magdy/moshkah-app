import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moshkah_app/blocs/home_bloc/events.dart';
import 'package:moshkah_app/blocs/home_bloc/states.dart';
import 'package:moshkah_app/models/home_model/home_model.dart';
import 'package:moshkah_app/shared/remote/Helper/Server_Gate.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  List<String> places = [];
  ServerGate serverGate = ServerGate();
  HomeBloc() : super(HomeStates());

  Stream<HomeStates> mapEventToState(HomeEvents event) async* {
    if (event is HomeEventStart) {
      yield HomeStateStart();

      CustomResponse response = await getHomeData();
      // print(">>>>>>>>>>>>>status ${response.statusCode}");

      if (response.success) {
        HomeModel homeModel = HomeModel.fromJson(response.response.data);

        yield HomeStateSuccess(homeModel: homeModel);

//        response.response.data["data"]
      } else {
        print("from map event to state show error => ");
        print(response.error.toString());

        if (response.errType == 0) {
          yield HomeStateFailed(
            errType: 0,
            // msg: "Network error ",
            msg: response.error['msg'],
          );
        } else if (response.errType == 1) {
          // List<String> errors = [];
          // (response.error['errors'] as Map).forEach((key, value) {
          //   errors.add(value[0]);
          // });
          print(">>>>>>>>>>>>>${response.error.toString()}");
          yield HomeStateFailed(
              errType: 1,
              msg: response.error['msg'],
              field: response.error['field']);
        } else {
          yield HomeStateFailed(
            errType: 2,
            msg: "Server error , please try again",
            // field: response.error['field']
          );
        }
      }
    }
  }

  Future<Map<String, dynamic>> headersMap() async {
    Map<String, dynamic> headersData = {
      // 'Authorization': Prefs.getString("token"),
      "lang": 'ar',
      "Accept": "application/json",
      "security_token": "9HTnTEJqMhIhS3SBAL0B@*mI%v1sOX8klk3B9qWGoU7nIfXjlM"
    };
    return headersData;
  }

  Future<CustomResponse> getHomeData() async {
    serverGate.addInterceptors();
    Map<String, dynamic> headers = await headersMap();
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // inputData.msgToken = preferences.getString("msgToken");

    CustomResponse response = await serverGate.getFromServer(
      url: 'home',
      headers: headers,
    );
    return response;
  }
}
