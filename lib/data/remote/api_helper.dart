import 'package:flutter_base_by_minhnv/data/model/api/base_response.dart';
import 'package:flutter_base_by_minhnv/data/model/api/list_response.dart';
import 'package:flutter_base_by_minhnv/data/model/api/login/sign_in_response.dart';

import '../model/api/base_response.dart';
import '../model/api/login/sign_in_response.dart';

abstract class ApiHelper {
  Future<BaseResponse<SignInResponse>> doLogin(String username, String pass);

  Stream<BaseResponse<List<Product>>> doGetList();
}