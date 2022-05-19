import 'dart:developer';
import 'dart:io';

import 'package:cloud_hospital/model/register_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as myGet;

import '../controllers/auth_controller.dart';
import '../model/department_doctor_model.dart';
import '../routing/routes.dart';
import '../services/sp_helper.dart';
import '../utils/constants.dart';
import '../utils/helper.dart';
import '../utils/progress_dialog_utils.dart';


class AuthApis {
  AuthApis._();

  static AuthApis authApis = AuthApis._();
  Dio dio;

  AuthController authController = myGet.Get.find();
  // ProfileController profileController = myGet.Get.find();

  initDio() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }

  login(String type,String email, String password) async {
    try {
      initDio();
      ProgressDialogUtils.show();

      FormData data = FormData.fromMap({
        'type': type,
        'email': email,
        'password': password,
      });
      Response response = await dio.post(baseUrl + loginURL,
          data: data,
          options: Options(headers: {"Accept": "application/json"}));
      if (response.statusCode == 200) {
        await SPHelper.spHelper.setToken(response.data['user']['api_token']);

        ProgressDialogUtils.hide();

        print(response.data['user']['api_token']);

        myGet.Get.offAllNamed(rootRoute);
        Helper.getSheetSucsses(response.data['msg']);
      } else {
        ProgressDialogUtils.hide();
        Helper.getSheetError(response.data['msg']);
      }
    } catch (err) {
      ProgressDialogUtils.hide();
      print(err);
    }
  }
  getDepartment() async {
    try {
      initDio();
      Response response = await dio.get(
        baseUrl + departmentURL,

      );
      if (response.statusCode == 200) {
        authController.getDepartmentDoctorModelData.value =
            DepartmentDoctorModel.fromJson(response.data);
        print(" DepartmentDoctorModel ${response.data}");
      } else {}
    } catch (err) {
      print("DepartmentDoctorModel  $err");
    }
  }

  registerDoctor(
      {String type,
      String name,
      String email,
      String password,
      String speciality_id}) async {
    try {
      initDio();
       ProgressDialogUtils.show();
      FormData data = FormData.fromMap(
        {
          "type": type,
          "name": name,
          "email": email,
          "password":password,
          "speciality_id": speciality_id,
        },
      );
      // log(data.toString());
      Response response = await dio.post(
        baseUrl + registerURL,
        options: Options(headers: {"Accept": "application/json"}),
        data: data,
      );
      print(response.statusCode);
      if (response.statusCode==200) {
        authController.getRegisterModelData.value =
            RegisterModel.fromJson(response.data);
        print(" RegisterModel Successfull Stored${response.data}");
        ProgressDialogUtils.hide();
        myGet.Get.offAllNamed(authenticationPageRoute);
        Helper.getSheetSucsses("تم تسجيل الاشتراك بنجاح");
      } else {
         print(response.statusCode);
        // ProgressDialogUtils.hide();
        // Helper.getSheetError(response.data['data']);
      }
    }on DioError catch (err) {
      err.response;
      ProgressDialogUtils.hide();
      print(err);

      Helper.getSheetError(err.response.data['data']);
    }
  }

  // logOut() async {
  //   try {
  //     initDio();
  //     ProgressDialogUtils.show();
  //     String token = SPHelper.spHelper.getToken();
  //
  //     Response response = await dio.post(
  //       baseUrl + logoutUrl,
  //       options: Options(
  //         headers: {
  //           'auth-token': token,
  //         },
  //       ),
  //     );
  //
  //     if (response.data['status']) {
  //       ProgressDialogUtils.hide();
  //       myGet.Get.offAll(() => LoginScreen());
  //       SPHelper.spHelper.setToken("");
  //       Helper.getSheetSucsses(response.data['msg']);
  //     } else {
  //       ProgressDialogUtils.hide();
  //     }
  //   } catch (err) {
  //     ProgressDialogUtils.hide();
  //   }
  // }

}
