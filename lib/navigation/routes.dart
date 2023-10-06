import 'package:flutter/widgets.dart';
import 'package:joker/screens/home.dart';
import 'package:joker/screens/login_page.dart';
import 'package:joker/screens/sign_up_page.dart';

final Map<String, WidgetBuilder> routes ={
  RegisterScreen.routename:(context) => const RegisterScreen(),
  LoginPage.routename:(context) => const LoginPage(),
  HomePage.routeName:(context) => const HomePage(),
  
};