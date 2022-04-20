import 'dart:io';

import 'package:crypto_app/Constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:crypto_app/main.dart';

class ConnectionLost extends StatelessWidget {
  const ConnectionLost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 2),
        decoration: const BoxDecoration(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                child: Lottie.asset(
                  'assets/lottieAnimations/no-internet.json',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Connection Lost',
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 66,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
