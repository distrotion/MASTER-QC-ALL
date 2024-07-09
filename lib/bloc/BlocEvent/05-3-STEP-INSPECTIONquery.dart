// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../data/global.dart';
// import '../../page/05INSPECTIONstd/INSPECTIONstdVAR.dart';

// //-------------------------------------------------
// String server = serverGB;

// abstract class INSPECTION_Event {}

// class INSPECTION_GET_STEP1 extends INSPECTION_Event {}

// class INSPECTION_GET_STEP2 extends INSPECTION_Event {}

// class INSPECTION_GET_DOCUMENT extends INSPECTION_Event {}

// class INSPECTION_GET_CALCULATE extends INSPECTION_Event {}

// class INSPECTION_FLUSH extends INSPECTION_Event {}

// class INSPECTION_DDSTEP_Bloc
//     extends Bloc<INSPECTION_Event, DROPDOWN_INS_STEP1> {
//   INSPECTION_DDSTEP_Bloc()
//       : super(DROPDOWN_INS_STEP1(
//           //
//           ITEMSdd: [],
//           //
//           COREdd: [],
//           SCMASKdd: [],
//           SCMASKTYPEdd: [],
//           IMGreadDATAdd: [],
//           IMGreadNOdd: [],
//           LOADdd: [],
//           GTdd: [],
//           UNITdd: [],
//           FREQUENCYdd: [],
//           CALCULATEdd: [],
//           //
//           METHODdd: [],
//           SPECIFICATIONdd: [],
//         )) {
//     on<INSPECTION_GET_STEP1>((event, emit) {
//       return _INSPECTION_GET_STEP1(
//           DROPDOWN_INS_STEP1(
//             //
//             ITEMSdd: [],
//             //
//             COREdd: [],
//             SCMASKdd: [],
//             SCMASKTYPEdd: [],
//             IMGreadDATAdd: [],
//             IMGreadNOdd: [],
//             LOADdd: [],
//             GTdd: [],
//             UNITdd: [],
//             FREQUENCYdd: [],
//             CALCULATEdd: [],
//             //
//             METHODdd: [],
//             SPECIFICATIONdd: [],
//           ),
//           emit);
//     });
//     on<INSPECTION_GET_STEP2>((event, emit) {
//       return _INSPECTION_GET_STEP2(
//           DROPDOWN_INS_STEP1(
//             //
//             ITEMSdd: [],
//             //
//             COREdd: [],
//             SCMASKdd: [],
//             SCMASKTYPEdd: [],
//             IMGreadDATAdd: [],
//             IMGreadNOdd: [],
//             LOADdd: [],
//             GTdd: [],
//             UNITdd: [],
//             FREQUENCYdd: [],
//             CALCULATEdd: [],
//             //
//             METHODdd: [],
//             SPECIFICATIONdd: [],
//           ),
//           emit);
//     });

//     on<INSPECTION_GET_DOCUMENT>((event, emit) {
//       return _INSPECTION_GET_DOCUMENT(
//           DROPDOWN_INS_STEP1(
//             //
//             ITEMSdd: [],
//             //
//             COREdd: [],
//             SCMASKdd: [],
//             SCMASKTYPEdd: [],
//             IMGreadDATAdd: [],
//             IMGreadNOdd: [],
//             LOADdd: [],
//             GTdd: [],
//             UNITdd: [],
//             FREQUENCYdd: [],
//             CALCULATEdd: [],
//             //
//             METHODdd: [],
//             SPECIFICATIONdd: [],
//           ),
//           emit);
//     });
//     //_INSPECTION_GET_CALCULATE
//     on<INSPECTION_GET_CALCULATE>((event, emit) {
//       return _INSPECTION_GET_CALCULATE(
//           DROPDOWN_INS_STEP1(
//             //
//             ITEMSdd: [],
//             //
//             COREdd: [],
//             SCMASKdd: [],
//             SCMASKTYPEdd: [],
//             IMGreadDATAdd: [],
//             IMGreadNOdd: [],
//             LOADdd: [],
//             GTdd: [],
//             UNITdd: [],
//             FREQUENCYdd: [],
//             CALCULATEdd: [],
//             //
//             METHODdd: [],
//             SPECIFICATIONdd: [],
//           ),
//           emit);
//     });

