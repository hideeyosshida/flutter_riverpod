import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive/data/model/DataModel.dart';
import 'package:flutter_responsive/screen/list_email/list_email.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemEmail extends ConsumerWidget {
  const ItemEmail({super.key, required this.data, required this.onUpdate});
  final DataModel data;
  final Function(String) onUpdate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController(text: data.flavor?.name ?? '');
    return SizedBox(
      child: GestureDetector(
        onTap: (){
          showDialog(context: context, builder: (BuildContext context){
            return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 3,
              backgroundColor: Colors.transparent,
              child: Container(
                height: 200,
                clipBehavior: Clip.hardEdge,
                width: MediaQuery.of(context).size.width / 1.4,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      onChanged: (value){

                      },
                    ),
                    const SizedBox(height: 30,),
                    InkWell(
                      child: Container(
                        height: 40,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8),),
                          color: Colors.blue
                        ),
                        child: const Text("Update", style: TextStyle(color: Colors.white, fontSize: 16),),
                      ),
                      onTap: (){
                        onUpdate(controller.text);
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            );
          });
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: Colors.white70,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check_circle, color: data.isChecked! ?  Colors.lightGreenAccent : Colors.grey,),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.flavor?.name ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    data.flavor?.url ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.lightBlueAccent,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Potency: ${data.potency}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
