


import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_hospital/model/all_pation_model.dart';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as myGet;
import 'package:image_picker/image_picker.dart';

import '../controllers/dashboard_controller.dart';
import '../model/all_doctor_model.dart';
import '../model/department_doctor_model.dart';
import '../services/sp_helper.dart';
import '../utils/constants.dart';
import '../utils/helper.dart';
import '../utils/progress_dialog_utils.dart';

class DashboardApis {
  DashboardApis._();

  static DashboardApis dashboardApis = DashboardApis._();
  Dio dio;

  DashboardController dashboardController = myGet.Get.find();

  initDio() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }



  getAllDoctor() async {
    try {
      String token = SPHelper.spHelper.getToken();
      initDio();


      Response response = await dio.get(
        baseUrl + allPationtURL,
        options: Options(headers: {"Accept": "application/json",'Authorization':'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        dashboardController.getAllPationtModelData.value =
            AllPationtModel.fromJson(response.data);
        print(" AllPationtModel Successful Stored +${response.data.toString()}");
        ProgressDialogUtils.hide();
      } else {
        ProgressDialogUtils.hide();
      }
    } catch (err) {
      ProgressDialogUtils.hide();
      print("AllPationtModel ERROR  $err");
    }
  }

  getAllPation() async {
    try {
      String token = SPHelper.spHelper.getToken();
      initDio();


      Response response = await dio.get(
        baseUrl + allDoctorURL ,
        options: Options(headers: {"Accept": "application/json",'Authorization':'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        dashboardController.getAllDoctorModelData.value =
            AllDoctorsModel.fromJson(response.data);
        print(" AllDoctorsModel Successful Stored ${response.data}");
        ProgressDialogUtils.hide();
      } else {
        ProgressDialogUtils.hide();
      }
    } catch (err) {
      ProgressDialogUtils.hide();
      print("DepartmentDoctorModel  $err");
    }
  }




  addPationtDisease({String name, String description, image}) async {
    try {
      Uint8List uint8list= await image.readAsBytes();
      List<int>list =uint8list.cast();
      String token = SPHelper.spHelper.getToken();
      initDio();
      ProgressDialogUtils.show();
      FormData data = FormData.fromMap({
        'name': name,
        'description': description,
         'file':image!=null?  MultipartFile.fromBytes(list,filename: 'file.png' ):null,
      });
      Response response = await dio.post(
        baseUrl + addDiseasesURL,
        data: data,
        options: Options(headers: {"Accept": "application/json",'Authorization':'Bearer $token'}),

      );

      if (response.statusCode==201) {
        // print(" addPationtDisease Successful Stored ${response.data.toString()}");
        // await getDepartment();
        ProgressDialogUtils.hide();
        myGet.Get.back();
        Helper.getSheetSucsses(response.data['message']);
          print(" addSpecialties Successful Stored ${response.data.toString()}");

      } else {
        ProgressDialogUtils.hide();
        Helper.getSheetError("هناك خطأ في إضافة مرض");
      }
    } catch (err) {
      ProgressDialogUtils.hide();
      Helper.getSheetError(err.response.data['message']);
      print("addPationtDisease Error  $err");
    }
  }






  addSpecialties(String name) async {
    try {
      String token = SPHelper.spHelper.getToken();
      initDio();
      ProgressDialogUtils.show();
      FormData data = FormData.fromMap({
        'name': name,
      });
      Response response = await dio.post(
        baseUrl + addSpecialitiesURL,
          data: data,
        options: Options(headers: {"Accept": "application/json",'Authorization':'Bearer $token'}),

      );

      if (response.statusCode==201) {
        print(" addSpecialties Successful Stored ${response.data}");
        await getDepartment();
        ProgressDialogUtils.hide();
        myGet.Get.back();
        Helper.getSheetSucsses(response.data['message']);
       //  print(" addSpecialties Successful Stored ${response.data}");

      } else {
        ProgressDialogUtils.hide();
        Helper.getSheetError("هناك خطأ في إضافة تخصص");
      }
    } catch (err) {
      ProgressDialogUtils.hide();
      Helper.getSheetError(err.response.data['message']);
      print("addSpecialties Error  $err");
    }
  }

  getDepartment() async {
    try {
      initDio();
      Response response = await dio.get(
        baseUrl + departmentURL,
      );
      if (response.statusCode == 200) {
        dashboardController.getDepartmentDoctorModelData.value =
            DepartmentDoctorModel.fromJson(response.data);
        print(" DepartmentDoctorModel ${response.data}");
      } else {}
    } catch (err) {
      print("DepartmentDoctorModel  $err");
    }
  }




}
