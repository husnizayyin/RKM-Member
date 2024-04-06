import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_rkm/app/components/base_button.dart';
import 'package:member_rkm/app/components/base_formgrouppin%20copy.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';
import 'package:member_rkm/app/modules/auth/widgets/forgot_password/send_link/controller.dart';


class FormSendLink extends StatelessWidget {
  FormSendLink({super.key});
  final controller = Get.find<SendLinkController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseText(
              text: controller.type.value == 'wa'
                  ? 'Cek Whatsapp Anda'
                  : 'Cek Email Anda',
              size: 20,
              bold: FontWeight.w600, 
              color: Colors.white,
            ),
            Container(
              height: 50,
              width: Get.width,
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.red.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info,
                    size: 30,
                    color: Colors.red.shade800,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: BaseText(
                      text: 'Link reset password hanya berlaku selama 1 jam',
                      color: Colors.red.shade800,
                      bold: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    controller.type.value == 'wa'
                        ? controller.sent.value
                            ? const TextSpan(
                                text: 'Kode OTP sudah dikirim ke whatsapp\n',
                                style: TextStyle(color: Colors.white70),
                              )
                            : const TextSpan(
                                text: 'Kode OTP akan dikirim ke whatsapp\n',
                                style: TextStyle(color: Colors.white70),
                              )
                        : controller.sent.value
                            ? const TextSpan(
                                text:
                                    'Link reset password sudah dikirim ke email\n',
                                style: TextStyle(color: Colors.white70),
                              )
                            : const TextSpan(
                                text:
                                    'Link reset password akan dikirim ke email\n',
                                style: TextStyle(color: Colors.white70),
                              ),
                    TextSpan(
                      text: controller.maskedValue.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (controller.sent.value)
                      TextSpan(
                        text: controller.type.value == 'wa'
                            ? '\nSilahkan cek whatsapp anda'
                            : '\nSilahkan cek email anda',
                        style: const TextStyle(color: Colors.white70),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            controller.type.value == 'wa'
                ? controller.sent.isFalse
                    ? SizedBox(
                        width: Get.width,
                        child: BaseButton(
                          bgColor: whiteColor,
                          fgColor: blackColor,
                          label: 'Kirim Kode OTP',
                          onPressed: controller.sendLink,
                        ),
                      )
                    : Form(
                        key: controller.formKey.value,
                        child: Column(
                          children: [
                            BaseFormGroupForgotPin(
                              label: 'Kode OTP',
                              controller: controller.otpController.value,
                              obscureText: false,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Kode OTP tidak boleh kosong';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: Get.width,
                              child: BaseButton(
                                bgColor: Colors.white,
                                fgColor: blackColor,
                                label: 'Submit',
                                onPressed: () {
                                  if (controller.formKey.value.currentState
                                          ?.validate() ??
                                      false) {
                                    controller.verifyOtp();
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      )
                : SizedBox(
                    width: Get.width,
                    child: BaseButton(
                      bgColor: whiteColor,
                      fgColor: blackColor,
                      label: controller.sent.value
                          ? 'Buka Email'
                          : 'Kirim Link Reset Password',
                      onPressed: controller.sent.value
                          ? controller.openMailApp
                          : controller.sendLink,
                    ),
                  ),
            if (controller.sent.value) const SizedBox(height: 5),
            if (controller.sent.value)
              controller.tunggu.value
                  ? const BaseText(
                      text:
                          'Maaf anda sudah melakukan 2 kali request. Silahkan tunggu beberapa saat untuk melakukan request lagi.\nTerima kasih',
                      textAlign: TextAlign.center,
                      color: Colors.white70,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const BaseText(
                          text: 'Tidak menerima email? ',
                          color: Colors.white70,
                        ),
                        GestureDetector(
                          onTap: controller.resendLink,
                          child: const BaseText(
                            text: 'Kirim Ulang',
                            color: whiteColor,
                            bold: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
          ],
        ),
      ),
    );
  }
}
