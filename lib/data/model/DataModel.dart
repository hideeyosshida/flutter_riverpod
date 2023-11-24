import 'package:flutter_responsive/data/model/FlavorModel.dart';
import 'package:g_json/g_json.dart';

class DataModel{
  FlavorModel? flavor;
  int? potency;
  bool? isChecked;
  DataModel({this.flavor, this.potency, this.isChecked = false});

  Map<String, dynamic> toJson(){
    final data = <String, dynamic>{};
    data["flavor"] = flavor;
    data["potency"] = potency;
    return data;
  }

  DataModel.fromJson(JSON json) {
    flavor = FlavorModel.fromJson(json['flavor']);
    potency = json['potency'].integerValue;
    isChecked = false;
  }
}