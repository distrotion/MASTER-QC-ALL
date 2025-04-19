// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../data/global.dart';
// import '../../page/04MATCPlist/04MATCPlistMAINvar.dart';
// import '../../page/05INSPECTIONstd/INSPECTIONstdVAR.dart';

// //-------------------------------------------------

// // String serverGB = serverGB;

// abstract class FINSPECTIONget_Event {}

// class FINSPECTIONget_MATCP extends FINSPECTIONget_Event {}

// class FINSPECTIONget_FLUSH extends FINSPECTIONget_Event {}

// class FINSPECTIONget_Bloc extends Bloc<FINSPECTIONget_Event, InspectionSTD> {
//   FINSPECTIONget_Bloc()
//       : super(InspectionSTD(
//           INCOMMING: [],
//           INPROCESS: [],
//           FINAL: [],
//         )) {
//     on<FINSPECTIONget_MATCP>((event, emit) {
//       return _FINSPECTIONget_MATCP(
//           InspectionSTD(
//             INCOMMING: [],
//             INPROCESS: [],
//             FINAL: [],
//           ),
//           emit);
//     });
//     on<FINSPECTIONget_FLUSH>((event, emit) {
//       return _FINSPECTIONget_FLUSH(
//           InspectionSTD(
//             INCOMMING: [],
//             INPROCESS: [],
//             FINAL: [],
//           ),
//           emit);
//     });
//   }
//   Future<void> _FINSPECTIONget_MATCP(
//       InspectionSTD toAdd, Emitter<InspectionSTD> emit) async {
//     InspectionSTD output = InspectionSTD(
//       INCOMMING: [],
//       INPROCESS: [],
//       FINAL: [],
//     );
//     // INSPECTIONstdVAR.CP = MATCPlistMAINvar.CP;
//     // INSPECTIONstdVAR.FG = MATCPlistMAINvar.FG;
//     // INSPECTIONstdVAR.CUSTOMER = MATCPlistMAINvar.CUSTOMER;
//     // INSPECTIONstdVAR.PART = MATCPlistMAINvar.PART;
//     // INSPECTIONstdVAR.PARTNAME = MATCPlistMAINvar.PARTNAME;
//     // INSPECTIONstdVAR.MATERIAL = MATCPlistMAINvar.MATERIAL;
//     // INSPECTIONstdVAR.CUST_FULLNM = MATCPlistMAINvar.CUST_FULLNM;

//     final response = await Dio().post(
//       serverGB + "GET_MATCP_DATA",
//       data: {
//         "MATCP": INSPECTIONstdVAR.CP,
//       },
//     );
//     if (response.statusCode == 200) {
//       var databuff = response.data;
//       // print(databuff[0]['FINAL']);

//       output.status = 'GET_ALL';

//       // print(databuff[0]['findTYPE_FN']);
//       List<BasicBodyData> findTYPE_FN = [];
//       if (databuff[0]['findTYPE_FN'] != null) {
//         for (int i = 0; i < databuff[0]['findTYPE_FN'].length; i++) {
//           findTYPE_FN.add(BasicBodyData(
//             NAME: databuff[0]['findTYPE_FN'][i]['TYPE'] != null
//                 ? databuff[0]['findTYPE_FN'][i]['TYPE'].toString()
//                 : "",
//             masterID: databuff[0]['findTYPE_FN'][i]['masterID'] != null
//                 ? databuff[0]['findTYPE_FN'][i]['masterID'].toString()
//                 : "",
//           ));
//         }
//       }

//       List<BasicBodyData> findTYPE_IC = [];
//       if (databuff[0]['findTYPE_IC'] != null) {
//         for (int i = 0; i < databuff[0]['findTYPE_IC'].length; i++) {
//           findTYPE_IC.add(BasicBodyData(
//             NAME: databuff[0]['findTYPE_IC'][i]['TYPE'] != null
//                 ? databuff[0]['findTYPE_IC'][i]['TYPE'].toString()
//                 : "",
//             masterID: databuff[0]['findTYPE_IC'][i]['masterID'] != null
//                 ? databuff[0]['findTYPE_IC'][i]['masterID'].toString()
//                 : "",
//           ));
//         }
//       }

//       String findTYPE_FNconv(String input) {
//         String output = "";

//         for (int i = 0; i < findTYPE_FN.length; i++) {
//           if (input == findTYPE_FN[i].masterID) {
//             output = findTYPE_FN[i].NAME;
//             break;
//           }
//         }

//         return output;
//       }

//       String findTYPE_ICconv(String input) {
//         String output = "";

//         for (int i = 0; i < findTYPE_IC.length; i++) {
//           if (input == findTYPE_IC[i].masterID) {
//             output = findTYPE_IC[i].NAME;
//             break;
//           }
//         }

//         return output;
//       }

//       List<BasicBodyData> findITEMs_FN = [];

