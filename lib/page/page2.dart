import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/02-1-FINALMASTERget.dart';
import '../bloc/BlocEvent/02-2-FINALMASTERmsg.dart';
import '../bloc/BlocEvent/02-3-FINALMASTERdropdown.dart';
import '../bloc/cubit/Rebuild.dart';
import '02FINALMASTER/FINALMASTERmain.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page2REBUILD();
  }
}

class Page2REBUILD extends StatelessWidget {
  const Page2REBUILD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocPageRebuild, bool>(
      builder: (_, e) {
        return Page2BlocTableBody();
      },
    );
  }
}

class Page2BlocTableBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page2BlocTableBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => FINALMASTER_Bloc(),
        child: BlocBuilder<FINALMASTER_Bloc, DatasetWithSatatus>(
          builder: (context, data) {
            return Page2BlocMSG(
              data: data,
            );
          },
        ));
  }
}

class Page2BlocMSG extends StatelessWidget {
  /// {@macro counter_page}
  Page2BlocMSG({
    Key? key,
    this.data,
  }) : super(key: key);
  DatasetWithSatatus? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => FINALMASTERmsg_Bloc(),
        child: BlocBuilder<FINALMASTERmsg_Bloc, String>(
          builder: (context, msg) {
            return Page2BlocDROPDOWN(
              data: data,
              msg: msg,
            );
          },
        ));
  }
}

class Page2BlocDROPDOWN extends StatelessWidget {
  /// {@macro counter_page}
  Page2BlocDROPDOWN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  DatasetWithSatatus? data;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => FINALMASTERdropdown_Bloc(),
        child: BlocBuilder<FINALMASTERdropdown_Bloc, DROPDOWNset>(
          builder: (context, DD) {
            return Page2Body(
              data: data,
              msg: msg,
              DD: DD,
            );
          },
        ));
  }
}

class Page2Body extends StatelessWidget {
  Page2Body({
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
    return FINALMASTERmain(
      data: data,
      msg: msg,
      DD: DD,
    );
  }
}

//DROPDOWNset