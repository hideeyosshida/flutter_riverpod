import 'package:flutter/material.dart';
import 'package:flutter_responsive/custom_widget/loading_show_able.dart';
import 'package:flutter_responsive/data/model/DataModel.dart';
import 'package:flutter_responsive/screen/app_router.dart';
import 'package:flutter_responsive/screen/list_email/item_email.dart';
import 'package:flutter_responsive/screen/list_email/list_email_provider.dart';
import 'package:flutter_responsive/screen/slide_menu.dart';
import 'package:flutter_responsive/services/api/base_api.dart';
import 'package:flutter_responsive/utils/responsive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

import '../../services/repository/get_list_repository.dart';

// final listEmailProvider =
//     NotifierProvider<EmailList, List<DataModel>>(EmailList.new);
// final dataProvider = FutureProvider<List<DataModel>>((ref) async {
//   return ref.read(listEmailProvider.notifier).getEmails();
// });

final apiServiceProvider =
    Provider<GetListRepository>((ref) => GetListRepository());
final _dataProvider = FutureProvider<List<DataModel>>((ref) async {
  return ref.watch(apiServiceProvider).getList();
});

class ListEmailScreen extends ConsumerWidget {
  ListEmailScreen({super.key});

  final GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final dataList = ref.watch(dataProvider);
    final dataList = ref.watch(_dataProvider);
    return Scaffold(
      key: globalKey,
      drawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: const SlideMenu(),
      ),
      body: Container(
        color: Colors.pinkAccent.withAlpha(30),
        padding:
            const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
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
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: dataList.when(
                data: (data) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ItemEmail(
                        data: data[index],
                        onUpdate: (value) {
                          // UPDATE DATA
                        },
                      );
                    },
                    itemCount: data.length,
                  );
                },
                error: (error, s) => Center(
                  child: Text(
                    error.toString(),
                  ),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRouter.EMAIL_DETAIL);
        },
        backgroundColor: Colors.pinkAccent.withOpacity(0.7),
        child: const Icon(
          Icons.queue_play_next,
          color: Colors.white,
        ),
      ),
    );
  }
}
