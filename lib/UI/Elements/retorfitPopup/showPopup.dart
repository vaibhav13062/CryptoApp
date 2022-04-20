import 'package:crypto_app/UI/Elements/retorfitPopup/popupWidget.dart';
import 'package:flutter/material.dart';


showPopup(BuildContext context,VoidCallback onDismiss,String? title, String? content) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (builder) {
        return PopupWidget(
          onDismiss: onDismiss,
          content: content,
          title: title,
        );
      });
}
