import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:member_rkm/app/core/values/show_loading.dart';
import 'package:member_rkm/app/core/values/snackbars.dart';
import 'package:member_rkm/app/data/providers/forgot_password/identify_provider.dart';

class IdentifyController extends GetxController {
  final IdentifyProvider identifyProvider;

  IdentifyController({required this.identifyProvider});

  final formKey = GlobalKey<FormState>().obs;
  final userController = TextEditingController().obs;
  final showAlert = false.obs;
  final status = Rx<int?>(null);

  @override
  void dispose() {
    userController.value.dispose();
    super.dispose();
  }

  void identifyAccount() async {
    final formData = dio.FormData.fromMap({
      'username': userController.value.text,
    });

    showLoading();

    try {
      final response = await identifyProvider.identifyAccount(formData);

      if (response.statusCode == 200) {
        Get.back();
        Get.offAndToNamed(
          '/sendLink',
          arguments: {
            'type': response.data['type'],
            'value': response.data['value'],
          },
        );
      }
    } on dio.DioException catch (e) {
      Get.back();
      failedSnackbar(
        'Ups sepertinya terjadi kesalahan',
        'code:(${e.response?.statusMessage})',
      );
      Get.back();
    }
  }
}
