import 'package:flutter/material.dart';
class AppWidget{
  static TextStyle boldTextFeildStyle(){
    return TextStyle(
        color:Colors.black,
        fontSize:20.0,
        fontWeight:FontWeight.bold,
        fontFamily: "Lora");
  }

  static TextStyle HeadlineTextFeildStyle(){
    return TextStyle(
        color:Colors.black,
        fontSize:24.0,
        fontWeight:FontWeight.bold,
        fontFamily: "Lora");
  }
  static TextStyle LightTextFeildStyle(){
    return TextStyle(
        color:Colors.black54,
        fontSize:17.0,
        fontWeight:FontWeight.bold,
        fontFamily: "Lora");
  }

  static TextStyle semiBoldTextFeildStyle(){
    return TextStyle(
        color:Colors.black,
        fontSize:20.0,
        fontWeight:FontWeight.normal,
        fontFamily: "Lora");
  }

  static TextStyle semiBold2TextFeildStyle(){
    return TextStyle(
        color:Colors.black,
        fontSize:17.0,
        fontWeight:FontWeight.normal,
        fontFamily: "Lora");
  }
}
