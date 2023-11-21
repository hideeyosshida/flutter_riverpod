import 'package:flutter/material.dart';
import 'package:flutter_responsive/data/model/DataModel.dart';
import 'package:flutter_responsive/screen/list_email/item_email.dart';
import 'package:flutter_responsive/screen/list_email/list_email_provider.dart';
import 'package:flutter_responsive/screen/slide_menu.dart';
import 'package:flutter_responsive/utils/responsive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';


final listEmailProvider = NotifierProvider<EmailList, List<DataModel>>(EmailList.new);


class ListEmailScreen extends ConsumerWidget {
  ListEmailScreen({super.key});

  final GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getData = ref.read(listEmailProvider.notifier).getEmails();
    print("Thảooooooooooo  ");
    return Scaffold(
      key: globalKey,
      drawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: const SlideMenu(),
      ),
      body: Container(
        color: Colors.pinkAccent.withAlpha(30),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                !Responsive.isDesktop(context)
                    ? IconButton(
                  onPressed: () {
                    globalKey.currentState?.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    size: 24,
                  ),
                )
                    : const SizedBox(),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      fillColor: Colors.white,
                      suffixIcon: Icon(
                        Icons.search,
                        size: 24,
                      ),
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(width: 1, color: Colors.white70),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index){
                return ItemEmail();
              }, itemCount: 20,),
            )
          ],
        ),
      ),
    );
  }
}
