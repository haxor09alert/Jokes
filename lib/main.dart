import 'package:flutter/material.dart';
import 'package:joker/navigation/routes.dart';
import 'package:joker/screens/home.dart';
import 'package:joker/screens/login_page.dart';
import 'package:joker/screens/sign_up_page.dart';
import 'package:http/http.dart'as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
        useMaterial3: true,
      ),
      home:LoginPage(),
      initialRoute:LoginPage.routename,
           routes:{
            RegisterScreen.routename:(context) =>RegisterScreen(),
            HomePage.routename :(context)=> HomePage(),
            LoginPage.routename:(context) => LoginPage(),
           },
    );
  }
}
