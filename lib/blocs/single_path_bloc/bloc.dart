import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moshkah_app/blocs/single_path_bloc/events.dart';
import 'package:moshkah_app/blocs/single_path_bloc/states.dart';
import 'package:moshkah_app/models/single_path_model/single_path_model.dart';
import 'package:moshkah_app/shared/constant/variables.dart';
import 'package:moshkah_app/shared/remote/Helper/Server_Gate.dart';

class SinglePathBloc extends Bloc<SinglePathEvents, SinglePathStates> {
  List<String> places = [];
  ServerGate serverGate = ServerGate();
  SinglePathBloc() : super(SinglePathStates());

  Stream<SinglePathStates> mapEventToState(SinglePathEvents event) async* {
    if (event is SinglePathEventStart) {
      yield SinglePathStateStart();

      CustomResponse response = await sendToSinglePath(
          //collectData: event.collectData,
          );
      // print(">>>>>>>>>>>>>status ${response.statusCode}");

      if (response.success) {
        SinglePathModel singlePathModel =
            SinglePathModel.fromJson(response.response.data);

        yield SinglePathStateSuccess(singlePathModel: singlePathModel);

//        response.response.data["data"]
      } else {
        print("from map event to state show error => ");
        print(response.error.toString());

        if (response.errType == 0) {
          yield SinglePathStateFailed(
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
          yield SinglePathStateFailed(
              errType: 1,
              msg: response.error['msg'],
              field: response.error['field']);
        } else {
          yield SinglePathStateFailed(
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

  Future<CustomResponse> sendToSinglePath(
      //  @required SinglePathCollectData collectData,
      ) async {
    serverGate.addInterceptors();
    Map<String, dynamic> headers = await headersMap();
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // inputData.msgToken = preferences.getString("msgToken");

    CustomResponse response = await serverGate.getFromServer(
      url: 'path?id=$pathId',
      headers: headers,
    );
    return response;
  }
}
