import 'package:flutter/material.dart';
import 'package:joker/navigation/routes.dart';
import 'package:joker/screens/home.dart';
import 'package:joker/screens/login_page.dart';
import 'package:joker/screens/sign_up_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
//  @override
//  State<MyApp> createState()=>_MyAppState();
// }
// final GlobalKey<NavigatorState> navigatorKey= GlobalKey<NavigatorState>();

// class _MyAppState extends State<MyApp>{
//   @override
//   Widget build(BuildContext context){
//     return  MultiProviderWidget(
//       child:GetMaterialApp(
//         navigatorKey:navigatorKey,
//         initialRoute:LoginPage.routename,
//         routes:routes,
//       ),
//     );
//   }
// }
  