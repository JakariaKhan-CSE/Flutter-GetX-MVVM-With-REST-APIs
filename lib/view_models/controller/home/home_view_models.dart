import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_mvvm_with_restapi/data/response/status.dart';
import 'package:getx_mvvm_with_restapi/models/home/user_list_model.dart';
import 'package:getx_mvvm_with_restapi/repository/home_repository/home_repository.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();
// obs means observable(state change korle uodate hobe)
// variable declare
  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = ''.obs;

  // set function
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UserListModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void userListApi() {
    _api.userListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError(
      (error, stackTrace) {
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
      },
    );
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);

    _api.userListApi().then(
      (value) {
        setRxRequestStatus(Status.COMPLETED);
        setUserList(value);
      },
    ).onError(
      (error, stackTrace) {
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
      },
    );
  }
}
