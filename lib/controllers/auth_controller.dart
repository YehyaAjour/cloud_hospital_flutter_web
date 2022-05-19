




import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/department_doctor_model.dart';
import '../model/register_model.dart';

class AuthController extends GetxController {
  Rx<DepartmentDoctorModel> getDepartmentDoctorModelData = DepartmentDoctorModel().obs;
  Rx<RegisterModel> getRegisterModelData = RegisterModel().obs;

  //============UserType=============
  String accountType = 'patient';

  setAccountType(String accountType) {
    this.accountType = accountType;
    update();
  }
  //============Login=============
  String email, password;
  File profilePicture;

  // var image = File('').obs;
  ImagePicker picker = ImagePicker();

  setEmail(String value) => this.email = value;
  setPassword(String value) => this.password = value;

  validationEmail(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال البريد الإلكتروني";
    }
  }

  validationPassword(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال كلمة المرور";
    }
  }

  //============ReAssignPassword=============
  String passwordRa, confirmPasswordRa;
  setPasswordRa(String value) {
    this.passwordRa = value;
  }

  setConfirmPasswordRa(String value) {
    this.confirmPasswordRa = value;
  }

  validationPasswordRa(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال كلمة المرور";
    }
    if (value.length < 8) {
      return 'يجب ان يكون اكثر من 8 خانات';
    }
  }

  validationConfirmPasswordRa(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال تأكيد كلمة المرور";
    }
    // if (value != this.passwordRa) {
    //   return 'كلمتان المرور غير متطابقتان';
    // }
  }

  //============Register=============
  String phone, emailR, nameR, passwordR, confirmPassword;

  setPhone(String value) {
    this.phone = value;
  }

  setEmailR(String value) {
    this.emailR = value;
  }

  setNameR(String value) {
    this.nameR = value;
  }

  setPasswordR(String value) {
    this.passwordR = value;
  }

  setConfirmPassword(String value) {
    this.confirmPassword = value;
  }

  validationPhoneNumberR(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال رقم الهاتف";
    }
  }

  validationEmailR(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال بريد الكتروني";
    }
    if (!GetUtils.isEmail(value)) {
      return 'البريد المدخل غير صحيح';
    }
  }

  validationNameR(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال الاسم";
    }
  }

  validationPasswordR(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال كلمة المرور";
    }
    if (value.length < 8) {
      return 'يجب ان يكون اكثر من 8 خانات';
    }
  }

  validationConfirmPassword(String value) {
    if (GetUtils.isNull(value) || value.isEmpty) {
      return "الرجاء ادخال تأكيد كلمة المرور";
    }
    // if (value != this.passwordR) {
    //   return 'كلمتان المرور غير متطابقتان';
    // }
  }

 var image ;
  Future setImage(img)async{
    this.image=img;
    update();
  }
}
