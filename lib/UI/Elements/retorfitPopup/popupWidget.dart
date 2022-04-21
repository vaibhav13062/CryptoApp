import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Providers/ThemeProvider.dart';





class PopupWidget extends StatelessWidget {
  final String? title;
  final String? content;
  final VoidCallback? onDismiss;
  PopupWidget(
      {@required this.content, @required this.title, @required this.onDismiss});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          title!,
          textAlign: TextAlign.center,
        ),
        contentTextStyle: TextStyle(
          fontSize: 16,
          color: Provider.of<ThemeProvider>(context).textColor1,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleTextStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: Provider.of<ThemeProvider>(context).textColor1),
        actionsPadding: EdgeInsets.all(5),
        actions: [
          CustomPopUpMenuButton(
            onPressed: onDismiss,
            text: 'OK',
          )
        ],
        content: Text(content!));
  }
}

class CustomPopUpMenuButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  CustomPopUpMenuButton({@required this.onPressed, @required this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          width: 40,
          height: 30,
          child: Text(
            text!,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Provider.of<ThemeProvider>(context).mainColor),
          ),
        ));
  }
}
