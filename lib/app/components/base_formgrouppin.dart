import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:member_rkm/app/components/base_text.dart';
import 'package:member_rkm/app/core/values/colors.dart';

class BaseFormGroupPin extends StatelessWidget {
  const BaseFormGroupPin({
    Key? key,
    required this.label,
    this.icon,
    this.onPressed,
    this.controller,
    this.focusNode,
    this.validator,
    this.onCompleted,
    this.onChanged,
    this.obscureText = true,
  }) : super(key: key);

  final String label;
  final IconData? icon;
  final void Function()? onPressed;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onCompleted;
  final void Function(String)? onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BaseText(
              text: label,
              bold: FontWeight.w600,
            ),
            IconButton(
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.zero),
              ),
              padding: EdgeInsets.zero,
              onPressed: onPressed,
              icon: Icon(icon),
            ),
          ],
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            controller: controller,
            focusNode: focusNode,
            keyboardType: TextInputType.number,
            length: 6,
            defaultPinTheme: PinTheme(
              width: 56,
              height: 60,
              decoration: BoxDecoration(
                color: bgSectionColor,
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: const TextStyle(
                fontSize: 20,
                color: whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            errorTextStyle: const TextStyle(
              color: redColor,
            ),
            useNativeKeyboard: true,
            validator: validator,
            obscureText: obscureText,
            obscuringWidget: Container(
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                color: whiteColor,
                shape: BoxShape.circle,
              ),
            ),
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            onCompleted: onCompleted,
            onChanged: onChanged,
            cursor: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  width: 22,
                  height: 1,
                  color: orangeColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// class BaseFormGroupForgotPin extends StatelessWidget {
//   const BaseFormGroupForgotPin({
//     Key? key,
//     required this.label,
//     this.icon,
//     this.onPressed,
//     this.controller,
//     this.focusNode,
//     this.validator,
//     this.onCompleted,
//     this.onChanged,
//     this.obscureText = true,
//   }) : super(key: key);

//   final String label;
//   final IconData? icon;
//   final void Function()? onPressed;
//   final TextEditingController? controller;
//   final FocusNode? focusNode;
//   final String? Function(String?)? validator;
//   final void Function(String)? onCompleted;
//   final void Function(String)? onChanged;
//   final bool obscureText;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             BaseText(
//               text: label,
//               color: Colors.white,
//               bold: FontWeight.w600,
//             ),
//             IconButton(
//               style: const ButtonStyle(
//                 iconColor: MaterialStatePropertyAll(Colors.white),
//                 padding: MaterialStatePropertyAll(EdgeInsets.zero),
//               ),
//               padding: EdgeInsets.zero,
//               onPressed: onPressed,
//               icon: Icon(icon),
//             ),
//           ],
//         ),
//         Directionality(
//           textDirection: TextDirection.ltr,
//           child: Pinput(
//             controller: controller,
//             focusNode: focusNode,
//             androidSmsAutofillMethod:
//                 AndroidSmsAutofillMethod.smsUserConsentApi,
//             listenForMultipleSmsOnAndroid: true,
//             keyboardType: TextInputType.number,
//             length: 6,
//             defaultPinTheme: PinTheme(
//               width: 56,
//               height: 60,
//               decoration: BoxDecoration(
//                 color: softPurpleColor,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               textStyle: const TextStyle(
//                 fontSize: 20,
//                 color: purpleColor,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             useNativeKeyboard: true,
//             validator: validator,
//             obscureText: obscureText,
//             obscuringWidget: Container(
//               height: 10,
//               width: 10,
//               decoration: const BoxDecoration(
//                 color: purpleColor,
//                 shape: BoxShape.circle,
//               ),
//             ),
//             hapticFeedbackType: HapticFeedbackType.lightImpact,
//             onCompleted: onCompleted,
//             onChanged: onChanged,
//             cursor: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(bottom: 9),
//                   width: 22,
//                   height: 1,
//                   color: purpleColor,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
