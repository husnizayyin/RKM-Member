import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/core/values/show_loading.dart';
import 'package:member_rkm/app/core/values/snackbars.dart';
import 'package:member_rkm/app/data/providers/verify_provider%20copy.dart';
import 'package:open_mail_app/open_mail_app.dart';

class VerifyController extends GetxController {
  final VerifyProvider verifyProvider;

  VerifyController({required this.verifyProvider});

  final pageController = PageController().obs;
  final email = Rx<String?>(null);
  final phoneNumber = Rx<String?>(null);
  final chooseVerify = Rx<String?>(null);
  final hasSent = false.obs;

  final formKeyOTP = GlobalKey<FormState>().obs;
  final otpController = TextEditingController().obs;

  @override
  void onInit() {
    email.value = Get.arguments['email'];
    phoneNumber.value = Get.arguments['phone_user'];
    super.onInit();
  }

  @override
  void onClose() {
    email.value = null;
    phoneNumber.value = null;
    chooseVerify.value = null;
    otpController.value.dispose();
    pageController.value.dispose();
    super.onClose();
  }

  void chooseVerifyAccount() {
    if (chooseVerify.value == 'whatsapp') {
      verifyWhatsApp();
    } else {
      verifyEmail();
    }
  }

  void verifyWhatsApp() async {
    final formData = dio.FormData.fromMap({
      'type': 'wa',
      'value': phoneNumber.value,
    });

    showLoading();

    try {
      final response = await verifyProvider.verifyWhatsApp(formData);

      if (response.statusCode == 200) {
        Get.back();

        pageController.value.animateToPage(
          1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
        );
      }
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar(
          'Verifikasi Gagal',
          'Ups sepertinya terjadi kesalahan. code:${e.response?.statusCode}',
        );
      }
    }
  }

  void verifyOtpWhatsapp() async {
    final formData = dio.FormData.fromMap({
      'value': phoneNumber.value,
      'otp': otpController.value.text,
    });

    showLoading();

    try {
      final response = await verifyProvider.verifyOtpWhatsapp(formData);

      if (response.statusCode == 200) {
        Get.back();

        successSnackbar(
          'Verifikasi Berhasil',
          'Akun anda sudah aktif. Silahkan log in untuk menikmati berbagai fitur menarik',
        );

        Get.offAndToNamed('/login');
      }
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar(
          'Verifikasi Gagal',
          'Ups sepertinya terjadi kesalahan. code:${e.response?.statusCode}',
        );
      }
    }
  }

  void verifyEmail() async {
    final formData = dio.FormData.fromMap({
      'type': 'email',
      'value': email.value,
    });

    showLoading();

    try {
      final response = await verifyProvider.verifyEmail(formData);

      if (response.statusCode == 200) {
        Get.back();
        hasSent.value = true;

        pageController.value.animateToPage(
          1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
        );
      }
    } on dio.DioException catch (e) {
      Get.back();
      if (e.response?.statusCode == 500) {
        failedSnackbar(
          'Verifikasi Gagal',
          'Ups sepertinya terjadi kesalahan. code:${e.response?.statusCode}',
        );
      }
    }
  }

  void openMailApp() async {
    final result = await OpenMailApp.openMailApp();

    if (!result.didOpen && !result.canOpen) {
      Get.dialog(
        const AlertDialog(
          title: Text('No Apps'),
        ),
      );
    } else if (!result.didOpen && result.canOpen) {
      Get.dialog(
        MailAppPickerDialog(mailApps: result.options),
      );
    }
  }
}
