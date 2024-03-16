import 'package:dio/dio.dart';
import 'package:member_rkm/app/core/utils/api_url.dart';
import 'package:member_rkm/app/core/utils/dio_client.dart';


class IdentifyProvider extends DioClient {
  Future<Response> identifyAccount(FormData formData) async {
    return await post(EndPoint.identifyForgotPassword, data: formData);
  }
}