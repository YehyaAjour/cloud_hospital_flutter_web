import 'dart:developer';
import 'dart:io';

import 'package:cloud_hospital/model/login_model.dart';
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

  initDio() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }

  loginDoctor({String type, String email, String password}) async {
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
        await SPHelper.spHelper.setToken(response.data['data']['token']);//save token in shared preferences
        await SPHelper.spHelper.setUserType(response.data['data']['user']['type']);//save userType in shared preferences
        authController.getLoginModelData.value =
            LoginModel.fromJson(response.data);
        print(" LoginModel Successfull Stored${response.data}");
        print("token for user is :"+SPHelper.spHelper.getToken());
        print("UserType for user is :"+SPHelper.spHelper.getUserType());

        ProgressDialogUtils.hide();

        myGet.Get.offAllNamed(rootRoute);
        Helper.getSheetSucsses(response.data['message']);
      } else {
        ProgressDialogUtils.hide();
      }
    } on DioError catch (err) {
      ProgressDialogUtils.hide();
      Helper.getSheetError(err.response.data['message']);
      print(err);
    }
  }

  loginPatient({String type, String idNumber, String password}) async {
    try {
      initDio();
      ProgressDialogUtils.show();

      FormData data = FormData.fromMap({
        'type': type,
        'id_number': idNumber,
        'password': password,
      });
      Response response = await dio.post(baseUrl + loginURL,
          data: data,
          options: Options(headers: {"Accept": "application/json"}));
      if (response.statusCode == 200) {
        await SPHelper.spHelper.setToken(response.data['data']['token']);//save token in shared preferences
        await SPHelper.spHelper.setUserType(response.data['data']['patient']['type']);//save userType in shared preferences

        authController.getLoginModelData.value =
            LoginModel.fromJson(response.data);
        print(" LoginModel Successfull Stored${response.data}");
        print(SPHelper.spHelper.getToken());
        print(SPHelper.spHelper.getUserType());

        ProgressDialogUtils.hide();

        myGet.Get.offAllNamed(rootRoute);
        Helper.getSheetSucsses(response.data['message']);
      } else {
        ProgressDialogUtils.hide();
      }
    } on DioError catch (err) {
      ProgressDialogUtils.hide();
      Helper.getSheetError(err.response.data['message']);
      print(err);
    }
  }

  loginAdmin({String type, String email, String password}) async {
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
        await SPHelper.spHelper.setToken(response.data['data']['token']);//save token in shared preferences
        await SPHelper.spHelper.setUserType(response.data['data']['user']['type']);//save userType in shared preferences

        authController.getLoginModelData.value =
            LoginModel.fromJson(response.data);
        print("Admin LoginModel Successfull Stored${response.data}");
        print(SPHelper.spHelper.getToken());
        print(SPHelper.spHelper.getUserType());

        ProgressDialogUtils.hide();

        myGet.Get.offAllNamed(rootRoute);
        Helper.getSheetSucsses(response.data['message']);
      } else {
        ProgressDialogUtils.hide();
      }
    } on DioError catch (err) {
      ProgressDialogUtils.hide();
      Helper.getSheetError(err.response.data['message']);
      print(err);
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
          "password": password,
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
      if (response.statusCode == 200) {
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
    } on DioError catch (err) {
      err.response;
      ProgressDialogUtils.hide();
      print(err);

      Helper.getSheetError(err.response.data['data']);
    }
  }
  registerPatient(
      {String type,
      String name,
      String id_number,
      String password,
      String password_confirmation,
      String gender}) async {
    try {
      initDio();
      ProgressDialogUtils.show();
      FormData data = FormData.fromMap(
        {
          "type": type,
          "name": name,
          "id_number": id_number,
          "password": password,
          "password_confirmation": password_confirmation,
          "gender": gender,
        },
      );
      // log(data.toString());
      Response response = await dio.post(
        baseUrl + registerURL,
        options: Options(headers: {"Accept": "application/json"}),
        data: data,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        authController.getRegisterModelData.value =
            RegisterModel.fromJson(response.data);
        print(" Pationt RegisterModel Successfull Stored${response.data}");
        ProgressDialogUtils.hide();
        myGet.Get.offAllNamed(authenticationPageRoute);
        Helper.getSheetSucsses("تم تسجيل الاشتراك بنجاح");
      } else {
        print(response.statusCode);
        // ProgressDialogUtils.hide();
        // Helper.getSheetError(response.data['data']);
      }
    } on DioError catch (err) {
      err.response;
      ProgressDialogUtils.hide();
      print(err);

      Helper.getSheetError(err.response.data['data']);
    }
  }


  logout() async {
    String token = SPHelper.spHelper.getToken();
    try {
      initDio();
      ProgressDialogUtils.show();
      Response response = await dio.post(
        baseUrl + logoutURL,
        options: Options(headers: {"Accept": "application/json",'Authorization':'Bearer $token'}),

      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(" Logout Successfful ${response.data}");
        SPHelper.spHelper.removeToken();
        ProgressDialogUtils.hide();
        myGet.Get.offAllNamed(authenticationPageRoute);
        Helper.getSheetSucsses(response.data['message']);
      } else {
        print(response.statusCode);
        ProgressDialogUtils.hide();
        Helper.getSheetError('هناك خطأ ما');
      }
    } on DioError catch (err) {
      err.response;
      ProgressDialogUtils.hide();
      print(err);

      Helper.getSheetError('هناك خطأ');
    }
  }



}
