import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/all_doctor_model.dart';
import '../model/all_pation_model.dart';
import '../model/department_doctor_model.dart';

class DashboardController extends GetxController {
  Rx<AllDoctorsModel> getAllDoctorModelData = AllDoctorsModel().obs;
  Rx<DepartmentDoctorModel> getDepartmentDoctorModelData = DepartmentDoctorModel().obs;
  Rx<AllPationtModel> getAllPationtModelData = AllPationtModel().obs;

  //============Admin=============  //============Admin=============  //============Admin=============
  //============specialties=============
  String specialties;

  setSpecialties(String value) => this.specialties = value;

  validationSpecialties(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء التخصص";
    }
  }
//============Pationt=============//============Pationt=============//============Pationt=============
//============PationtDisease=============
  String diseaseName,diseaseDetails;

  setDiseaseName(String value) => this.diseaseName = value;
  setDiseaseDetails(String value) => this.diseaseDetails = value;

  validationDiseaseName(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال اسم المرض";
    }
  }
  validationDiseaseDetails(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء اضافة تفاصيل عن المرض";
    }
  }



 var image;
  setPreviewImage(image){
    this.image =image;
    update();
  }
  // Future<void> openGallary() async {
  //   PickedFile picture =
  //   await ImagePicker.platform.pickImage(source: ImageSource.gallery);
  //
  //   if(picture!=null){
  //
  //     setState(() {
  //       previewImage = picture.path;
  //       pickedFile = PickedFile(picture.path);
  //     });
  //   }
  //
  //
  // }
}
