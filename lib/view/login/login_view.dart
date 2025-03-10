import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_with_restapi/view/login/widget/input_email_widget.dart';
import 'package:getx_mvvm_with_restapi/view/login/widget/input_password_widget.dart';
import 'package:getx_mvvm_with_restapi/view/login/widget/login_button_widget.dart';
import 'package:getx_mvvm_with_restapi/view_models/controller/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('login'.tr), // means translation
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: _formkey, //_formkey underscore means private
                child: Column(
                  children: [
                    InputEmailWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    InputPasswordWidget(),
                  ],
                )),
            const SizedBox(
              height: 40,
            ),
            LoginButtonWidget(
              formKey: _formkey,
            )
          ],
        ),
      ),
    );
  }
}
