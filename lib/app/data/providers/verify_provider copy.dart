import 'package:dio/dio.dart';
import 'package:member_rkm/app/core/utils/api_url.dart';
import 'package:member_rkm/app/core/utils/dio_client.dart';


class VerifyProvider extends DioClient {
  Future<Response> verifyEmail(FormData formData) async {
    return await post(EndPoint.sendVerifyOtp, data: formData);
  }

  Future<Response> verifyWhatsApp(FormData formData) async {
    return await post(EndPoint.sendVerifyOtp, data: formData);
  }

  Future<Response> verifyOtpWhatsapp(FormData formData) async {
    return await post(EndPoint.verifyOtpWhatsapp, data: formData);
  }
}
