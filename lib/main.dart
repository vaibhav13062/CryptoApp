import 'package:provider/provider.dart';

import '../../../Providers/ThemeProvider.dart';
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
import 'Providers/UserAmountCalculator.dart';
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
    ..progressColor = Color.fromRGBO(14, 14, 14, 1)
    ..backgroundColor = Colors.white
    ..indicatorColor = Color.fromRGBO(14, 14, 14, 1)
    ..textColor = Color.fromRGBO(14, 14, 14, 1)
    ..maskColor = Color.fromRGBO(14, 14, 14, 1).withOpacity(0.3)
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => TopCurrenciesProvider()),
        ChangeNotifierProvider(create: (_) => BottomBarSectionProvider()),
        ChangeNotifierProvider(create: (_) => UserAmountCalculator()),
      ],
      child: MainApp(),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {

    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        supportedLocales: const [
          Locale('en'),
        ],
        title: 'CryptoApp',
        builder: EasyLoading.init(),
        color: Provider.of<ThemeProvider>(context).backgroundColor,
        // color: Colors.white,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(nextScreen: MainScreen()),
        theme: ThemeData(
          fontFamily: "Inter",
          scaffoldBackgroundColor:
              Provider.of<ThemeProvider>(context).backgroundColor,
          // scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }

  @override
  void initState() {
    Provider.of<ThemeProvider>(context, listen: false).setInitialColors();


    super.initState();
  }
}
