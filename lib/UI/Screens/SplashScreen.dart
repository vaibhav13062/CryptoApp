import 'dart:async';
import 'package:crypto_app/Providers/TopCurrenciesProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../Constants/DeviceSizeConfig.dart';
import '../../NavigatoreServices/NavigatorService.dart';
import '../../main.dart';

class SplashScreen extends StatefulWidget {
  final Widget? nextScreen;
  const SplashScreen({Key? key, required this.nextScreen}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Provider.of<TopCurrenciesProvider>(context, listen: false)
        .fetchData(context);
    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        h = 125;
        w = 218;
        opacity = 1.0;
      });
      changeScreen();
    });

    // DeviceSizeConfig().init(context);
    super.initState();
  }

  double h = 75 / 2;
  double w = 168 / 2;
  double opacity = 0.5;

  changeScreen() async {
    // bool permissionCheck = await PermissionHandler().getPermissionsCheck();
    // if (permissionCheck) {

    Timer(const Duration(milliseconds: 1000), () {
      SplashFunction().goToMainScreen(context, widget.nextScreen);
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 1000),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            height: h,
            curve: Curves.easeInOutBack,
            width: w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage(
                    'assets/images/splashlogo.png',
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

class SplashFunction {
  void goToMainScreen(BuildContext context, Widget? nextScreen) {
    navigatorKey.currentState!
        .pushReplacement(FadeNavigatorService(nextScreen!));
  }
}
