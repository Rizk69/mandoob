import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;


getTextDirection(BuildContext context) {
  return isCurrentLanguageEn(context)
      ? ui.TextDirection.ltr
      : ui.TextDirection.rtl;
}

bool isEmailValid(String email) {
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isMobileNumberValid(String mobileNumber) {
  RegExp regex = RegExp(r'^(01[0-2]|02|03|015)[0-9]{8}$');
  return regex.hasMatch(mobileNumber);
}

bool isCurrentLanguageEn(context) {
  return EasyLocalization.of(context)!.locale.languageCode == 'en'
      ? true
      : false;
}


String translateString({String? arString , String? enString , required BuildContext context}){

  if(arString == null || enString == null){
    nullTranslateString(
        arString: arString,
        enString: enString
    );
  }
  else if( isCurrentLanguageEn(context)){
    return enString;
  }
  else{
    return arString;
  }
  return "";
}

String? nullTranslateString ({String? arString , String? enString }){

  if(arString == null){
    return enString;
  }else if (enString == null){
    return arString;
  }
  return null;

}