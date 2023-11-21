import 'package:flutter_responsive/data/model/DataModel.dart';
import 'package:flutter_responsive/services/repository/get_list_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

import '../../services/api/api_url.dart';

class EmailList extends Notifier<List<DataModel>>{

  Future<List<DataModel>> getEmails() async{
    final emailsRepository = GetListRepository();
    final response = await emailsRepository.getList();
    print("Get data done: ${response}");
    return response;
  }

  @override
  List<DataModel> build() {
   return [];
  }
}


// class ApiServices{
//   Future<void> getData() async{
//     final response = await get(Uri.parse(ApiURL.getList.path));
//     if(response.statusCode == 200){
//       print("GetData response: ${response.body}");
//     }else{
//       throw Exception(response.reasonPhrase);
//     }
//   }
// }
//
// final apiProvider = Provider<ApiServices>((ref) => ApiServices());
//
//
// final dataProvider = FutureProvider<String>((ref) async{
//   return ref.watch(apiProvider).getData().toString();
// });