import 'package:g_json/g_json.dart';

class FlavorModel{
  String? name;
  String? url;

  FlavorModel(this.name, this.url);

  Map<String, dynamic> toJson(){
    final data = <String, dynamic>{};
    data["name"] = name;
    data["url"] = url;
    return data;
  }

  FlavorModel.fromJson(JSON json) {
    name = json['name'].stringValue;
    url = json['url'].stringValue;
  }

}