//       if (databuff[0]['findITEMs_FN'] != null) {
//         for (int i = 0; i < databuff[0]['findITEMs_FN'].length; i++) {
//           findITEMs_FN.add(BasicBodyData(
//             NAME: databuff[0]['findITEMs_FN'][i]['ITEMs'] != null
//                 ? databuff[0]['findITEMs_FN'][i]['ITEMs'].toString()
//                 : "",
//             masterID: databuff[0]['findITEMs_FN'][i]['masterID'] != null
//                 ? databuff[0]['findITEMs_FN'][i]['masterID'].toString()
//                 : "",
//           ));
//         }
//       }

//       List<BasicBodyData> findITEMs_IC = [];

//       if (databuff[0]['findITEMs_IC'] != null) {
//         for (int i = 0; i < databuff[0]['findITEMs_IC'].length; i++) {
//           // print('----->${databuff[0]['findITEMs_IC'][i]['masterID']}');
//           findITEMs_IC.add(BasicBodyData(
//             NAME: databuff[0]['findITEMs_IC'][i]['ITEMs'] != null
//                 ? databuff[0]['findITEMs_IC'][i]['ITEMs'].toString()
//                 : "",
//             masterID: databuff[0]['findITEMs_IC'][i]['masterID'] != null
//                 ? databuff[0]['findITEMs_IC'][i]['masterID'].toString()
//                 : "",
//           ));
//         }
//       }

//       String findITEMs_FNconv(String input) {
//         String output = "";

//         for (int i = 0; i < findITEMs_FN.length; i++) {
//           if (input == findITEMs_FN[i].masterID) {
//             output = findITEMs_FN[i].NAME;
//             break;
//           }
//         }

//         return output;
//       }

//       String findITEMs_ICconv(String input) {
//         // print('*----->${input}');
//         String output = "";

//         for (int i = 0; i < findITEMs_IC.length; i++) {
//           if (input == findITEMs_IC[i].masterID) {
//             output = findITEMs_IC[i].NAME;
//             break;
//           }
//         }

//         return output;
//       }

//       //findMACHINE_FN
//       // print(databuff[0]['findMACHINE_FN']);
//       List<BasicBodyData> findMACHINE_FN = [];
//       if (databuff[0]['findMACHINE_FN'] != null) {
//         for (int i = 0; i < databuff[0]['findMACHINE_FN'].length; i++) {
//           findMACHINE_FN.add(BasicBodyData(
//             NAME: databuff[0]['findMACHINE_FN'][i]['METHOD'] != null
//                 ? databuff[0]['findMACHINE_FN'][i]['METHOD'].toString()
//                 : "",
//             masterID: databuff[0]['findMACHINE_FN'][i]['masterID'] != null
//                 ? databuff[0]['findMACHINE_FN'][i]['masterID'].toString()
//                 : "",
//           ));
//         }
//       }

//       List<BasicBodyData> findMACHINE_IC = [];
//       if (databuff[0]['findMACHINE_IC'] != null) {
//         for (int i = 0; i < databuff[0]['findMACHINE_IC'].length; i++) {
//           // print('----->${databuff[0]['findMACHINE_IC'][i]['masterID']}');
//           findMACHINE_IC.add(BasicBodyData(
//             NAME: databuff[0]['findMACHINE_IC'][i]['METHOD'] != null
//                 ? databuff[0]['findMACHINE_IC'][i]['METHOD'].toString()
//                 : "",
//             masterID: databuff[0]['findMACHINE_IC'][i]['masterID'] != null
//                 ? databuff[0]['findMACHINE_IC'][i]['masterID'].toString()
//                 : "",
//           ));
//         }
//       }

//       String findMACHINE_FNconv(String input) {
//         String output = "";

//         for (int i = 0; i < findMACHINE_FN.length; i++) {
//           if (input == findMACHINE_FN[i].masterID) {
//             output = findMACHINE_FN[i].NAME;
//             break;
//           }
//         }

//         return output;
//       }

//       String findMACHINE_ICconv(String input) {
//         String output = "";
//         // print('----->${input}');
//         for (int i = 0; i < findMACHINE_IC.length; i++) {
//           if (input == findMACHINE_IC[i].masterID) {
//             output = findMACHINE_IC[i].NAME;
//             break;
//           }
//         }

//         return output;
//       }

//       //findUNIT_FN
//       List<BasicBodyData> findUNIT_FN = [];
//       if (databuff[0]['findUNIT_FN'] != null) {
//         for (int i = 0; i < databuff[0]['findUNIT_FN'].length; i++) {
//           findUNIT_FN.add(BasicBodyData(
//             NAME: databuff[0]['findUNIT_FN'][i]['UNIT'] != null
//                 ? databuff[0]['findUNIT_FN'][i]['UNIT'].toString()
//                 : "",
//             masterID: databuff[0]['findUNIT_FN'][i]['masterID'] != null
//                 ? databuff[0]['findUNIT_FN'][i]['masterID'].toString()
//                 : "",
//           ));
//         }
//       }

