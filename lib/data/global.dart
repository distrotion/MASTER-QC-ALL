import 'package:flutter/material.dart';
import '../page/page0.dart';

String token = '';
Widget CuPage = const Page0();
int CuPageLV = 0;

class USERDATA {
  static int UserLV = 0;
  static String NAME = '';
  static String ID = '';
  static String LV = '';
  static String Section = '';
  static String Def = '';
  static String LOCATION = '';

  static List<String> DefList = [];
  static List<String> LOCATIONList = [];
}

class logindata {
  static bool isControl = false;
  static String userID = '';
  static String userPASS = '';
}

// String serverGB = 'http://127.0.0.1:14010/';
String serverGB = '';

final String serverPHHES = 'http://172.23.10.40:14800/';
final String serverPALHES = 'http://172.23.10.40:14810/';
//
final String serverPALBP12 = 'http://172.23.10.40:14730/';
final String serverPVDBP12 = 'http://172.23.10.40:14710/';
final String serverKNGBP12 = 'http://172.23.10.40:14720/';
final String serverPHBP12 = 'http://172.23.10.40:14010/';
// final String serverPHBP12 = 'http://127.0.0.1:14010/';

// String serverGB = serverPHBP12;


//24010177
//COMMENT-1695896166265YakN8gB0DoK4KJp
//COMMENT-1695896166265YakN8gB0DoK4KJp
