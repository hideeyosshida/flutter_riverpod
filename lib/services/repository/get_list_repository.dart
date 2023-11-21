import 'dart:convert';
import 'dart:developer';

import 'package:flutter_responsive/data/model/DataModel.dart';
import 'package:flutter_responsive/services/api/api_url.dart';
import 'package:flutter_responsive/services/api/base_api.dart';
import 'package:g_json/g_json.dart';

class GetListRepository{
  APIDataStore apiDataStore = APIDataStore();

  Future<List<DataModel>> getList() async{
    final response = await apiDataStore.requestAPI(ApiURL.getList);
    final data = jsonDecode(response.toString())["flavors"];
    JSON(data).listValue.first;
    final json = JSON(data)
        .listValue
        .map((e) => DataModel.fromJson(e))
        .toList();
    print("------> ${DataModel.fromJson(JSON(data).listValue.first).flavor?.url}");
    return json;
  }
}