//       List<BasicBodyData> findUNIT_IC = [];
//       if (databuff[0]['findUNIT_IC'] != null) {
//         for (int i = 0; i < databuff[0]['findUNIT_IC'].length; i++) {
//           findUNIT_FN.add(BasicBodyData(
//             NAME: databuff[0]['findUNIT_IC'][i]['UNIT'] != null
//                 ? databuff[0]['findUNIT_IC'][i]['UNIT'].toString()
//                 : "",
//             masterID: databuff[0]['findUNIT_IC'][i]['masterID'] != null
//                 ? databuff[0]['findUNIT_IC'][i]['masterID'].toString()
//                 : "",
//           ));
//         }
//       }

//       String findUNIT_FNconv(String input) {
//         String output = "";

//         for (int i = 0; i < findUNIT_FN.length; i++) {
//           if (input == findUNIT_FN[i].masterID) {
//             output = findUNIT_FN[i].NAME;
//             break;
//           }
//         }

//         return output;
//       }

//       String findUNIT_ICconv(String input) {
//         String output = "";

//         for (int i = 0; i < findUNIT_IC.length; i++) {
//           if (input == findUNIT_IC[i].masterID) {
//             output = findUNIT_IC[i].NAME;
//             break;
//           }
//         }

//         return output;
//       }

//       //findSPECIFICATION_FN
//       // print(databuff[0]['findSPECIFICATION_FN']);
//       List<BasicBodyData> findSPECIFICATION_FN = [];
//       if (databuff[0]['findSPECIFICATION_FN'] != null) {
//         for (int i = 0; i < databuff[0]['findSPECIFICATION_FN'].length; i++) {
//           findSPECIFICATION_FN.add(BasicBodyData(
//             NAME:
//                 databuff[0]['findSPECIFICATION_FN'][i]['SPECIFICATION'] != null
//                     ? databuff[0]['findSPECIFICATION_FN'][i]['SPECIFICATION']
//                         .toString()
//                     : "",
//             masterID: databuff[0]['findSPECIFICATION_FN'][i]['masterID'] != null
//                 ? databuff[0]['findSPECIFICATION_FN'][i]['masterID'].toString()
//                 : "",
//           ));
//         }
//       }

//       List<BasicBodyData> findSPECIFICATION_IC = [];
//       if (databuff[0]['findSPECIFICATION_IC'] != null) {
//         for (int i = 0; i < databuff[0]['findSPECIFICATION_IC'].length; i++) {
//           findSPECIFICATION_IC.add(BasicBodyData(
//             NAME:
//                 databuff[0]['findSPECIFICATION_IC'][i]['SPECIFICATION'] != null
//                     ? databuff[0]['findSPECIFICATION_IC'][i]['SPECIFICATION']
//                         .toString()
//                     : "",
//             masterID: databuff[0]['findSPECIFICATION_IC'][i]['masterID'] != null
//                 ? databuff[0]['findSPECIFICATION_IC'][i]['masterID'].toString()
//                 : "",
//           ));
//         }
//       }

//       String findSPECIFICATION_FNconv(String input) {
//         String output = "";

//         if (input.contains("SPECIFICATION-")) {
//           for (int i = 0; i < findSPECIFICATION_FN.length; i++) {
//             if (input == findSPECIFICATION_FN[i].masterID) {
//               output = findSPECIFICATION_FN[i].NAME;
//               break;
//             }
//           }
//         } else {
//           if (input.contains("{") && input.contains("}")) {
//             Map<String, dynamic> data = jsonStringToMap(input);
//             // print(input);
//             output = input;
//             if (data['condition'] != null && data['condition'] == "BTW") {
//               output = '${data['BTW_LOW']} - ${data['BTW_HI']} ';
//             } else if (data['condition'] != null &&
//                 data['condition'] == "Actual") {
//               output = 'Actual';
//             } else if (data['condition'] != null &&
//                 data['condition'] == "LOL(<)") {
//               output = ' ≤ ${data['LOL_H']}';
//             } else if (data['condition'] != null &&
//                 data['condition'] == "HIM(>)") {
//               output = ' ≥ ${data['HIM_L']}';
//             }
//           } else {
//             output = input;
//           }
//         }
//         return output;
//       }

//       String findSPECIFICATION_ICconv(String input) {
//         String output = "";

//         if (input.contains("SPECIFICATION-")) {
//           for (int i = 0; i < findSPECIFICATION_IC.length; i++) {
//             if (input == findSPECIFICATION_IC[i].masterID) {
//               output = findSPECIFICATION_IC[i].NAME;
//               break;
//             }
//           }
//         } else {
//           if (input.contains("{") && input.contains("}")) {
//             Map<String, dynamic> data = jsonStringToMap(input);
//             // print(input);
//             output = input;
//             if (data['condition'] != null && data['condition'] == "BTW") {
//               output = '${data['BTW_LOW']} - ${data['BTW_HI']} ';
//             } else if (data['condition'] != null &&
//                 data['condition'] == "Actual") {
//               output = 'Actual';
//             } else if (data['condition'] != null &&
//                 data['condition'] == "LOL(<)") {
//               output = ' ≤ ${data['LOL_H']}';
//             } else if (data['condition'] != null &&
//                 data['condition'] == "HIM(>)") {
//               output = ' ≥ ${data['HIM_L']}';
//             }
//           } else {
//             output = input;
//           }
//         }
//         return output;
//       }

