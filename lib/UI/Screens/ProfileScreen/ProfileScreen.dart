import 'package:crypto_app/Providers/ThemeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../Database/LocalData.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    bool switchValue =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Dark Mode",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Provider.of<ThemeProvider>(context).textColor1,
                    fontSize: 17)),
            Spacer(),
            CupertinoSwitch(
              value: switchValue,
              onChanged: (value) {
                if (LocalData.getBool("isDarkMode")) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .setLightMode(context);
                } else {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .setDarkMode(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
