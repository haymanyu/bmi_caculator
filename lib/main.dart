import 'package:flutter_web/material.dart';
import 'homepage.dart';
// import 'page2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: MyHomePage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => MyHomePage(),
      //   '/result': (context) => Page2()
      // },
    );
  }
}


