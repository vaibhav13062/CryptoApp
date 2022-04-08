import 'package:crypto_app/Constants/AppColors.dart';
import 'package:crypto_app/Providers/BottomBarSectionProvider.dart';
import 'package:crypto_app/Providers/ThemeProvider.dart';
import 'package:crypto_app/UI/Screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'Constants/DeviceSizeConfig.dart';
import 'UI/Screens/SplashScreen.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('DefaultDB');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => BottomBarSectionProvider()),
      ],
      child: MaterialApp(
        supportedLocales: const [
          Locale('en'),
        ],
        title: 'CryptoApp',
        color: AppColors.backgroundColor,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(nextScreen: MainScreen()),
        theme: ThemeData(
          fontFamily: "Inter",
          scaffoldBackgroundColor: AppColors.backgroundColor,
        ),
      ),
    );
  }
}
