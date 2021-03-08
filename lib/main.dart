import 'package:cupertino_app/src/pages/buttons_page.dart';
import 'package:cupertino_app/src/pages/scroll_page.dart';
import 'package:cupertino_app/src/pages/style_page.dart';
import 'package:flutter/cupertino.dart';

import 'package:cupertino_app/src/pages/home_page.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Color.fromRGBO(255, 255, 255, 0.0),
        statusBarIconBrightness: Brightness.light
      )
    );

    return CupertinoApp(
      title: 'Cupertino design',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => StylePage(),
        'basic' : (context) => HomePageApp(),
        'scroll' : (context) => ScrollPage(),
        'style' : (context) => ButtonsPage(),
      },
    );
  }
}

