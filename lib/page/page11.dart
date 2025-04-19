import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/11-1-SIGNATURESget.dart';
import '10SELECTPLANT/10SELECTPLANTmain.dart';
import '11SIGNATURES/11SIGNATURESmain.dart';

class Page11 extends StatelessWidget {
  const Page11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page11UPLOAD();
  }
}

class Page11UPLOAD extends StatelessWidget {
  Page11UPLOAD({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SIGNATURESGET_Bloc(),
        child: BlocBuilder<SIGNATURESGET_Bloc, SIGNATURESClass>(
          builder: (context, data) {
            return Page11Body(
              data: data,
            );
          },
        ));
  }
}

class Page11Body extends StatelessWidget {
  Page11Body({Key? key, this.data}) : super(key: key);
  SIGNATURESClass? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: P11SIGNATURESmain(
        data: data,
      ),
    );
  }
}
