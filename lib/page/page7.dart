import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/07-1-GRAPHlistGET.dart';
import '07GRAPH/P07GRAPHmain.dart';

class Page7 extends StatelessWidget {
  const Page7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page7Bodys();
  }
}

class Page7Bodys extends StatelessWidget {
  Page7Bodys({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GRAPHlistGET_Bloc(),
        child: BlocBuilder<GRAPHlistGET_Bloc, List<GRAPHlistClass>>(
          builder: (context, data) {
            return Page7Body(
              data: data,
            );
          },
        ));
  }
}

class Page7Body extends StatelessWidget {
  Page7Body({Key? key, this.data}) : super(key: key);
  List<GRAPHlistClass>? data;
  @override
  Widget build(BuildContext context) {
    return P07GRAPHmain(
      data: data,
    );
  }
}