//     on<INSPECTION_FLUSH>((event, emit) {
//       return _INSPECTION_FLUSH(
//           DROPDOWN_INS_STEP1(
//             //
//             ITEMSdd: [],
//             //
//             COREdd: [],
//             SCMASKdd: [],
//             SCMASKTYPEdd: [],
//             IMGreadDATAdd: [],
//             IMGreadNOdd: [],
//             LOADdd: [],
//             GTdd: [],
//             UNITdd: [],
//             FREQUENCYdd: [],
//             CALCULATEdd: [],
//             //
//             METHODdd: [],
//             SPECIFICATIONdd: [],
//           ),
//           emit);
//     });
//   }

//   Future<void> _INSPECTION_GET_STEP1(
//       DROPDOWN_INS_STEP1 toAdd, Emitter<DROPDOWN_INS_STEP1> emit) async {
//     DROPDOWN_INS_STEP1 output = DROPDOWN_INS_STEP1(
//       //
//       ITEMSdd: [MapEntry("", "")],
//       //
//       COREdd: [],
//       SCMASKdd: [],
//       SCMASKTYPEdd: [],
//       IMGreadDATAdd: [],
//       IMGreadNOdd: [],
//       LOADdd: [MapEntry("", "")],
//       GTdd: [MapEntry("", "")],
//       UNITdd: [MapEntry("", "")],
//       FREQUENCYdd: [MapEntry("", "")],
//       CALCULATEdd: [MapEntry("", "")],
//       //
//       METHODdd: [MapEntry("", "")],
//       SPECIFICATIONdd: [MapEntry("", "")],
//     );
//     final response = await Dio().post(
//       server + "INSPECTION_GET_STEP1",
//       data: {},
//     );
//     if (response.statusCode == 200) {
//       // var databuff = jsonDecode(response.body);
//       var databuff = response.data;
//       // print(databuff);

//       output.status = 'STEP1';

//       if (databuff['ITEMs'] != null) {
//         for (int i = 0; i < databuff['ITEMs'].length; i++) {
//           output.ITEMSdd.add(MapEntry(databuff['ITEMs'][i]['ITEMs'].toString(),
//               databuff['ITEMs'][i]['masterID'].toString()));
//         }
//       }
//       //
//     } else {
//       //
//     }

//     emit(output);
//   }

//   Future<void> _INSPECTION_GET_STEP2(
//       DROPDOWN_INS_STEP1 toAdd, Emitter<DROPDOWN_INS_STEP1> emit) async {
//     DROPDOWN_INS_STEP1 output = DROPDOWN_INS_STEP1(
//       //
//       ITEMSdd: [],
//       //
//       COREdd: [MapEntry("", "")],
//       SCMASKdd: [],
//       SCMASKTYPEdd: [],
//       IMGreadDATAdd: [],
//       IMGreadNOdd: [],
//       LOADdd: [MapEntry("", "")],
//       GTdd: [MapEntry("", "")],
//       UNITdd: [MapEntry("", "")],
//       FREQUENCYdd: [MapEntry("", "")],
//       CALCULATEdd: [MapEntry("", "")],
//       //
//       METHODdd: [MapEntry("", "")],
//       SPECIFICATIONdd: [],
//     );
//     final response = await Dio().post(
//       server + "INSPECTION_GET_STEP2",
//       data: {
//         "ITEMs": INSPECTIONstdVAR.FINAL_ITEMs,
//       },
//     );
//     if (response.statusCode == 200) {
//       // var databuff = jsonDecode(response.body);
//       var databuff = response.data;
//       // print(databuff);

//       output.status = 'STEP2';

//       output.RESULTFORMATdata = databuff['RESULTFORMATdata'] != null
//           ? databuff['RESULTFORMATdata'].toString()
//           : "";