//       if (databuff[0]['FINAL'] != null) {
//         for (var i = 0; i < databuff[0]['FINAL'].length; i++) {
//           //
//           final rest = await Dio().post(
//             serverGB + "GET_FINAL_DOCUMENT",
//             data: {
//               "METHODid": databuff[0]['FINAL'][i]['METHOD'] != null
//                   ? databuff[0]['FINAL'][i]['METHOD'].toString()
//                   : '',
//               "ITEMs": databuff[0]['FINAL'][i]['ITEMs'] != null
//                   ? databuff[0]['FINAL'][i]['ITEMs'].toString()
//                   : '',
//             },
//           );

//           String DOCUMENT = '';
//           if (rest.statusCode == 200) {
//             var databuff = rest.data;
//             // print(databuff);
//             DOCUMENT = databuff['DOCUMENT'] != null
//                 ? databuff['DOCUMENT'].toString()
//                 : "";
//           }

//           final rest2 = await Dio().post(
//             serverGB + "GET_FINAL_COMMENT",
//             data: {
//               "masterID": databuff[0]['FINAL'][i]['REMARK'] != null
//                   ? databuff[0]['FINAL'][i]['REMARK'].toString()
//                   : '',
//             },
//           );
//           String COMMENT = '';

//           if (rest2.statusCode == 200) {
//             var databuff = rest2.data;

//             COMMENT = databuff['COMMENT'] != null
//                 ? databuff['COMMENT'].toString()
//                 : "";
//           }
//           output.FINAL.add(
//             speckSTD(
//               seq: databuff[0]['FINAL'][i]['SEQ'] != null
//                   ? databuff[0]['FINAL'][i]['SEQ'].toString()
//                   : '0',
//               TYPE: databuff[0]['FINAL'][i]['TYPE'] != null
//                   ? databuff[0]['FINAL'][i]['TYPE'].toString()
//                   : '',
//               TYPEname: findTYPE_FNconv(databuff[0]['FINAL'][i]['TYPE'] != null
//                   ? databuff[0]['FINAL'][i]['TYPE'].toString()
//                   : ''),
//               ITEMs: databuff[0]['FINAL'][i]['ITEMs'] != null
//                   ? databuff[0]['FINAL'][i]['ITEMs'].toString()
//                   : '',
//               ITEMsname: findITEMs_FNconv(
//                   databuff[0]['FINAL'][i]['ITEMs'] != null
//                       ? databuff[0]['FINAL'][i]['ITEMs'].toString()
//                       : ''),
//               RESULTFORMAT: databuff[0]['FINAL'][i]['RESULTFORMAT'] != null
//                   ? databuff[0]['FINAL'][i]['RESULTFORMAT'].toString()
//                   : '',
//               GRAPHTYPE: databuff[0]['FINAL'][i]['GRAPHTYPE'] != null
//                   ? databuff[0]['FINAL'][i]['GRAPHTYPE'].toString()
//                   : '',
//               INTERSECTION: databuff[0]['FINAL'][i]['INTERSECTION'] != null
//                   ? databuff[0]['FINAL'][i]['INTERSECTION'].toString()
//                   : '',
//               // DOCUMENT: databuff[0]['FINAL'][i]['DOCUMENT'] != null
//               //     ? databuff[0]['FINAL'][i]['DOCUMENT'].toString()
//               //     : '',

