class DataModel{
  final String? name;
  final String? url;
  DataModel({this.name, this.url});

  Map<String, dynamic> toJson(){
    final data = <String, dynamic>{};
    data["name"] = name;
    data["url"] = url;
    return data;
  }
}