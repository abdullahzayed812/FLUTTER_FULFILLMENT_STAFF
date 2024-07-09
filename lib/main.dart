// ignore_for_file: deprecated_member_use

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:postage_staff/app.dart';
import 'package:postage_staff/core/app/bloc_observer.dart';
import 'package:postage_staff/core/app/env.variable.dart';
import 'package:postage_staff/core/core_packages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await setupInjector();
  await EnvVariable.instance.init(envType: EnvTypeEnum.prod);
  await SharedPref.instantiatePreferences();
  Bloc.observer = AppBlocObserver();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then((_) {
    runApp(const PostageApp());
  });
}

//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Postage',
//       debugShowCheckedModeBanner: false,
//       // navigatorKey: navigatorKey,
//       // onGenerateRoute: onGenerateRoute,
//       theme:
//
//
//       ThemeData(
//         useMaterial3: false,
//         bottomNavigationBarTheme:
//             const BottomNavigationBarThemeData(backgroundColor: Colors.white),
//         fontFamily: 'Noto Kufi Arabic',
//         // fontFamily: 'Inter',
//
//         appBarTheme: const AppBarTheme(backgroundColor: Colors.red),
//         colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
//             .copyWith(background: Colors.white),
//       ),
//       home: const Directionality(
//           textDirection: TextDirection.rtl, child: SplashView()),
//     );
//   }
// }
//
