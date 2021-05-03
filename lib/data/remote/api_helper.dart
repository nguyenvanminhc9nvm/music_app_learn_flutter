import 'package:flutter_base_by_minhnv/data/model/api/base_response.dart';
import 'package:flutter_base_by_minhnv/data/model/api/login/sign_in_response.dart';

abstract class ApiHelper {
  Future<BaseResponse> doLogin(String username, String pass);
}