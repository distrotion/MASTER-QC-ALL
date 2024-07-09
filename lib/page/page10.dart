import 'package:flutter/material.dart';

import '10SELECTPLANT/10SELECTPLANTmain.dart';

class Page10 extends StatelessWidget {
  const Page10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page10Body();
  }
}

class Page10Body extends StatelessWidget {
  const Page10Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P10SELECTPLANTmain(),
    );
  }
}