//               DOCUMENT: DOCUMENT,
//               SCMARK: databuff[0]['FINAL'][i]['SCMARK'] != null
//                   ? databuff[0]['FINAL'][i]['SCMARK'].toString()
//                   : '',
//               METHOD: databuff[0]['FINAL'][i]['METHOD'] != null
//                   ? databuff[0]['FINAL'][i]['METHOD'].toString()
//                   : '',
//               METHODname: findMACHINE_FNconv(
//                   databuff[0]['FINAL'][i]['METHOD'] != null
//                       ? databuff[0]['FINAL'][i]['METHOD'].toString()
//                       : ''),
//               INSTRUMENTS: databuff[0]['FINAL'][i]['INSTRUMENTS'] != null
//                   ? databuff[0]['FINAL'][i]['INSTRUMENTS'].toString()
//                   : '',
//               SPECIFICATION: databuff[0]['FINAL'][i]['SPECIFICATION'] != null
//                   ? (databuff[0]['FINAL'][i]['SPECIFICATION']).length > 0
//                       ? databuff[0]['FINAL'][i]['SPECIFICATION'][0]['value'] !=
//                               null
//                           ? databuff[0]['FINAL'][i]['SPECIFICATION'][0]['value']
//                               .toString()
//                           : ''
//                       : ''
//                   : '',
//               SPECIFICATIONstr: databuff[0]['FINAL'][i]['SPECIFICATION'] != null
//                   ? (databuff[0]['FINAL'][i]['SPECIFICATION']).length > 0
//                       ? databuff[0]['FINAL'][i]['SPECIFICATION'][0]['name'] !=
//                               null
//                           ? databuff[0]['FINAL'][i]['SPECIFICATION'][0]['name']
//                               .toString()
//                           : ''
//                       : ''
//                   : '',
//               SPECIFICATIONve:
//                   databuff[0]['FINAL'][i]['SPECIFICATIONve'] != null
//                       ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
//                       : '',
//               SPECIFICATIONcondition: databuff[0]['FINAL'][i]
//                           ['SPECIFICATIONve'] !=
//                       null
//                   ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
//                           String
//                       ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
//                       : databuff[0]['FINAL'][i]['SPECIFICATIONve']
//                                   ['condition'] !=
//                               null
//                           ? databuff[0]['FINAL'][i]['SPECIFICATIONve']
//                                   ['condition']
//                               .toString()
//                           : '-'
//                   : '-',
//               SPECIFICATIONBTW_HI: databuff[0]['FINAL'][i]['SPECIFICATIONve'] !=
//                       null
//                   ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
//                           String
//                       ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
//                       : databuff[0]['FINAL'][i]['SPECIFICATIONve']['BTW_HI'] !=
//                               null
//                           ? databuff[0]['FINAL'][i]['SPECIFICATIONve']['BTW_HI']
//                               .toString()
//                           : '-'
//                   : '-',
//               SPECIFICATIONBTW_LOW: databuff[0]['FINAL'][i]
//                           ['SPECIFICATIONve'] !=
//                       null
//                   ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
//                           String
//                       ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
//                       : databuff[0]['FINAL'][i]['SPECIFICATIONve']['BTW_LOW'] !=
//                               null
//                           ? databuff[0]['FINAL'][i]['SPECIFICATIONve']
//                                   ['BTW_LOW']
//                               .toString()
//                           : '-'
//                   : '-',
//               SPECIFICATIONHIM_L: databuff[0]['FINAL'][i]['SPECIFICATIONve'] !=
//                       null
//                   ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
//                           String
//                       ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
//                       : databuff[0]['FINAL'][i]['SPECIFICATIONve']['HIM_L'] !=
//                               null
//                           ? databuff[0]['FINAL'][i]['SPECIFICATIONve']['HIM_L']
//                               .toString()
//                           : '-'
//                   : '-',
//               SPECIFICATIONLOL_H: databuff[0]['FINAL'][i]['SPECIFICATIONve'] !=
//                       null
//                   ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
//                           String
//                       ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
//                       : databuff[0]['FINAL'][i]['SPECIFICATIONve']['LOL_H'] !=
//                               null
//                           ? databuff[0]['FINAL'][i]['SPECIFICATIONve']['LOL_H']
//                               .toString()
//                           : '-'
//                   : '-',
//               SPECIFICATIONTARGET: databuff[0]['FINAL'][i]['SPECIFICATIONve'] !=
//                       null
//                   ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
//                           String
//                       ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
//                       : databuff[0]['FINAL'][i]['SPECIFICATIONve']['TARGET'] !=
//                               null
//                           ? databuff[0]['FINAL'][i]['SPECIFICATIONve']['TARGET']
//                               .toString()
//                           : '-'
//                   : '-',
//               SPECIFICATIONvename: findSPECIFICATION_FNconv(
//                   databuff[0]['FINAL'][i]['SPECIFICATIONve'] != null
//                       ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
//                       : ''),
//               UNIT: databuff[0]['FINAL'][i]['UNIT'] != null
//                   ? databuff[0]['FINAL'][i]['UNIT'].toString()
//                   : '',
//               UNITname: findUNIT_FNconv(databuff[0]['FINAL'][i]['UNIT'] != null
//                   ? databuff[0]['FINAL'][i]['UNIT'].toString()
//                   : ''),
//               CONVERSE: databuff[0]['FINAL'][i]['CONVERSE'] != null
//                   ? databuff[0]['FINAL'][i]['CONVERSE'].toString()
//                   : '',
//               CONVERSEname: findUNIT_FNconv(
//                   databuff[0]['FINAL'][i]['CONVERSE'] != null
//                       ? databuff[0]['FINAL'][i]['CONVERSE'].toString()
//                       : ''),
//               // POINTPCS: databuff[0]['FINAL'][i]['POINTPCS'] != null
//               //     ? databuff[0]['FINAL'][i]['POINTPCS'].toString()
//               //     : '',
//               // POSITION: databuff[0]['FINAL'][i]['POSITION'] != null
//               //     ? databuff[0]['FINAL'][i]['POSITION'].toString()
//               //     : '',
//               POINT: databuff[0]['FINAL'][i]['POINT'] != null
//                   ? databuff[0]['FINAL'][i]['POINT'].toString()
//                   : '',
//               PCS: databuff[0]['FINAL'][i]['PCS'] != null
//                   ? databuff[0]['FINAL'][i]['PCS'].toString()
//                   : '',
//               FREQUENCY: databuff[0]['FINAL'][i]['FREQUENCY'] != null
//                   ? databuff[0]['FINAL'][i]['FREQUENCY'].toString()
//                   : '',
//               MODE: databuff[0]['FINAL'][i]['MODE'] != null
//                   ? databuff[0]['FINAL'][i]['MODE'].toString()
//                   : '',
//               // REMARK: databuff[0]['FINAL'][i]['REMARK'] != null
//               //     ? databuff[0]['FINAL'][i]['REMARK'].toString()
//               //     : '',
//               REMARK: COMMENT,
//               LOAD: databuff[0]['FINAL'][i]['LOAD'] != null
//                   ? databuff[0]['FINAL'][i]['LOAD'].toString()
//                   : '',

