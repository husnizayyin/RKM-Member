import 'package:get/get.dart';
import 'package:member_rkm/app/modules/auth/widgets/forgot_password/identify/binding.dart';
import 'package:member_rkm/app/modules/auth/widgets/forgot_password/identify/view.dart';
import 'package:member_rkm/app/modules/auth/widgets/forgot_password/reset_password/binding.dart';
import 'package:member_rkm/app/modules/auth/widgets/forgot_password/reset_password/view.dart';
import 'package:member_rkm/app/modules/auth/widgets/forgot_password/send_link/binding.dart';
import 'package:member_rkm/app/modules/auth/widgets/forgot_password/send_link/view.dart';

import 'package:member_rkm/app/modules/auth/widgets/login/binding.dart';
import 'package:member_rkm/app/modules/auth/widgets/login/view.dart';
import 'package:member_rkm/app/modules/auth/widgets/register/binding.dart';
import 'package:member_rkm/app/modules/auth/widgets/register/view.dart';
import 'package:member_rkm/app/modules/auth/widgets/verify/binding.dart';
import 'package:member_rkm/app/modules/auth/widgets/verify/view.dart';
import 'package:member_rkm/app/modules/benefit/binding.dart';
import 'package:member_rkm/app/modules/benefit/view.dart';
import 'package:member_rkm/app/modules/content/all_content/binding.dart';
import 'package:member_rkm/app/modules/content/all_content/view.dart';
import 'package:member_rkm/app/modules/content/detail_content/binding.dart';
import 'package:member_rkm/app/modules/content/detail_content/view.dart';
import 'package:member_rkm/app/modules/dashboard/binding.dart';
import 'package:member_rkm/app/modules/dashboard/view.dart';
import 'package:member_rkm/app/modules/handling/screen%20not%20available/undian_handling.dart';
import 'package:member_rkm/app/modules/onboard/binding.dart';
import 'package:member_rkm/app/modules/onboard/view.dart';
import 'package:member_rkm/app/modules/pin/createchange_pin/binding.dart';
import 'package:member_rkm/app/modules/pin/createchange_pin/view.dart';
import 'package:member_rkm/app/modules/pin/redeem_pin/binding.dart';
import 'package:member_rkm/app/modules/pin/redeem_pin/view.dart';
import 'package:member_rkm/app/modules/pin/reset_pin/binding.dart';
import 'package:member_rkm/app/modules/pin/reset_pin/view.dart';
import 'package:member_rkm/app/modules/point/binding.dart';
import 'package:member_rkm/app/modules/point/history_point/view.dart';
import 'package:member_rkm/app/modules/point/my_point/view.dart';
import 'package:member_rkm/app/modules/profile/binding.dart';
import 'package:member_rkm/app/modules/profile/change_password/view.dart';
import 'package:member_rkm/app/modules/profile/delete_account/view.dart';
import 'package:member_rkm/app/modules/profile/edit_profile/view.dart';
import 'package:member_rkm/app/modules/shopping_history/binding.dart';
import 'package:member_rkm/app/modules/shopping_history/view.dart';
import 'package:member_rkm/app/modules/splash/binding.dart';
import 'package:member_rkm/app/modules/splash/view.dart';
import 'package:member_rkm/app/modules/success/binding.dart';
import 'package:member_rkm/app/modules/success/view.dart';
import 'package:member_rkm/app/modules/tracking/binding.dart';
import 'package:member_rkm/app/modules/tracking/view.dart';
import 'package:member_rkm/app/modules/updater/binding.dart';
import 'package:member_rkm/app/modules/updater/view.dart';
import 'package:member_rkm/app/modules/voucher/binding.dart';
import 'package:member_rkm/app/modules/voucher/view.dart';
import 'package:member_rkm/app/routes/routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.updater,
      page: () => const UpdaterPage(),
      binding: UpdaterBinding(),
    ),
    GetPage(
      name: Routes.onboard,
      page: () => const OnBoardPage(),
      binding: OnBoardBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.verify,
      page: () => const VerifyPage(),
      binding: VerifyBinding(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const IdentifyPage(),
      binding: IdentifyBinding(),
    ),
     GetPage(
      name: Routes.sendLink,
      page: () => const SendLinkPage(),
      binding: SendLinkBinding(),
    ),
    GetPage(
      name: Routes.resetPassword,
      page: () => const ResetPasswordPage(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.benefit,
      page: () => const BenefitPage(),
      binding: BenefitBinding(),
    ),
    GetPage(
      name: Routes.allContent,
      page: () => const AllContentPage(),
      binding: AllContentBinding(),
    ),
    GetPage(
      name: Routes.detailContent,
      page: () => const DetailContentPage(),
      binding: DetailContentBinding(),
    ),
    GetPage(
      name: Routes.point,
      page: () => const MyPointPage(),
      binding: PointBinding(),
    ),
    GetPage(
      name: Routes.pointHistory,
      page: () => const HistoryPointPage(),
      binding: PointBinding(),
    ),
    GetPage(
      name: Routes.redeemPin,
      page: () => const RedeemPinPage(),
      binding: RedeemPinBinding(),
    ),
    GetPage(
      name: Routes.voucher,
      page: () => const VoucherPage(),
      binding: VoucherBinding(),
    ),
    GetPage(
      name: Routes.tracking,
      page: () => const TrackingPage(),
      binding: TrackingBinding(),
    ),
    GetPage(
      name: Routes.shopping,
      page: () => const ShoppingPage(),
      binding: ShoppingBinding(),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => const EditProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.changePassword,
      page: () => const ChangePasswordPage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.deleteAccount,
      page: () => const DeleteAccountPage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.createPin,
      page: () => const PinPage(),
      binding: PinBinding(),
    ),
    GetPage(
      name: Routes.changePin,
      page: () => const PinPage(),
      binding: PinBinding(),
    ),
    // GetPage(
    //   name: Routes.forgotPin,
    //   page: () => const ForgotPinPage(),
    //   binding: ForgotPinBinding(),
    // ),
    GetPage(
      name: Routes.resetPin,
      page: () => const ResetPinPage(),
      binding: ResetPinBinding(),
    ),
    GetPage(
      name: Routes.success,
      page: () => const SuccessPage(),
      binding: SuccessBinding(),
      transition: Transition.downToUp
    ),
    GetPage(
      name: Routes.handling_redeem,
      page: () => UndianHandling(),
      binding: DashboardBinding(),
      transition: Transition.downToUp
    )
  ];
}
