import 'package:get/get.dart';

import '../model/all_doctor_model.dart';
import '../model/department_doctor_model.dart';

class DashboardController extends GetxController{
  Rx<AllDoctorsModel> getAllDoctorModelData = AllDoctorsModel().obs;
  Rx<DepartmentDoctorModel> getDepartmentDoctorModelData = DepartmentDoctorModel().obs;
  //============specialties=============
  String specialties;

  setSpecialties(String value) => this.specialties = value;


  validationSpecialties(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء التخصص";
    }
  }

}