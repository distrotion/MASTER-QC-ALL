import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/04-1-MATCPlistGET.dart';
import '04MATCPlist/04MATCPlistMAIN.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page4GET();
  }
}

class Page4GET extends StatelessWidget {
  Page4GET({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => MATCPlistGET_Bloc(),
        child: BlocBuilder<MATCPlistGET_Bloc, List<MATCPlistClass>>(
          builder: (context, data) {
            return Page4Body(
              data: data,
            );
          },
        ));
  }
}

class Page4Body extends StatelessWidget {
  Page4Body({
    Key? key,
    this.data,
  }) : super(key: key);
  List<MATCPlistClass>? data;
  @override
  Widget build(BuildContext context) {
    return MATCPlistMAIN(
      data: data,
    );
  }
}
