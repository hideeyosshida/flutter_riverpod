import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive/screen/email_detail/email_detail.dart';
import 'package:flutter_responsive/screen/home_screen.dart';
import 'package:flutter_responsive/screen/list_email/list_email.dart';
import 'package:flutter_responsive/screen/slide_menu.dart';
import 'package:flutter_responsive/screen/todo_screen/todo_screen.dart';
import 'package:flutter_responsive/screen/top_section.dart';

class AppRouter {
  static const String LIST_EMAIL = 'list_email';
  static const String DASHBOARD_PAGE = 'dashboard_page';
  static const String HOME_SCREEN = 'home_screen';
  static const String EMAIL_DETAIL = 'email_detail';
  static const String SLIDE_MENU = 'slide_menu';
  static const String TOP_SECTION = 'top_section';
  static const String TODO_SCREEN = 'todo_screen';

  static Future<Widget> initialFirstScreen() async {
    return const HomeScreen();
  }

  //Generate Router
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LIST_EMAIL:
        return MaterialPageRoute(builder: (_) => const ListEmailScreen());
      case TOP_SECTION:
        return MaterialPageRoute(builder: (_) => const TopSection());
      case HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case EMAIL_DETAIL:
        return MaterialPageRoute(builder: (_) => const EmailDetail());
      case SLIDE_MENU:
        return MaterialPageRoute(builder: (_) => const SlideMenu());
      case TODO_SCREEN:
        return MaterialPageRoute(builder: (_) => const TodoScreen());
    // Default if no Router
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}