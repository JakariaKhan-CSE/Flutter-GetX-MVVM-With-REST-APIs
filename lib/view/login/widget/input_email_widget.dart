import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_with_restapi/utils/utils.dart';
import 'package:getx_mvvm_with_restapi/view_models/controller/login/login_view_model.dart';

class InputEmailWidget extends StatelessWidget {
  final loginVM = Get.put(LoginViewModel());
  InputEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value, // focus Node means cursor point
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar('Email', 'Enter email');
        }
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, loginVM.emailFocusNode.value,
            loginVM.passwordFocusNode.value);
      },
      decoration: InputDecoration(
          hintText: 'email_hint'.tr, border: OutlineInputBorder()),
    );
  }
}
