import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_with_restapi/data/response/status.dart';
import 'package:getx_mvvm_with_restapi/res/components/general_exception.dart';
import 'package:getx_mvvm_with_restapi/res/components/internet_exception.dart';
import 'package:getx_mvvm_with_restapi/res/routes/routes_name.dart';
import 'package:getx_mvvm_with_restapi/view_models/controller/home/home_view_models.dart';
import 'package:getx_mvvm_with_restapi/view_models/controller/user_preference/user_prefrence_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());

  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*
         automaticallyImplyLeading: false within the AppBar widget means that the AppBar will not automatically display a "back" button (or other appropriate navigation affordance) on the left side, even if there's a previous route in the navigation stack.
         */
        // aita use korle by defaul leading a je back button thake oita show korbe na
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                userPreference.removeUser().then(
                  (value) {
                    Get.toNamed(RouteName.loginView);
                  },
                );
              },
              icon: Icon(Icons.logout))
        ],
      ),
// be careful Obx otherwise not show updated state
      body: Obx(
        () {
          switch (homeController.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              if (homeController.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {
                    homeController.refreshApi();
                  },
                );
              } else {
                return GeneralExceptionWidget(onPress: () {
                  homeController.refreshApi();
                });
              }
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: homeController.userList.value.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(homeController
                            .userList.value.data![index].avatar
                            .toString()),
                      ),
                      title: Text(homeController
                          .userList.value.data![index].firstName
                          .toString()),
                      subtitle: Text(homeController
                          .userList.value.data![index].email
                          .toString()),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
