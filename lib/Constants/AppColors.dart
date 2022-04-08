import 'package:flutter/material.dart';

const bool isDarkMode = false;

class AppColors {
  static const Color shimmerColor = Color.fromARGB(218, 255, 161, 121);
  static const Color mainColor = isDarkMode
      ? Color.fromRGBO(14, 14, 14, 1)
      : Color.fromRGBO(255, 255, 255, 0.5);
  static const Color borderColor = isDarkMode
      ? Color.fromRGBO(65, 65, 65,1)
      : Color.fromRGBO(255, 255, 255, 1);
  static const Color solidButtonColor = isDarkMode
      ? Color.fromRGBO(14, 14, 14, 1)
      : Color.fromRGBO(255, 255, 255, 1);

  static const Color selectedIcon = isDarkMode
      ? Color.fromRGBO(234, 230, 248, 1)
      : Color.fromRGBO(45, 45, 61, 1);

  static const Color unSelectedIcon = isDarkMode
      ? Color.fromRGBO(163, 159, 185, 1)
      : Color.fromRGBO(83, 82, 96, 1);
  static const Color backgroundColor =
      isDarkMode ? Color(0xff0e0e0e) : Color(0xffe5e5e5);

  static LinearGradient appBarBackgroundColorGradient = isDarkMode
      ? const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(50, 50, 50, 0.8),
            Color.fromRGBO(50, 50, 50, 0.8),
          ],
        )
      : const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(255, 255, 255, 0.6),
            Color.fromRGBO(255, 255, 255, 0.6),
          ],
        );
  static LinearGradient appBarBorderGradient = isDarkMode
      ? const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            borderColor,
            Color.fromRGBO(50, 50, 50, 0.8)
          ],
        )
      : const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            borderColor,
            borderColor
          ],
        );
}