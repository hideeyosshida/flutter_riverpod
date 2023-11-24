import 'package:flutter_responsive/data/model/DataModel.dart';
import 'package:flutter_responsive/data/model/FlavorModel.dart';
import 'package:flutter_responsive/screen/list_email/list_email.dart';
import 'package:flutter_responsive/services/repository/get_list_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailList extends Notifier<List<DataModel>>{

// ignore: avoid_public_notifier_properties
  List<DataModel> dataList = [];
  Future<List<DataModel>> getEmails() async{
    final emailsRepository = GetListRepository();
    final response = await emailsRepository.getList();
    dataList = response;
    return response;
  }

  @override
  List<DataModel> build() {
    return dataList;
  }

  void checkData(DataModel dataModel){
    for(var data in dataList){
      if(data.flavor?.name == dataModel.flavor?.name){
        data.isChecked = true;
      }
    }
  }

  void updateData(DataModel dataModel, String nameChanged){
    // state = dataList;
    print("State data: ${state.length}");
    state = [
      for(var data in state)
        if(data.flavor?.name == dataModel.flavor?.name)
          DataModel(potency: data.potency, flavor: FlavorModel(nameChanged, data.flavor?.url))
      else
        data
    ];
  }


}
//
// [
// DataModel(
// flavor: FlavorModel("Flavor 1", ""),
// potency: 1,
// ),
// DataModel(
// flavor: FlavorModel("Flavor 2", ""),
// potency: 2,
// ),
// DataModel(
// flavor: FlavorModel("Flavor 3", ""),
// potency: 3,
// ),
// DataModel(
// flavor: FlavorModel("Flavor 4", ""),
// potency: 4,
// ),
// DataModel(
// flavor: FlavorModel("Flavor 5", ""),
// potency: 5,
// ),
// ]