//       if (databuff['METHOD'] != null) {
//         for (int i = 0; i < databuff['METHOD'].length; i++) {
//           output.METHODdd.add(MapEntry(
//               databuff['METHOD'][i]['METHOD'].toString(),
//               databuff['METHOD'][i]['masterID'].toString()));
//         }
//       }
//       if (databuff['LOAD'] != null) {
//         for (int i = 0; i < databuff['LOAD'].length; i++) {
//           output.LOADdd.add(MapEntry(databuff['LOAD'][i]['LOAD'].toString(),
//               databuff['LOAD'][i]['LOAD'].toString()));
//         }
//       }
//       if (databuff['GT'] != null) {
//         for (int i = 0; i < databuff['GT'].length; i++) {
//           output.GTdd.add(MapEntry(
//             databuff['GT'][i]['GT'].toString(),
//             databuff['GT'][i]['GT'].toString(),
//           ));
//         }
//       }
//       if (databuff['UNIT'] != null) {
//         for (int i = 0; i < databuff['UNIT'].length; i++) {
//           output.UNITdd.add(MapEntry(databuff['UNIT'][i]['UNIT'].toString(),
//               databuff['UNIT'][i]['masterID'].toString()));
//         }
//       }
//       if (databuff['FREQUENCY'] != null) {
//         for (int i = 0; i < databuff['FREQUENCY'].length; i++) {
//           output.FREQUENCYdd.add(MapEntry(
//               databuff['FREQUENCY'][i]['FREQUENCY'].toString(),
//               databuff['FREQUENCY'][i]['FREQUENCY'].toString()));
//         }
//       }

//       if (databuff['CORETYPE'] != null) {
//         for (int i = 0; i < databuff['CORETYPE'].length; i++) {
//           output.COREdd.add(MapEntry(
//               databuff['CORETYPE'][i]['CORETYPE'].toString(),
//               databuff['CORETYPE'][i]['CORETYPE'].toString()));
//         }
//       }

//       if (databuff['CALCULATE'] != null) {
//         for (int i = 0; i < databuff['CALCULATE'].length; i++) {
//           output.CALCULATEdd.add(MapEntry(
//               databuff['CALCULATE'][i]['CALCULATE'].toString(),
//               databuff['CALCULATE'][i]['masterID'].toString()));
//         }
//       }
//       //
//     } else {
//       //
//     }

//     emit(output);
//   }

//   Future<void> _INSPECTION_GET_DOCUMENT(
//       DROPDOWN_INS_STEP1 toAdd, Emitter<DROPDOWN_INS_STEP1> emit) async {
//     DROPDOWN_INS_STEP1 output = DROPDOWN_INS_STEP1(
//       //
//       ITEMSdd: [],
//       //
//       COREdd: [],
//       SCMASKdd: [],
//       SCMASKTYPEdd: [],
//       IMGreadDATAdd: [],
//       IMGreadNOdd: [],
//       LOADdd: [],
//       GTdd: [],
//       UNITdd: [],
//       FREQUENCYdd: [],
//       CALCULATEdd: [],
//       //
//       METHODdd: [],
//       SPECIFICATIONdd: [],
//     );
//     final response = await Dio().post(
//       server + "GET_DOCUMENT",
//       data: {
//         "METHODid": INSPECTIONstdVAR.FINAL_METHOD,
//       },
//     );
//     if (response.statusCode == 200) {
//       var databuff = response.data;
//       print(databuff);

//       output.status = 'GET_DOCUMENT';
//       output.DOCUMENT =
//           databuff['DOCUMENT'] != null ? databuff['DOCUMENT'].toString() : "";
//     }
//     emit(output);
//   }

//   Future<void> _INSPECTION_GET_CALCULATE(
//       DROPDOWN_INS_STEP1 toAdd, Emitter<DROPDOWN_INS_STEP1> emit) async {
//     DROPDOWN_INS_STEP1 output = DROPDOWN_INS_STEP1(
//       //
//       ITEMSdd: [],
//       //
//       COREdd: [],
//       SCMASKdd: [],
//       SCMASKTYPEdd: [],
//       IMGreadDATAdd: [],
//       IMGreadNOdd: [],
//       LOADdd: [],
//       GTdd: [],
//       UNITdd: [],
//       FREQUENCYdd: [],
//       CALCULATEdd: [],
//       //
//       METHODdd: [],
//       SPECIFICATIONdd: [],
//     );
//     final response = await Dio().post(
//       server + "GET_CALCULATE",
//       data: {
//         "CALid": INSPECTIONstdVAR.FINAL_CALCULATE,
//       },
//     );
//     if (response.statusCode == 200) {
//       var databuff = response.data;
//       print(databuff);

