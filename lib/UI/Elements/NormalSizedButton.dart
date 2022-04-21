import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../Constants/DeviceSizeConfig.dart';
import '../../Providers/ThemeProvider.dart';


class NormalSizedButton extends StatelessWidget {
  final String? text;
  final VoidCallback? function;
  final Color? color;
  final Color? loadingColor;
  final Color? textColor;
  final bool? isLoading;
  final double? fontSize;
  final FontWeight? fontWeight;

  NormalSizedButton(
      {@required this.text,
      this.textColor,
      this.fontWeight,
      this.fontSize,
      this.isLoading,
      @required this.color,
      @required this.function,
      this.loadingColor});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedContainer(
      height: 57,
      width: isLoading == true ? 57 : DeviceSizeConfig.screenWidth,
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: isLoading == false
            ? BorderRadius.circular(8)
            : BorderRadius.circular(10),
        color: color,
      ),
      child: isLoading == true
          ? Center(
              child: CircularProgressIndicator(
                color: loadingColor ?? Provider.of<ThemeProvider>(context).textColor1,
              ),
            )
          : Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: function,
                  child: Center(
                    child: Text(
                      text!,
                      style: TextStyle(
                          color: textColor,
                          fontFamily: 'Inter',
                          fontWeight: fontWeight,
                          fontSize: fontSize),
                    ),
                  )),
            ),
    );
  }
}