//               SWreport: databuff[0]['FINAL'][i]['SWreport'] != null
//                   ? databuff[0]['FINAL'][i]['SWreport'].toString()
//                   : '',
//               K1b: databuff[0]['FINAL'][i]['K1b'] != null
//                   ? databuff[0]['FINAL'][i]['K1b'].toString()
//                   : '',
//               K1v: databuff[0]['FINAL'][i]['K1v'] != null
//                   ? databuff[0]['FINAL'][i]['K1v'].toString()
//                   : '',
//             ),
//           );
//         }
//       }

//       if (databuff[0]['INCOMMING'] != null) {
//         print(databuff[0]['INCOMMING']);
//         for (var i = 0; i < databuff[0]['INCOMMING'].length; i++) {
//           //
//           output.INCOMMING.add(
//             speckSTD(
//               seq: databuff[0]['INCOMMING'][i]['SEQ'] != null
//                   ? databuff[0]['INCOMMING'][i]['SEQ'].toString()
//                   : '0',
//               TYPE: databuff[0]['INCOMMING'][i]['TYPE'] != null
//                   ? databuff[0]['INCOMMING'][i]['TYPE'].toString()
//                   : '',
//               TYPEname: findTYPE_ICconv(
//                   databuff[0]['INCOMMING'][i]['TYPE'] != null
//                       ? databuff[0]['INCOMMING'][i]['TYPE'].toString()
//                       : ''),
//               ITEMs: databuff[0]['INCOMMING'][i]['ITEMs'] != null
//                   ? databuff[0]['INCOMMING'][i]['ITEMs'].toString()
//                   : '',
//               ITEMsname: findITEMs_ICconv(
//                   databuff[0]['INCOMMING'][i]['ITEMs'] != null
//                       ? databuff[0]['INCOMMING'][i]['ITEMs'].toString()
//                       : ''),
//               RESULTFORMAT: databuff[0]['INCOMMING'][i]['RESULTFORMAT'] != null
//                   ? databuff[0]['INCOMMING'][i]['RESULTFORMAT'].toString()
//                   : '',
//               GRAPHTYPE: databuff[0]['INCOMMING'][i]['GRAPHTYPE'] != null
//                   ? databuff[0]['INCOMMING'][i]['GRAPHTYPE'].toString()
//                   : '',
//               INTERSECTION: databuff[0]['INCOMMING'][i]['INTERSECTION'] != null
//                   ? databuff[0]['INCOMMING'][i]['INTERSECTION'].toString()
//                   : '',
//               DOCUMENT: databuff[0]['INCOMMING'][i]['DOCUMENT'] != null
//                   ? databuff[0]['INCOMMING'][i]['DOCUMENT'].toString()
//                   : '',
//               SCMARK: databuff[0]['INCOMMING'][i]['SCMARK'] != null
//                   ? databuff[0]['INCOMMING'][i]['SCMARK'].toString()
//                   : '',
//               METHOD: databuff[0]['INCOMMING'][i]['METHOD'] != null
//                   ? databuff[0]['INCOMMING'][i]['METHOD'].toString()
//                   : '',
//               METHODname: findMACHINE_ICconv(
//                   databuff[0]['INCOMMING'][i]['METHOD'] != null
//                       ? databuff[0]['INCOMMING'][i]['METHOD'].toString()
//                       : ''),
//               INSTRUMENTS: databuff[0]['INCOMMING'][i]['INSTRUMENTS'] != null
//                   ? databuff[0]['INCOMMING'][i]['INSTRUMENTS'].toString()
//                   : '',
//               SPECIFICATION: databuff[0]['INCOMMING'][i]['SPECIFICATION'] !=
//                       null
//                   ? (databuff[0]['INCOMMING'][i]['SPECIFICATION']).length > 0
//                       ? databuff[0]['INCOMMING'][i]['SPECIFICATION'][0]
//                                   ['value'] !=
//                               null
//                           ? databuff[0]['INCOMMING'][i]['SPECIFICATION'][0]
//                                   ['value']
//                               .toString()
//                           : ''
//                       : ''
//                   : '',
//               SPECIFICATIONstr: databuff[0]['INCOMMING'][i]['SPECIFICATION'] !=
//                       null
//                   ? (databuff[0]['INCOMMING'][i]['SPECIFICATION']).length > 0
//                       ? databuff[0]['INCOMMING'][i]['SPECIFICATION'][0]
//                                   ['name'] !=
//                               null
//                           ? databuff[0]['INCOMMING'][i]['SPECIFICATION'][0]
//                                   ['name']
//                               .toString()
//                           : ''
//                       : ''
//                   : '',
//               SPECIFICATIONve: databuff[0]['INCOMMING'][i]['SPECIFICATIONve'] !=
//                       null
//                   ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve'].toString()
//                   : '',
//               SPECIFICATIONcondition:
//                   databuff[0]['INCOMMING'][i]['SPECIFICATIONve'] != null
//                       ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                   .runtimeType ==
//                               String
//                           ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                               .toString()
//                           : databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                       ['condition'] !=
//                                   null
//                               ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                       ['condition']
//                                   .toString()
//                               : '-'
//                       : '-',
//               SPECIFICATIONBTW_HI:
//                   databuff[0]['INCOMMING'][i]['SPECIFICATIONve'] != null
//                       ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                   .runtimeType ==
//                               String
//                           ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                               .toString()
//                           : databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                       ['BTW_HI'] !=
//                                   null
//                               ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                       ['BTW_HI']
//                                   .toString()
//                               : '-'
//                       : '-',
//               SPECIFICATIONBTW_LOW:
//                   databuff[0]['INCOMMING'][i]['SPECIFICATIONve'] != null
//                       ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                   .runtimeType ==
//                               String
//                           ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                               .toString()
//                           : databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                       ['BTW_LOW'] !=
//                                   null
//                               ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                       ['BTW_LOW']
//                                   .toString()
//                               : '-'
//                       : '-',
//               SPECIFICATIONHIM_L:
//                   databuff[0]['INCOMMING'][i]['SPECIFICATIONve'] != null
//                       ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                   .runtimeType ==
//                               String
//                           ? databuff[0]['INCOMMING'][i]
//                                   ['SPECIFICATIONve']
//                               .toString()
//                           : databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                       ['HIM_L'] !=
//                                   null
//                               ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                       ['HIM_L']
//                                   .toString()
//                               : '-'
//                       : '-',
//               SPECIFICATIONLOL_H:
//                   databuff[0]['INCOMMING'][i]['SPECIFICATIONve'] != null
//                       ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                   .runtimeType ==
//                               String
//                           ? databuff[0]['INCOMMING'][i]
//                                   ['SPECIFICATIONve']
//                               .toString()
//                           : databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                       ['LOL_H'] !=
//                                   null
//                               ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                       ['LOL_H']
//                                   .toString()
//                               : '-'
//                       : '-',
//               SPECIFICATIONTARGET:
//                   databuff[0]['INCOMMING'][i]['SPECIFICATIONve'] != null
//                       ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                   .runtimeType ==
//                               String
//                           ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                               .toString()
//                           : databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                       ['TARGET'] !=
//                                   null
//                               ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
//                                       ['TARGET']
//                                   .toString()
//                               : '-'
//                       : '-',
//               SPECIFICATIONvename: findSPECIFICATION_ICconv(databuff[0]
//                           ['INCOMMING'][i]['SPECIFICATIONve'] !=
//                       null
//                   ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve'].toString()
//                   : ''),
//               UNIT: databuff[0]['INCOMMING'][i]['UNIT'] != null
//                   ? databuff[0]['INCOMMING'][i]['UNIT'].toString()
//                   : '',
//               UNITname: findUNIT_ICconv(
//                   databuff[0]['INCOMMING'][i]['UNIT'] != null
//                       ? databuff[0]['INCOMMING'][i]['UNIT'].toString()
//                       : ''),
//               CONVERSE: databuff[0]['INCOMMING'][i]['CONVERSE'] != null
//                   ? databuff[0]['INCOMMING'][i]['CONVERSE'].toString()
//                   : '',
//               CONVERSEname: findUNIT_ICconv(
//                   databuff[0]['INCOMMING'][i]['CONVERSE'] != null
//                       ? databuff[0]['INCOMMING'][i]['CONVERSE'].toString()
//                       : ''),
//               // POINTPCS: databuff[0]['INCOMMING'][i]['POINTPCS'] != null
//               //     ? databuff[0]['INCOMMING'][i]['POINTPCS'].toString()
//               //     : '',
//               // POSITION: databuff[0]['INCOMMING'][i]['POSITION'] != null
//               //     ? databuff[0]['INCOMMING'][i]['POSITION'].toString()
//               //     : '',
//               POINT: databuff[0]['INCOMMING'][i]['POINT'] != null
//                   ? databuff[0]['INCOMMING'][i]['POINT'].toString()
//                   : '',
//               PCS: databuff[0]['INCOMMING'][i]['PCS'] != null
//                   ? databuff[0]['INCOMMING'][i]['PCS'].toString()
//                   : '',
//               FREQUENCY: databuff[0]['INCOMMING'][i]['FREQUENCY'] != null
//                   ? databuff[0]['INCOMMING'][i]['FREQUENCY'].toString()
//                   : '',
//               MODE: databuff[0]['INCOMMING'][i]['MODE'] != null
//                   ? databuff[0]['INCOMMING'][i]['MODE'].toString()
//                   : '',
//               REMARK: databuff[0]['INCOMMING'][i]['REMARK'] != null
//                   ? databuff[0]['INCOMMING'][i]['REMARK'].toString()
//                   : '',
//               LOAD: databuff[0]['INCOMMING'][i]['LOAD'] != null
//                   ? databuff[0]['INCOMMING'][i]['LOAD'].toString()
//                   : '',
//             ),
//           );
//         }
//       }
//       //
//       String picHold = databuff[0]['Pimg'] != null
//           ? databuff[0]['Pimg']['P1'] != null
//               ? databuff[0]['Pimg']['P1'].toString()
//               : ''
//           : '';
//       List<String> picHoldList = picHold.split(",");
//       if (picHoldList.length > 1) {
//         output.Pimg = picHoldList[1];
//       }
//     }
//     emit(output);
//   }