//       output.status = 'GET_CALCULATE';
//       output.F_K1_N = databuff['K1'] != null ? databuff['K1'].toString() : "";
//       output.F_K2_N = databuff['K2'] != null ? databuff['K2'].toString() : "";
//       output.F_K3_N = databuff['K3'] != null ? databuff['K3'].toString() : "";

//       output.F_K1b_b =
//           databuff['K1b'] != null ? RboolFN(databuff['K1b'].toString()) : false;
//       output.F_K2b_b =
//           databuff['K2b'] != null ? RboolFN(databuff['K2b'].toString()) : false;
//       output.F_K3b_b =
//           databuff['K3b'] != null ? RboolFN(databuff['K3b'].toString()) : false;

// //RboolFN
//       // output.DOCUMENT =
//       //     databuff['DOCUMENT'] != null ? databuff['DOCUMENT'].toString() : "";
//     }
//     emit(output);
//   }

//   Future<void> _INSPECTION_FLUSH(
//       DROPDOWN_INS_STEP1 toAdd, Emitter<DROPDOWN_INS_STEP1> emit) async {
//     DROPDOWN_INS_STEP1 output = DROPDOWN_INS_STEP1(
//       //
//       ITEMSdd: [],
//       //
//       COREdd: [],
//       SCMASKdd: [],
//       SCMASKTYPEdd: [],
//       IMGreadDATAdd: [],
//       IMGreadNOdd: [],
//       LOADdd: [],
//       GTdd: [],
//       UNITdd: [],
//       FREQUENCYdd: [],
//       CALCULATEdd: [],
//       //
//       METHODdd: [],
//       SPECIFICATIONdd: [],
//     );
//     output.status = '';
//     emit(output);
//   }
// }

// class DROPDOWN_INS_STEP1 {
//   DROPDOWN_INS_STEP1({
//     this.status = '',
//     this.RESULTFORMATdata = '',
//     this.DOCUMENT = '',
//     //lode step 1
//     required this.ITEMSdd,
//     //lode step 2
//     required this.COREdd,
//     required this.SCMASKdd,
//     required this.SCMASKTYPEdd,
//     required this.IMGreadDATAdd,
//     required this.IMGreadNOdd,
//     required this.LOADdd,
//     required this.GTdd,
//     required this.UNITdd,
//     required this.FREQUENCYdd,
//     required this.CALCULATEdd,
//     //lode step 3
//     required this.METHODdd,
//     required this.SPECIFICATIONdd,
//     //
//     this.F_K1_N = '',
//     this.F_K2_N = '',
//     this.F_K3_N = '',
//     this.F_K1b_b = false,
//     this.F_K2b_b = false,
//     this.F_K3b_b = false,
//   });
//   String status;
//   String RESULTFORMATdata;
//   String DOCUMENT;
//   //lode step 1
//   List<MapEntry<String, String>> ITEMSdd;

//   //lode step 2
//   List<MapEntry<String, String>> METHODdd;
//   List<MapEntry<String, String>> COREdd;
//   List<MapEntry<String, String>> SCMASKdd;
//   List<MapEntry<String, String>> SCMASKTYPEdd;
//   List<MapEntry<String, String>> IMGreadDATAdd;
//   List<MapEntry<String, String>> IMGreadNOdd;
//   List<MapEntry<String, String>> LOADdd;
//   List<MapEntry<String, String>> GTdd;
//   List<MapEntry<String, String>> UNITdd;
//   List<MapEntry<String, String>> FREQUENCYdd;
//   List<MapEntry<String, String>> CALCULATEdd;

//   //lode step 3

//   List<MapEntry<String, String>> SPECIFICATIONdd;

//   //
//   String F_K1_N;
//   String F_K2_N;
//   String F_K3_N;

//   bool F_K1b_b;
//   bool F_K2b_b;
//   bool F_K3b_b;
// }

// bool RboolFN(String input) {
//   bool output = false;

//   if (input == 'TRUE' || input == 'true') {
//     output = true;
//   }
//   return output;
// }
