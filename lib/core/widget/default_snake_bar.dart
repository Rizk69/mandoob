import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

defaultSnakeBar({
  required String title,
  required String message,
  required ContentType state,
}){
  return SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: state,
    ),
  );
}

