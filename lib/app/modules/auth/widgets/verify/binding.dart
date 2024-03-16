import 'package:get/get.dart';
import 'package:member_rkm/app/data/providers/verify_provider%20copy.dart';
import 'package:member_rkm/app/modules/auth/widgets/verify/controller.dart';

class VerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyProvider>(() => VerifyProvider());
    Get.lazyPut<VerifyController>(() => VerifyController(verifyProvider: Get.find()));
  }
}