//   Future<void> _FINSPECTIONget_FLUSH(
//       InspectionSTD toAdd, Emitter<InspectionSTD> emit) async {
//     InspectionSTD output = InspectionSTD(
//       INCOMMING: [],
//       INPROCESS: [],
//       FINAL: [],
//     );
//     emit(output);
//   }
// }

// class InspectionSTD {
//   InspectionSTD({
//     this.status = '',
//     this.MATCP = '',
//     this.FG = '',
//     this.CUSTOMER = '',
//     this.PART = '',
//     this.PARTNAME = '',
//     this.MATERIAL = '',
//     //-------------------------------
//     required this.INCOMMING,
//     required this.INPROCESS,
//     required this.FINAL,
//     //-------------------------------
//     this.Pimg = '',
//     this.CUST_FULLNM = '',
//   });
//   String status;
//   String MATCP;
//   String FG;
//   String CUSTOMER;
//   String PART;
//   String PARTNAME;
//   String MATERIAL;
//   //-------------------------------
//   List<speckSTD> INCOMMING;
//   List<speckSTD> INPROCESS;
//   List<speckSTD> FINAL;
//   //-------------------------------
//   String Pimg;
//   String CUST_FULLNM;
// }

// class speckSTD {
//   speckSTD({
//     this.seq = '',
//     this.TYPE = '',
//     this.TYPEname = '',
//     this.ITEMs = '',
//     this.ITEMsname = '',
//     this.RESULTFORMAT = '',
//     this.GRAPHTYPE = '',
//     this.INTERSECTION = '',
//     this.DOCUMENT = '',
//     this.SCMARK = '',
//     this.METHOD = '',
//     this.METHODname = '',
//     this.INSTRUMENTS = '',
//     this.SPECIFICATION = '',
//     this.SPECIFICATIONstr = '',
//     this.SPECIFICATIONve = '',
//     this.SPECIFICATIONcondition = '',
//     this.SPECIFICATIONBTW_LOW = '',
//     this.SPECIFICATIONBTW_HI = '',
//     this.SPECIFICATIONHIM_L = '',
//     this.SPECIFICATIONLOL_H = '',
//     this.SPECIFICATIONTARGET = '',
//     this.SPECIFICATIONvename = '',
//     this.UNIT = '-',
//     this.UNITname = '-',
//     this.CONVERSE = '-',
//     this.CONVERSEname = '-',
//     // this.POINTPCS = '',
//     // this.POSITION = '',
//     this.POINT = '',
//     this.PCS = '',
//     this.FREQUENCY = '',
//     this.FREQUENCYname = '',
//     this.MODE = '',
//     this.REMARK = '',
//     this.LOAD = '',
//     this.SWreport = '',
//     this.K1b = '',
//     this.K1v = '',
//   });

