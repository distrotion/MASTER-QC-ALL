import 'package:flutter/material.dart';

import '../data/global.dart';
import 'TEST.dart';
import 'page10.dart';
import 'page11.dart';
import 'page2.dart';
import 'page4.dart';
import 'page5.dart';
import 'page6.dart';

bool isChecked = false;

class Page0 extends StatelessWidget {
  const Page0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page0Body();
    // return Page6();
  }
}

class Page0Body extends StatelessWidget {
  const Page0Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (serverGB == '') {
    return Page10();
    // } else {
    //   return Page4();
    // }
  }
}
