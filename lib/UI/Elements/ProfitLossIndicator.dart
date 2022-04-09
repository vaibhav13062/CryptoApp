import 'package:crypto_app/Constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfitLossIndicator extends StatelessWidget {
  final bool isLoss;
  final double percenatge;
  final bool? showBig;
  const ProfitLossIndicator(
      {Key? key, required this.isLoss, required this.percenatge, this.showBig})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isLoss ? Icons.arrow_drop_down_sharp : Icons.arrow_drop_up_sharp,
            color: isLoss ? AppColors.lossColor : AppColors.profitColor,
            size: showBig == null ? 25 : 30,
          ),
          Text(
            percenatge.toString() + "%",
            style: TextStyle(
                color: isLoss ? AppColors.lossColor : AppColors.profitColor,
                fontSize: showBig == null ? 14 : 18),
          )
        ],
      ),
    );
  }
}
