import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_responsive/screen/app_router.dart';
import 'package:flutter_responsive/screen/counter_screen/counter_provider.dart';
import 'package:flutter_responsive/screen/email_detail/email_detail.dart';
import 'package:flutter_responsive/screen/list_email/list_email.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const ProviderScope(child: MyApp()));
}

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class MyHomePageProvider extends ConsumerWidget {
  const MyHomePageProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterProvider);
    return Scaffold(
      body: Center(
        child: Text("Hello world\nThe value: $value"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              ref.read(counterProvider.notifier).increment();
            },
            icon: const Icon(Icons.bookmark_add_rounded),
          ),
          IconButton(
              onPressed: () {
                ref.read(counterProvider.notifier).decrement();
              },
              icon: const Icon(Icons.bookmark_remove_sharp))
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        child = BotToastInit()(context, child);
        return child;
      },
      navigatorObservers: [BotToastNavigatorObserver()],
      onGenerateRoute: AppRouter.generateRoute,
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // body: Responsive(
      //   mobile: ListEmailScreen(),
      //   tablet: Row(
      //     children: [
      //       Expanded(
      //         flex: 4,
      //         child: ListEmailScreen(),
      //       ),
      //       const Expanded(
      //         flex: 6,
      //         child: EmailDetail(),
      //       ),
      //     ],
      //   ),
      //   desktop: Row(
      //     children: [
      //       Expanded(
      //         flex: size.width > 1340 ? 2 : 4,
      //         child: const SlideMenu(),
      //       ),
      //       Expanded(
      //         flex: size.width > 1340 ? 3 : 5,
      //         child: ListEmailScreen(),
      //       ),
      //       Expanded(
      //         flex: size.width > 1340 ? 8 : 10,
      //         child: const EmailDetail(),
      //       ),
      //     ],
      //   ),
      // ),
      body: ListEmailScreen(),
    );
  }
}
