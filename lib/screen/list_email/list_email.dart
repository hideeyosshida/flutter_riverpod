import 'package:flutter/material.dart';
import 'package:flutter_responsive/screen/list_email/item_email.dart';
import 'package:flutter_responsive/screen/slide_menu.dart';
import 'package:flutter_responsive/utils/responsive.dart';

class ListEmailScreen extends StatefulWidget {
  const ListEmailScreen({super.key});

  @override
  State<ListEmailScreen> createState() => _ListEmailScreenState();
}

class _ListEmailScreenState extends State<ListEmailScreen> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
