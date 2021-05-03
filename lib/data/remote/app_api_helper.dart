import 'dart:convert';

import 'package:flutter_base_by_minhnv/data/model/api/base_response.dart';
import 'package:flutter_base_by_minhnv/data/model/api/login/sign_in_response.dart';
import 'package:flutter_base_by_minhnv/data/remote/api_end_point.dart';
import 'package:flutter_base_by_minhnv/data/remote/api_helper.dart';
import 'package:http/http.dart' as http;

class AppApiHelper extends ApiHelper {
  static final AppApiHelper _singleton = AppApiHelper.internal();

  factory AppApiHelper() {
    return _singleton;
  }

  AppApiHelper.internal();

  @override
  Future<BaseResponse> doLogin(String username, String pass) async {
    print("correct acc");
    var response =
        '{"success": 1, "data": {"access_token": "this_is_token", "token_type": "bearer", "expires_in": 3600}}';
    var responseError =
        '{"success": 0, "data" : null, "error" : {"error_code" : "e404", "error_message": "page not found!"}}';
    final json = await jsonDecode(response);
    final baseResponse = BaseResponse.fromJson(json);
    return Future.value(baseResponse);
  }
}
