import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_with_restapi/models/login/user_model.dart';
import 'package:getx_mvvm_with_restapi/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm_with_restapi/res/routes/routes_name.dart';
import 'package:getx_mvvm_with_restapi/utils/utils.dart';
import 'package:getx_mvvm_with_restapi/view_models/controller/user_preference/user_prefrence_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();
  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    // login a hit korlei atfirst loading show korbe
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text
    };

    _api.loginApi(data).then(
      (value) {
        loading.value =
            false; // loading off hoye jabe (server theke response ashar pore)
        if (value['error'] == 'user not found') {
          Utils.snackBar('Login', value['error']);
        } else {
          UserModel userModel = UserModel(token: value['token'], isLogin: true);

          userPreference.saveUser(userModel).then(
            (value) {
              // releasing resouces because we are not going to use this
              Get.delete<LoginViewModel>();
              // home page a navigate korsi
              Get.toNamed(RouteName.homeView)!.then(
                (value) {},
              );
              Utils.snackBar('Login', 'Login Successfully');
            },
          ).onError(
            (error, stackTrace) {},
          );
        }
      },
    ).onError(
      (error, stackTrace) {
        loading.value = false;
        Utils.snackBar('Error', error.toString());
      },
    );
  }
}
