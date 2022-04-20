import 'package:crypto_app/MainUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../../../../Constants/AppColors.dart';
import '../../../Elements/ProfitLossIndicator.dart';

class MyCurrenciesSection extends StatelessWidget {
  const MyCurrenciesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MyCurrenciesSectionAppBar(),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return Bounceable(
                    onTap: () {
                      print("OnTap");
                    },
                    child: MyCurrencyItem());
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyCurrencyItem extends StatelessWidget {
  const MyCurrencyItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      child: Row(
        children: [
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.red,
            ),
          ),
          const SizedBox(
            width: 13,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ripple",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor1,
                          fontSize: 18),
                    ),
                    Text(
                      MainUtils().formatPrice(2300.0),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor1,
                          fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "XRP",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor2,
                          fontSize: 18),
                    ),
                    ProfitLossIndicator(isLoss: true, percenatge: 33.5)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyCurrenciesSectionAppBar extends StatelessWidget {
  const MyCurrenciesSectionAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "MY CURRENCIES",
            style: TextStyle(
                color: AppColors.textColor1,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          TextButton(
              onPressed: () {},
              child: Row(
                children: const [
                  Text(
                    "Manage",
                    style: TextStyle(
                        color: AppColors.textColor1,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: AppColors.textColor1,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
