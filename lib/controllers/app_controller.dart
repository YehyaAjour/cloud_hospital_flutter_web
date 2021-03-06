import 'package:cloud_hospital/model/all_doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class AppController extends GetxController{
  //-----------------------------------DatePicker--------------------------------
  DateTime selectedDate = DateTime.now();
  TextEditingController fromDateController = TextEditingController();

  Future fromDateFun(BuildContext context) async {
    final DateTime selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendar,
    );
    if (selected != null && selected != selectedDate) {
      fromDateController.text = DateFormat.yMMMd().format(selected);
      update();
    }
  }
  //============ TimePicker =============
  TextEditingController timeController = TextEditingController();

  selectTime(BuildContext context) async {
    TimeOfDay selectedTime = TimeOfDay.now();

    final TimeOfDay timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if(timeOfDay != null && timeOfDay != selectedTime)
    {
        selectedTime = timeOfDay;
        timeController.text = "${selectedTime.hour}:${selectedTime.minute}";
        update();
    }
  }


  Doctors doctorValue;
  setDoctorValue(value){
    doctorValue = value ;
    update();
  }
}