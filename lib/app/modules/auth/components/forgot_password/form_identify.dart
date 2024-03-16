import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_formgroupfield%20copy.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/auth/widgets/forgot_password/identify/controller.dart';


class FormIdentify extends StatelessWidget {
  FormIdentify({super.key});
  final controller = Get.find<IdentifyController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: Get.height * 0.952,
        width: Get.width,
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.formKey.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BaseText(
                    text: 'Lupa Password',
                    size: 20,
                    bold: FontWeight.w600,
                    color: Colors.white,
                  ),
                  const BaseText(
                    text:
                        'Masukkan email/no. telepon anda dengan benar untuk mereset password',
                    color: Colors.white70,
                  ),
                  controller.showAlert.value
                      ? Container(
                          height: 50,
                          width: Get.width,
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info,
                                size: 30,
                                color: Colors.blue.shade800,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: BaseText(
                                  text: controller.status.value == 0
                                      ? 'Akun tidak ditemukan'
                                      : 'Permintaan reset password sudah terkirim ke email anda',
                                  color: Colors.blue.shade800,
                                  bold: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(height: 40),
                  BaseFormGroupFieldAuth(
                    label: 'Email/No. Telepon',
                    hint: 'Masukkan email/no. telepon anda',
                    controller: controller.userController.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email/no. telepon tidak boleh kosong';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: Get.width,
                    child: BaseButton(
                      bgColor: whiteColor,
                      fgColor: blackColor,
                      label: 'Cek Akun',
                      onPressed: () {
                        if (controller.formKey.value.currentState!.validate()) {
                          controller.identifyAccount();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
