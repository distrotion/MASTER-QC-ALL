import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/03-1-INPROCESSMASTERget.dart';
import '../bloc/BlocEvent/03-2-INPROCESSMASTERmsg.dart';
import '../bloc/BlocEvent/03-3-INPROCESSMASTERdropdown.dart';
import '../bloc/cubit/Rebuild.dart';
import '03INPROCESS/INPROCESSMASTERmain.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page3REBUILD();
  }
}

class Page3REBUILD extends StatelessWidget {
  const Page3REBUILD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocPageRebuild, bool>(
      builder: (_, e) {
        return Page3BlocTableBody();
      },
    );
  }
}

class Page3BlocTableBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page3BlocTableBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => INPROCESSMASTER_Bloc(),
        child: BlocBuilder<INPROCESSMASTER_Bloc, DatasetWithSatatus>(
          builder: (context, data) {
            return Page3BlocMSG(
              data: data,
            );
          },
        ));
  }
}

class Page3BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page3BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  DatasetWithSatatus? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => INPROCESSMASTERmsg_Bloc(),
        child: BlocBuilder<INPROCESSMASTERmsg_Bloc, String>(
          builder: (context, msg) {
            return Page3BlocDROPDOWN(
              data: data,
              msg: msg,
            );
          },
        ));
  }
}

class Page3BlocDROPDOWN extends StatelessWidget {
  /// {@macro counter_page}
  Page3BlocDROPDOWN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  DatasetWithSatatus? data;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => INPROCESSMASTERdropdown_Bloc(),
        child: BlocBuilder<INPROCESSMASTERdropdown_Bloc, DROPDOWNset>(
          builder: (context, DD) {
            return Page3Body(
              data: data,
              msg: msg,
              DD: DD,
            );
          },
        ));
  }
}

class Page3Body extends StatelessWidget {
  Page3Body({
    Key? key,
    this.data,
    this.msg,
    this.DD,
  }) : super(key: key);
  DatasetWithSatatus? data;
  String? msg;
  DROPDOWNset? DD;
  @override
  Widget build(BuildContext context) {
    return INPROCESSMASTERmain(
      data: data,
      msg: msg,
      DD: DD,
    );
  }
}

//DROPDOWNset