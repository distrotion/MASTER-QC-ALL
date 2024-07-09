import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/06-1-P6FINSPECTIONget.dart';
import '../bloc/BlocEvent/06-4-P6UPLOADSPEC.dart';
import '../bloc/cubit/Rebuild.dart';
import '06INSPECTIONstdN/P6INSPECTIONstdNmain.dart';

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page6REBUILD();
  }
}

class Page6REBUILD extends StatelessWidget {
  const Page6REBUILD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocPageRebuild, bool>(
      builder: (_, e) {
        return Page6FINSPECTIONget_Bloc();
      },
    );
  }
}

class Page6FINSPECTIONget_Bloc extends StatelessWidget {
  /// {@macro counter_page}
  Page6FINSPECTIONget_Bloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P6FINSPECTIONget_Bloc(),
        child: BlocBuilder<P6FINSPECTIONget_Bloc, P6InspectionSTD>(
          builder: (context, Mdata) {
            return Page6UPLOAD(
              Mdata: Mdata,
            );
          },
        ));
  }
}

class Page6UPLOAD extends StatelessWidget {
  Page6UPLOAD({
    Key? key,
    this.Mdata,
  }) : super(key: key);
  P6InspectionSTD? Mdata;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P6UPLOADSPEC_Bloc(),
        child: BlocBuilder<P6UPLOADSPEC_Bloc, String>(
          builder: (context, msg) {
            return Page6Body(
              Mdata: Mdata,
            );
          },
        ));
  }
}

class Page6Body extends StatelessWidget {
  Page6Body({
    Key? key,
    this.Mdata,
  }) : super(key: key);
  P6InspectionSTD? Mdata;
  @override
  Widget build(BuildContext context) {
    return P6P6InspectionSTDNmain(
      Mdata: Mdata,
    );
  }
}