//   String seq;
//   String TYPE;
//   String TYPEname;
//   String ITEMs;
//   String ITEMsname;
//   String RESULTFORMAT;
//   String GRAPHTYPE;
//   String INTERSECTION;
//   String DOCUMENT;
//   String SCMARK;
//   String METHOD;
//   String METHODname;
//   String INSTRUMENTS;
//   String SPECIFICATION;
//   String SPECIFICATIONstr;
//   String SPECIFICATIONve;
//   String SPECIFICATIONcondition;
//   String SPECIFICATIONBTW_LOW;
//   String SPECIFICATIONBTW_HI;
//   String SPECIFICATIONHIM_L;
//   String SPECIFICATIONLOL_H;
//   String SPECIFICATIONTARGET;
//   String SPECIFICATIONvename;
//   String UNIT;
//   String UNITname;
//   String CONVERSE;
//   String CONVERSEname;
//   // String POINTPCS;
//   // String POSITION;
//   String POINT;
//   String PCS;
//   String FREQUENCY;
//   String FREQUENCYname;
//   String MODE;
//   String REMARK;
//   String LOAD;

//   String SWreport;
//   String K1b;
//   String K1v;
// }

// class BasicBodyData {
//   BasicBodyData({
//     this.NAME = '',
//     this.masterID = '',
//   });
//   String NAME;
//   String masterID;
// }

// jsonStringToMap(String data) {
//   List<String> str = data
//       .replaceAll("{", "")
//       .replaceAll("}", "")
//       .replaceAll("\"", "")
//       .replaceAll("'", "")
//       .split(",");
//   Map<String, dynamic> result = {};
//   for (int i = 0; i < str.length; i++) {
//     List<String> s = str[i].split(":");
//     result.putIfAbsent(s[0].trim(), () => s[1].trim());
//   }
//   return result;
// }
