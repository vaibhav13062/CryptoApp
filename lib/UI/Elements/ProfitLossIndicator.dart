import 'package:provider/provider.dart';

import '../../../Providers/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfitLossIndicator extends StatelessWidget {
  final bool isLoss;
  final double percenatge;
  final bool? showBig;
  final bool? showArrow;
  const ProfitLossIndicator(
      {Key? key,
      required this.isLoss,
      required this.percenatge,
      this.showBig,
      this.showArrow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          showArrow == null
              ? Icon(
                  isLoss
                      ? Icons.arrow_drop_down_sharp
                      : Icons.arrow_drop_up_sharp,
                  color: isLoss
                      ? Provider.of<ThemeProvider>(context).lossColor
                      : Provider.of<ThemeProvider>(context).profitColor,
                  size: showBig == null ? 25 : 30,
                )
              : showArrow!
                  ? Icon(
                      isLoss
                          ? Icons.arrow_drop_down_sharp
                          : Icons.arrow_drop_up_sharp,
                      color: isLoss
                          ? Provider.of<ThemeProvider>(context).lossColor
                          : Provider.of<ThemeProvider>(context).profitColor,
                      size: showBig == null ? 25 : 30,
                    )
                  : Container(),
          Text(
            percenatge.toStringAsFixed(2) + "%",
            style: TextStyle(
                color: isLoss
                    ? Provider.of<ThemeProvider>(context).lossColor
                    : Provider.of<ThemeProvider>(context).profitColor,
                fontSize: showBig == null ? 14 : 18),
          )
        ],
      ),
    );
  }
}
