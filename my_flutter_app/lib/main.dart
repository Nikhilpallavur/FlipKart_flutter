import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_app/pages/flipkart/authentication/login.dart';
import 'package:my_flutter_app/pages/flipkart/landingPage/main.dart';
import 'package:my_flutter_app/provider/cartItem.dart';
import 'package:my_flutter_app/utils/flipkart/variables/localStorage.dart';
import 'package:my_flutter_app/utils/flipkart/variables/tabVariables.dart';
import 'package:provider/provider.dart';
// import 'package:my_flutter_app/pages/homePage/homePage.dart';
// import 'package:my_flutter_app/pages/calculator/calculator.dart';
import 'package:my_flutter_app/pages/flipkart/filpkartMain.dart';
import 'package:localstorage/localstorage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(MultiProvider(providers: [
  //   ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider())
  // ], child: MyApp()));

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final LocalStorage storage = LocalStorage(ACCOUNT_JSON);

class _MyAppState extends State<MyApp> {
  var logged = storage.getItem(LOGIN_LCL);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page 1'),
        // home: const Login(),
        home: MyHomePageMain(
          selectedButtonProps: FLIPKART,
          selectedTabProps: BOTTOM_TABS.Home.name,
        ));
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       // home: const MyHomePage(title: 'Flutter Demo Home Page 1'),
//       home: const Login(),
//     );
//   }
// }
