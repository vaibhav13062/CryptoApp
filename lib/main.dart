import 'package:crypto_app/Constants/AppColors.dart';
import 'package:crypto_app/Providers/BottomBarSectionProvider.dart';
import 'package:crypto_app/Providers/ThemeProvider.dart';
import 'package:crypto_app/Providers/TopCurrenciesProvider.dart';
import 'package:crypto_app/UI/Screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'Constants/DeviceSizeConfig.dart';
import 'UI/Screens/SplashScreen.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  configLoading();
  await Hive.openBox('DefaultDB');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.dualRing
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.mainColor
    ..backgroundColor = Colors.white
    ..indicatorColor = AppColors.mainColor
    ..textColor = AppColors.textColor1
    ..maskColor = AppColors.mainColor.withOpacity(0.3)
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => TopCurrenciesProvider()),
        ChangeNotifierProvider(create: (_) => BottomBarSectionProvider()),
      ],
      child: MaterialApp(
        supportedLocales: const [
          Locale('en'),
        ],
        title: 'CryptoApp',
        builder: EasyLoading.init(),
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
