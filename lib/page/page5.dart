// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc/BlocEvent/05-1-FINSPECTIONget.dart';
// import '../bloc/BlocEvent/05-4-UPLOADSPEC.dart';
// import '../bloc/cubit/Rebuild.dart';

// import '05INSPECTIONstd/INSPECTIONstdMAIN.dart';

// class Page5 extends StatelessWidget {
//   const Page5({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Page5REBUILD();
//   }
// }

// class Page5REBUILD extends StatelessWidget {
//   const Page5REBUILD({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BlocPageRebuild, bool>(
//       builder: (_, e) {
//         return FINSPECTIONget_Bloc_5PBloc();
//       },
//     );
//   }
// }

// class FINSPECTIONget_Bloc_5PBloc extends StatelessWidget {
//   /// {@macro counter_page}
//   FINSPECTIONget_Bloc_5PBloc({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (_) => FINSPECTIONget_Bloc(),
//         child: BlocBuilder<FINSPECTIONget_Bloc, InspectionSTD>(
//           builder: (context, Mdata) {
//             return Page5UPLOAD(
//               Mdata: Mdata,
//             );
//           },
//         ));
//   }
// }

// class Page5UPLOAD extends StatelessWidget {
//   Page5UPLOAD({
//     Key? key,
//     this.Mdata,
//   }) : super(key: key);
//   InspectionSTD? Mdata;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (_) => UPLOADSPEC_Bloc(),
//         child: BlocBuilder<UPLOADSPEC_Bloc, String>(
//           builder: (context, msg) {
//             return Page5Body(
//               Mdata: Mdata,
//             );
//           },
//         ));
//   }
// }

// class Page5Body extends StatelessWidget {
//   Page5Body({
//     Key? key,
//     this.Mdata,
//   }) : super(key: key);

//   InspectionSTD? Mdata;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: INSPECTIONstdMAIN(
//         Mdata: Mdata,
//       ),
//     );
//   }
// }
