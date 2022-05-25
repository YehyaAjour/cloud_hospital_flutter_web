import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/style.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../widgets/custom_text.dart';

/// Example without datasource
class Clientstable extends StatelessWidget {
  DashboardController dashController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 30),
      child: Obx(() => dashController.getAllPationtModelData.value.data == null
          ? Center(child: CircularProgressIndicator())
          : DataTable2(
              columnSpacing: 12,
              horizontalMargin: 12,
              minWidth: 600,
              columns: [
                DataColumn2(
                  label: Text("اسم المريض"),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('رقم الهوية'),
                ),
                DataColumn(
                  label: Text('الجنس'),
                ),
                DataColumn(
                  label: Text('Action'),
                ),
              ],
              rows: List<DataRow>.generate(
                  dashController
                      .getAllPationtModelData.value.data.patients.length,
                  (index) => DataRow(cells: [
                        DataCell(CustomText(
                            text: dashController.getAllPationtModelData.value
                                .data.patients[index].name)),
                        DataCell(CustomText(
                            text: dashController.getAllPationtModelData.value
                                .data.patients[index].idNumber)),
                        DataCell(CustomText(
                            text: dashController.getAllPationtModelData.value
                                .data.patients[index].idNumber)),
                        DataCell(Container(
                            decoration: BoxDecoration(
                              color: light,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: active, width: .5),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: CustomText(
                              text: "Block",
                              color: active.withOpacity(.7),
                              weight: FontWeight.bold,
                            ))),
                      ])))),
    );
  }
}
