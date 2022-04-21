import 'package:crypto_app/Constants/DeviceSizeConfig.dart';
import 'package:crypto_app/MainUtils.dart';
import 'package:crypto_app/UI/Elements/NormalSizedButton.dart';
import 'package:crypto_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';

import '../../../Providers/ThemeProvider.dart';
import '../../../Providers/UserAmountCalculator.dart';

class DepositPopup extends StatefulWidget {
  DepositPopup({Key? key}) : super(key: key);

  @override
  State<DepositPopup> createState() => _DepositPopupState();
}

class _DepositPopupState extends State<DepositPopup> {
  bool isValid = false;
  bool hasAmountEntered = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: GlassmorphicContainer(
        width: DeviceSizeConfig.screenWidth! - 40,
        height: DeviceSizeConfig.screenWidth!,
        borderRadius: 20,
        linearGradient:
            Provider.of<ThemeProvider>(context).appBarBackgroundColorGradient,
        borderGradient:
            Provider.of<ThemeProvider>(context).appBarBorderGradient,
        border: 3,
        blur: 2,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Deposit INR",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Provider.of<ThemeProvider>(context).textColor1,
                    fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(15),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Provider.of<ThemeProvider>(context).backgroundColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Text("Current Balance",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color:
                                Provider.of<ThemeProvider>(context).textColor1,
                            fontSize: 14)),
                    Spacer(),
                    Text(
                        MainUtils().formatPrice(
                            Provider.of<UserAmountCalculator>(context)
                                .inrBalance
                                .toDouble()),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:
                                Provider.of<ThemeProvider>(context).textColor1,
                            fontSize: 16))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                onChanged: (value) {
                  print(value);
                  if (int.parse(value) >= 100 && int.parse(value) <= 10000) {
                    isValid = true;
                  } else {
                    isValid = false;
                  }
                },
                controller: amountController,
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    focusColor: Provider.of<ThemeProvider>(context).textColor1,
                    iconColor: Provider.of<ThemeProvider>(context).textColor1,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: Provider.of<ThemeProvider>(context)
                                .textColor1)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Provider.of<ThemeProvider>(context)
                                .textColor1)),
                    labelText: 'Enter amount',
                    labelStyle: TextStyle(
                        color: Provider.of<ThemeProvider>(context).textColor1)),
                cursorColor: Provider.of<ThemeProvider>(context).textColor1,
              ),
              SizedBox(
                height: 3,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                    "Min " +
                        MainUtils().formatPrice(100) +
                        " | Max " +
                        MainUtils().formatPrice(10000),
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeProvider>(context).textColor1,
                        fontSize: 12)),
              ),
              Spacer(),
              NormalSizedButton(
                  text: "DEPOSIT",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  textColor: Provider.of<ThemeProvider>(context).textColor1,
                  color: Provider.of<ThemeProvider>(context).solidButtonColor,
                  function: () {
                    if (isValid) {
                      print("Valid");
                      Provider.of<UserAmountCalculator>(context, listen: false)
                          .addFunds(int.parse(amountController.text));
                      navigatorKey.currentState!.pop();
                    } else {
                      print("INValid");
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class WithdrawPopup extends StatefulWidget {
  WithdrawPopup({Key? key}) : super(key: key);

  @override
  State<WithdrawPopup> createState() => _WithdrawPopupState();
}

class _WithdrawPopupState extends State<WithdrawPopup> {
  bool isValid = false;
  bool hasAmountEntered = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: GlassmorphicContainer(
        width: DeviceSizeConfig.screenWidth! - 40,
        height: DeviceSizeConfig.screenWidth!,
        borderRadius: 20,
        linearGradient:
            Provider.of<ThemeProvider>(context).appBarBackgroundColorGradient,
        borderGradient:
            Provider.of<ThemeProvider>(context).appBarBorderGradient,
        border: 3,
        blur: 2,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Withdraw amount",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Provider.of<ThemeProvider>(context).textColor1,
                    fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(15),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Provider.of<ThemeProvider>(context).backgroundColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Text("Current Balance",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color:
                                Provider.of<ThemeProvider>(context).textColor1,
                            fontSize: 14)),
                    Spacer(),
                    Text(
                        MainUtils().formatPrice(
                            Provider.of<UserAmountCalculator>(context)
                                .inrBalance
                                .toDouble()),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color:
                                Provider.of<ThemeProvider>(context).textColor1,
                            fontSize: 16))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                onChanged: (value) {},
                controller: amountController,
                maxLines: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    focusColor: Provider.of<ThemeProvider>(context).textColor1,
                    iconColor: Provider.of<ThemeProvider>(context).textColor1,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: Provider.of<ThemeProvider>(context)
                                .textColor1)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Provider.of<ThemeProvider>(context)
                                .textColor1)),
                    labelText: 'Enter amount',
                    labelStyle: TextStyle(
                        color: Provider.of<ThemeProvider>(context).textColor1)),
                cursorColor: Provider.of<ThemeProvider>(context).textColor1,
              ),
              SizedBox(
                height: 3,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                    "Max " +
                        Provider.of<UserAmountCalculator>(context)
                            .inrBalance
                            .toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Provider.of<ThemeProvider>(context).textColor1,
                        fontSize: 12)),
              ),
              Spacer(),
              NormalSizedButton(
                  text: "WITHDRAW",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  textColor: Provider.of<ThemeProvider>(context).textColor1,
                  color: Provider.of<ThemeProvider>(context).solidButtonColor,
                  function: () {
                    print("Valid");
                    if (Provider.of<UserAmountCalculator>(context,
                                listen: false)
                            .inrBalance >=
                        int.parse(amountController.text)) {
                      Provider.of<UserAmountCalculator>(context, listen: false)
                          .widhrawFunds(int.parse(amountController.text));
                      navigatorKey.currentState!.pop();
                    } else {
                      print("INVALID");
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
