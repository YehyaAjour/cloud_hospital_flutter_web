import 'dart:developer';

import 'package:cloud_hospital/constants/style.dart';
import 'package:cloud_hospital/routing/routes.dart';
import 'package:cloud_hospital/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../apis/auth_apis.dart';
import '../../controllers/auth_controller.dart';
import '../../model/department_doctor_model.dart';
import '../../widgets/action_button.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  final Function onLogInSelected;
  final GlobalKey<FormState> formStateRegister;

  RegisterScreen(
      {@required this.onLogInSelected, @required this.formStateRegister});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthController authController = Get.find();
  String _dropDownValue;
  String _genderDropDownValue;
  List<String>genderList = ['Male','Female'];
  Data dataM = Data();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetBuilder<AuthController>(
      init: AuthController(),
      builder: (controller) {
        return Form(
          key: widget.formStateRegister,
          child: Padding(
            padding: EdgeInsets.all(size.height > 770
                ? 64
                : size.height > 670
                    ? 32
                    : 16),
            child: Center(
              child: Card(
                elevation: 4,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: size.height *
                      (size.height > 770
                          ? 0.7
                          : size.height > 670
                              ? 0.8
                              : 0.9),
                  width: 500,
                  color: Colors.white,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "التسجيل",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: 30,
                              child: const Divider(
                                color: primaryColor,
                                thickness: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            CustomTextFormField(
                              suffixIcon: Icons.person_outline,
                              hint: 'الإسم',
                              onSaved: authController.setNameR,
                              validator: authController.validationNameR,
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            controller.accountType == 'patient'
                                ? CustomTextFormField(
                                    suffixIcon: Icons.document_scanner,
                                    hint: 'رقم الهوية',
                                    onSaved: authController.setIdNumberR,
                                    validator: authController.validationIdNumR,
                                  )
                                : CustomTextFormField(
                                    suffixIcon: Icons.mail_outline,
                                    hint: 'البريد الإلكتروني',
                                    onSaved: authController.setEmailR,
                                    validator: authController.validationEmailR,
                                  ),
                            const SizedBox(
                              height: 32,
                            ),
                            CustomTextFormField(
                              suffixIcon: Icons.lock_outline,
                              hint: 'كلمة السر',
                              onSaved: authController.setPasswordR,
                              validator: authController.validationPasswordR,
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            CustomTextFormField(
                              suffixIcon: Icons.lock_outline,
                              hint: 'تأكيد كلمة السر',
                              onSaved: authController.setConfirmPassword,
                              validator:
                                  authController.validationConfirmPassword,
                            ),
                            // controller.accountType == 'patient'
                            //     ? Column(
                            //         children: [
                            //           CustomText(text: 'إرفاق وثيقة', size: 15),
                            //           const SizedBox(
                            //             height: 10,
                            //           ),
                            //           GestureDetector(
                            //             onTap: () async {
                            //               var image = await ImagePicker()
                            //                   .getImage(
                            //                       source: ImageSource.gallery);
                            //               controller.setImage(image);
                            //             },
                            //             child: controller.image == null
                            //                 ? Container(
                            //                     decoration: BoxDecoration(
                            //                       border: Border.all(
                            //                           color: borderColor),
                            //                       borderRadius:
                            //                           BorderRadius.circular(8),
                            //                     ),
                            //                     width: 300,
                            //                     height: 100,
                            //                     child: Center(
                            //                         child: Icon(Icons.image)),
                            //                   )
                            //                 : Container(
                            //                     decoration: BoxDecoration(
                            //                       border: Border.all(
                            //                           color: borderColor),
                            //                       borderRadius:
                            //                           BorderRadius.circular(8),
                            //                     ),
                            //                     child: Image.network(
                            //                         controller.image.path),
                            //                     width: 300,
                            //                     height: 100,
                            //                   ),
                            //           ),
                            //           const SizedBox(
                            //             height: 15,
                            //           ),
                            //         ],
                            //       )
                            //     : const SizedBox(),
                            const SizedBox(
                              height: 32,
                            ),
                            controller.accountType == 'Doctor'
                                ? selectSpecDropDown()
                                : selectGenderDropDown(gender: genderList),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.setAccountType('Doctor');
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      height: 91,
                                      width: 108,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(22),
                                        border: Border.all(
                                            width: 3,
                                            color: controller.accountType ==
                                                    'Doctor'
                                                ? primaryColor
                                                : Colors.grey),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomSvgImage(
                                            imageName: 'doctor',
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          CustomText(
                                            text: 'طبيب',
                                            size: 13,
                                            color: controller.accountType ==
                                                    'Doctor'
                                                ? primaryColor
                                                : Colors.grey,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.setAccountType('patient');
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      height: 91,
                                      width: 108,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(22),
                                        border: Border.all(
                                          width: 3,
                                          color: controller.accountType ==
                                                  'patient'
                                              ? primaryColor
                                              : Colors.grey,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomSvgImage(
                                            imageName: 'Patient',
                                            color: controller.accountType ==
                                                    'patient'
                                                ? null
                                                : Colors.grey,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          CustomText(
                                            text: 'مريض',
                                            size: 13,
                                            color: controller.accountType ==
                                                    'patient'
                                                ? primaryColor
                                                : Colors.grey,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            const SizedBox(
                              height: 64,
                            ),
                            actionButton("التسجيل", () {
                              if (widget.formStateRegister.currentState
                                  .validate()) {
                                widget.formStateRegister.currentState.save();
                                if (controller.accountType == 'Doctor') {
                                  AuthApis.authApis.registerDoctor(
                                      type: 'doctor',
                                      email: authController.emailR,
                                      name: authController.nameR,
                                      password: authController.passwordR,
                                      speciality_id: _dropDownValue);
                                }else if (controller.accountType == 'patient') {
                                  AuthApis.authApis.registerPatient(
                                      type: 'patient',
                                      id_number: authController.idNumberR,
                                      name: authController.nameR,
                                      password: authController.passwordR,
                                      password_confirmation: authController.confirmPassword,
                                      gender: _dropDownValue=='Male'? 'male':'female');
                                }
                              }
                            }),
                            const SizedBox(
                              height: 32,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "هل لديك حساب?",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    widget.onLogInSelected();
                                  },
                                  child: Row(
                                    children: const [
                                      Text(
                                        "تسجيل الدخول",
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  Widget selectGenderDropDown({List<String> gender}) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: 'Gender',
        ),
        SizedBox(height: 5),
        Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(8),
              border:
              Border.all(color: borderColor)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              hint: _genderDropDownValue == null
                  ? Text('')
                  : Padding(
                padding: EdgeInsets.only(
                    right: 10),
                child: CustomText(
                  text: _genderDropDownValue,
                  size: 16,
                  weight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              isExpanded: true,
              iconSize: 30.0,
              style: TextStyle(
                  fontFamily: "din",
                  color: Colors.black),
              items: gender
                  .map(
                    (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(val),
                  );
                },
              ).toList(),
              onChanged: (val) {
                setState(
                      () {
                    _genderDropDownValue = val;
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
  Widget selectSpecDropDown() {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: 'التخصص',
        ),
        SizedBox(height: 5),
        Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(8),
              border:
              Border.all(color: borderColor)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              hint: _dropDownValue == null
                  ? Text('')
                  : Padding(
                padding: EdgeInsets.only(
                    right: 10),
                child: CustomText(
                  text: dataM.name,
                  size: 16,
                  weight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              isExpanded: true,
              iconSize: 30.0,
              style: TextStyle(
                  fontFamily: "din",
                  color: Colors.black),
              items: authController
                  .getDepartmentDoctorModelData
                  .value
                  .data
                  .map(
                    (val) {
                  return DropdownMenuItem<String>(
                    value: val.id.toString(),
                    child: Text(val.name),
                  );
                },
              ).toList(),
              onChanged: (val) {
                setState(
                      () {
                    _dropDownValue = val;
                    dataM = authController
                        .getDepartmentDoctorModelData
                        .value
                        .data
                        .firstWhere((element) =>
                    element.id
                        .toString() ==
                        val);
                    log(dataM.name.toString());
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
