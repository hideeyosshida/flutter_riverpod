import 'dart:developer';

import 'package:flutter_responsive/services/api/api_url.dart';
import 'package:flutter_responsive/services/api/base_api.dart';

class GetListRepository{
  APIDataStore apiDataStore = APIDataStore();

  Future<dynamic> getList() async{
    final response = await apiDataStore.requestAPI(ApiURL.getList);
    log('===== Get list response: $response =====');
    return response;
  }
}