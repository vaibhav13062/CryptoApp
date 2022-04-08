import 'package:crypto_app/Providers/BottomBarSectionProvider.dart';
import 'package:crypto_app/UI/Elements/AppBottomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: double.maxFinite,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Provider.of<BottomBarSectionProvider>(context)
                .getWidgetFromIndex(context),
            AppBottomAppBar(),
          ],
        ),
      ),
    ));
  }
}
