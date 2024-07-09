// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../bloc/BlocEvent/05-3-STEP-INSPECTIONquery.dart';
// import '../../widget/common/Advancedropdown.dart';
// import '../../widget/common/ComInputText.dart';
// import 'INSPECTIONstdVAR.dart';

// void FINALPOPUP(BuildContext contextin) {
//   showDialog(
//     context: contextin,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//       return Dialog(
//         child: FINALPOPUPBlocDROPDOWN(),
//       );
//     },
//   );
// }

// class FINALPOPUPBlocDROPDOWN extends StatelessWidget {
//   /// {@macro counter_page}
//   const FINALPOPUPBlocDROPDOWN({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (_) => INSPECTION_DDSTEP_Bloc(),
//         child: BlocBuilder<INSPECTION_DDSTEP_Bloc, DROPDOWN_INS_STEP1>(
//           builder: (context, DDstep) {
//             return FINALCTION(
//               DDstep: DDstep,
//             );
//           },
//         ));
//   }
// }

// class FINALCTION extends StatefulWidget {
//   FINALCTION({
//     super.key,
//     this.DDstep,
//   });
//   DROPDOWN_INS_STEP1? DDstep;
//   @override
//   State<FINALCTION> createState() => _FINALCTIONState();
// }

// class _FINALCTIONState extends State<FINALCTION> {
//   @override
//   void initState() {
//     super.initState();
//     INSPECTIONstdVAR.List_FINAL_ITEMs = [const MapEntry("", "")];
//     if (INSPECTIONstdVAR.FINAL_ITEMs == '') {
//       context.read<INSPECTION_DDSTEP_Bloc>().add(INSPECTION_GET_STEP1());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     DROPDOWN_INS_STEP1 _DDstep = widget.DDstep ??
//         DROPDOWN_INS_STEP1(
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
//           //
//           METHODdd: [],
//           SPECIFICATIONdd: [],
//         );
//     if (_DDstep.status == 'STEP1') {
//       INSPECTIONstdVAR.List_FINAL_ITEMs = _DDstep.ITEMSdd;
//     }
//     if (_DDstep.status == 'STEP2') {
//       INSPECTIONstdVAR.List_FINAL_METHOD = _DDstep.METHODdd;
//       INSPECTIONstdVAR.List_FINAL_LOAD = _DDstep.LOADdd;
//       INSPECTIONstdVAR.List_FINAL_GT = _DDstep.GTdd;
//       INSPECTIONstdVAR.List_FINAL_UNIT = _DDstep.UNITdd;
//       INSPECTIONstdVAR.List_FINAL_FREQUENCY = _DDstep.FREQUENCYdd;
//       INSPECTIONstdVAR.List_FINAL_CORETYPE = _DDstep.COREdd;

//       INSPECTIONstdVAR.FINAL_RESULTFORMATdata = _DDstep.RESULTFORMATdata;
//     }

//     if (_DDstep.status == 'GET_DOCUMENT') {
//       INSPECTIONstdVAR.iscontrol = true;
//       setState(() {
//         INSPECTIONstdVAR.FINAL_DOCUMENT = _DDstep.DOCUMENT;
//       });
//     }

// //
//     return Container(
//         height: 400,
//         width: 450,
//         color: Colors.white,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsetsDirectional.only(
//                 top: 16, bottom: 16, start: 24, end: 24),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 SizedBox(
//                   child: Row(
//                     children: [
//                       Text("FINAL PATTERN"),
//                       Spacer(),
//                       InkWell(
//                         onTap: () {
//                           INSPECTIONstdVAR.iscontrol = true;
// //
//                           INSPECTIONstdVAR.FINAL_seq = "";
//                           INSPECTIONstdVAR.FINAL_ITEMs = "";
//                           INSPECTIONstdVAR.FINAL_COREtype = "";
//                           INSPECTIONstdVAR.FINAL_FORMULA = "";
//                           INSPECTIONstdVAR.FINAL_SCMARK = "";
//                           INSPECTIONstdVAR.FINAL_SCMARKtype = "";
//                           INSPECTIONstdVAR.FINAL_DOCUMENT = "";
//                           INSPECTIONstdVAR.FINAL_METHOD = "";
//                           INSPECTIONstdVAR.FINAL_IMGreaddata = "";
//                           INSPECTIONstdVAR.FINAL_IMGno = "";
//                           INSPECTIONstdVAR.FINAL_LOAD = "";
//                           INSPECTIONstdVAR.FINAL_GT = "";
//                           INSPECTIONstdVAR.FINAL_SPECIFICATION = "";
//                           INSPECTIONstdVAR.FINAL_SPECIFICATIONve = "";
//                           INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB = veOB();
//                           INSPECTIONstdVAR.FINAL_UNIT = "";
//                           INSPECTIONstdVAR.FINAL_POINTPCS = "";
//                           INSPECTIONstdVAR.FINAL_PCS = "";
//                           INSPECTIONstdVAR.FINAL_FREQUENCY = "";
//                           INSPECTIONstdVAR.FINAL_REMARK = "";
//                           INSPECTIONstdVAR.FINAL_RESULTFORMATdata = "";
//                           INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.condition =
//                               "";
//                           setState(() {});
//                           //
//                         },
//                         child: Container(
//                           width: 100,
//                           height: 30,
//                           color: Colors.red,
//                           child: Center(
//                             child: Text(
//                               "CLEAR",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 ComInputText(
//                   nLimitedChar: 100,
//                   sLabel: "SEQ",
//                   height: 40,
//                   width: 400,
//                   isContr: INSPECTIONstdVAR.iscontrol,
//                   isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
//                   fnContr: (input) {
//                     setState(() {
//                       INSPECTIONstdVAR.iscontrol = input;
//                     });
//                   },
//                   sValue: INSPECTIONstdVAR.FINAL_seq,
//                   returnfunc: (String s) {
//                     INSPECTIONstdVAR.FINAL_seq = s;
//                   },
//                 ),
//                 SizedBox(
//                   height: 64,
//                   width: 400,
//                   child: AdvanceDropDown(
//                     isEnable: INSPECTIONstdVAR.FINAL_ITEMs != '',
//                     sLabel: "ITEMs",
//                     imgpath: 'assets/icons/icon-down_4@3x.png',
//                     listdropdown: INSPECTIONstdVAR.List_FINAL_ITEMs,
//                     onChangeinside: (d, k) {
//                       setState(() {
//                         print(d);
//                         INSPECTIONstdVAR.FINAL_ITEMs = d;
//                         context
//                             .read<INSPECTION_DDSTEP_Bloc>()
//                             .add(INSPECTION_GET_STEP2());
//                       });
//                     },
//                     value: INSPECTIONstdVAR.FINAL_ITEMs,
//                     height: 40,
//                     width: 400,
//                   ),
//                 ),
//                 if (INSPECTIONstdVAR.FINAL_RESULTFORMATdata != '') ...[
//                   SizedBox(
//                     height: 64,
//                     width: 400,
//                     child: AdvanceDropDown(
//                       sLabel: "COREtype",
//                       imgpath: 'assets/icons/icon-down_4@3x.png',
//                       listdropdown: INSPECTIONstdVAR.List_FINAL_CORETYPE,
//                       onChangeinside: (d, k) {
//                         setState(() {
//                           INSPECTIONstdVAR.FINAL_COREtype = d;
//                         });
//                       },
//                       value: INSPECTIONstdVAR.FINAL_COREtype,
//                       height: 40,
//                       width: 400,
//                     ),
//                   ),
//                   // SizedBox(
//                   //   height: 64,
//                   //   width: 400,
//                   //   child: AdvanceDropDown(
//                   //     sLabel: "FORMULA",
//                   //     imgpath: 'assets/icons/icon-down_4@3x.png',
//                   //     listdropdown: [const MapEntry("", "")],
//                   //     onChangeinside: (d, k) {
//                   //       setState(() {
//                   //         INSPECTIONstdVAR.FINAL_FORMULA = d;
//                   //       });
//                   //     },
//                   //     value: INSPECTIONstdVAR.FINAL_FORMULA,
//                   //     height: 40,
//                   //     width: 400,
//                   //   ),
//                   // ),
//                   SizedBox(
//                     height: 64,
//                     width: 400,
//                     child: AdvanceDropDown(
//                       sLabel: "S.C.MARK",
//                       imgpath: 'assets/icons/icon-down_4@3x.png',
//                       listdropdown: INSPECTIONstdVAR.List_FINAL_SCMARK,
//                       onChangeinside: (d, k) {
//                         setState(() {
//                           INSPECTIONstdVAR.FINAL_SCMARK = d;
//                         });
//                       },
//                       value: INSPECTIONstdVAR.FINAL_SCMARK,
//                       height: 40,
//                       width: 400,
//                     ),
//                   ),
//                   // SizedBox(
//                   //   height: 64,
//                   //   width: 400,
//                   //   child: AdvanceDropDown(
//                   //     sLabel: "SCMARKtype",
//                   //     imgpath: 'assets/icons/icon-down_4@3x.png',
//                   //     listdropdown: [const MapEntry("", "")],
//                   //     onChangeinside: (d, k) {
//                   //       setState(() {
//                   //         INSPECTIONstdVAR.FINAL_SCMARKtype = d;
//                   //       });
//                   //     },
//                   //     value: INSPECTIONstdVAR.FINAL_SCMARKtype,
//                   //     height: 40,
//                   //     width: 400,
//                   //   ),
//                   // ),
//                   ComInputText(
//                     nLimitedChar: 100,
//                     sLabel: "DOCUMENT",
//                     height: 40,
//                     width: 400,
//                     isContr: INSPECTIONstdVAR.iscontrol,
//                     isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
//                     fnContr: (input) {
//                       setState(() {
//                         INSPECTIONstdVAR.iscontrol = input;
//                       });
//                     },
//                     sValue: INSPECTIONstdVAR.FINAL_DOCUMENT,
//                     returnfunc: (String s) {
//                       INSPECTIONstdVAR.FINAL_DOCUMENT = s;
//                     },
//                   ),
//                   SizedBox(
//                     height: 64,
//                     width: 400,
//                     child: AdvanceDropDown(
//                       sLabel: "METHOD",
//                       imgpath: 'assets/icons/icon-down_4@3x.png',
//                       listdropdown: INSPECTIONstdVAR.List_FINAL_METHOD,
//                       onChangeinside: (d, k) {
//                         setState(() {
//                           INSPECTIONstdVAR.FINAL_METHOD = d;
//                         });
//                         context
//                             .read<INSPECTION_DDSTEP_Bloc>()
//                             .add(INSPECTION_GET_DOCUMENT());
//                       },
//                       value: INSPECTIONstdVAR.FINAL_METHOD,
//                       height: 40,
//                       width: 400,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 64,
//                     width: 400,
//                     child: AdvanceDropDown(
//                       sLabel: "IMGreaddata",
//                       imgpath: 'assets/icons/icon-down_4@3x.png',
//                       listdropdown: INSPECTIONstdVAR.List_FINAL_IMGreaddata,
//                       onChangeinside: (d, k) {
//                         setState(() {
//                           INSPECTIONstdVAR.FINAL_IMGreaddata = d;
//                         });
//                       },
//                       value: INSPECTIONstdVAR.FINAL_IMGreaddata,
//                       height: 40,
//                       width: 400,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 64,
//                     width: 400,
//                     child: AdvanceDropDown(
//                       sLabel: "IMGno",
//                       imgpath: 'assets/icons/icon-down_4@3x.png',
//                       listdropdown: INSPECTIONstdVAR.List_FINAL_IMGno,
//                       onChangeinside: (d, k) {
//                         setState(() {
//                           INSPECTIONstdVAR.FINAL_IMGno = d;
//                         });
//                       },
//                       value: INSPECTIONstdVAR.FINAL_IMGno,
//                       height: 40,
//                       width: 400,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 64,
//                     width: 400,
//                     child: AdvanceDropDown(
//                       sLabel: "LOAD",
//                       imgpath: 'assets/icons/icon-down_4@3x.png',
//                       listdropdown: INSPECTIONstdVAR.List_FINAL_LOAD,
//                       onChangeinside: (d, k) {
//                         setState(() {
//                           INSPECTIONstdVAR.FINAL_LOAD = d;
//                         });
//                       },
//                       value: INSPECTIONstdVAR.FINAL_LOAD,
//                       height: 40,
//                       width: 400,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 64,
//                     width: 400,
//                     child: AdvanceDropDown(
//                       sLabel: "GT",
//                       imgpath: 'assets/icons/icon-down_4@3x.png',
//                       listdropdown: INSPECTIONstdVAR.List_FINAL_GT,
//                       onChangeinside: (d, k) {
//                         setState(() {
//                           INSPECTIONstdVAR.FINAL_GT = d;
//                         });
//                       },
//                       value: INSPECTIONstdVAR.FINAL_GT,
//                       height: 40,
//                       width: 400,
//                     ),
//                   ),

//                   // SizedBox(
//                   //   height: 64,
//                   //   width: 400,
//                   //   child: AdvanceDropDown(
//                   //     sLabel: "SPEC",
//                   //     imgpath: 'assets/icons/icon-down_4@3x.png',
//                   //     listdropdown: [const MapEntry("", "")],
//                   //     onChangeinside: (d, k) {
//                   //       setState(() {
//                   //         INSPECTIONstdVAR.FINAL_SPECIFICATION = d;
//                   //       });
//                   //     },
//                   //     value: INSPECTIONstdVAR.FINAL_SPECIFICATION,
//                   //     height: 40,
//                   //     width: 400,
//                   //   ),
//                   // ),

//                   if (INSPECTIONstdVAR.FINAL_RESULTFORMATdata ==
//                       'Calculate') ...[
//                     SizedBox(
//                       height: 24,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.black),
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(8)),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsetsDirectional.only(
//                             top: 10, bottom: 10, start: 30, end: 30),
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Center(
//                               child: Text(" CALCULATE K"),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             AdvanceDropDown(
//                               sLabel: "condition",
//                               imgpath: 'assets/icons/icon-down_4@3x.png',
//                               listdropdown: [
//                                 const MapEntry("", ""),
//                                 const MapEntry("COAT", "BTW"),
//                                 const MapEntry("XXXXXXX", "LOL(<)"),
//                                 const MapEntry("UUUUUU", "HIM(>)"),
//                               ],
//                               onChangeinside: (d, k) {
//                                 setState(() {
//                                   INSPECTIONstdVAR.CALCULATEp = d;
//                                 });
//                               },
//                               value: INSPECTIONstdVAR.CALCULATEp,
//                               height: 40,
//                               width: 200,
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             ComInputText(
//                               nLimitedChar: 100,
//                               sLabel: "K1",
//                               height: 40,
//                               width: 200,
//                               isContr: INSPECTIONstdVAR.iscontrol,
//                               // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
//                               fnContr: (input) {
//                                 setState(() {
//                                   INSPECTIONstdVAR.iscontrol = input;
//                                 });
//                               },
//                               sValue: INSPECTIONstdVAR.FINAL_CAL_K1,
//                               returnfunc: (String s) {
//                                 INSPECTIONstdVAR.FINAL_CAL_K1 = s;
//                               },
//                             ),
//                             ComInputText(
//                               nLimitedChar: 100,
//                               sLabel: "K2",
//                               height: 40,
//                               width: 200,
//                               isContr: INSPECTIONstdVAR.iscontrol,
//                               // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
//                               fnContr: (input) {
//                                 setState(() {
//                                   INSPECTIONstdVAR.iscontrol = input;
//                                 });
//                               },
//                               sValue: INSPECTIONstdVAR.FINAL_CAL_K2,
//                               returnfunc: (String s) {
//                                 INSPECTIONstdVAR.FINAL_CAL_K2 = s;
//                               },
//                             ),
//                             ComInputText(
//                               nLimitedChar: 100,
//                               sLabel: "K3",
//                               height: 40,
//                               width: 200,
//                               isContr: INSPECTIONstdVAR.iscontrol,
//                               // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
//                               fnContr: (input) {
//                                 setState(() {
//                                   INSPECTIONstdVAR.iscontrol = input;
//                                 });
//                               },
//                               sValue: INSPECTIONstdVAR.FINAL_CAL_K3,
//                               returnfunc: (String s) {
//                                 INSPECTIONstdVAR.FINAL_CAL_K3 = s;
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],

//                   if (INSPECTIONstdVAR.FINAL_RESULTFORMATdata == 'Text')
//                     SizedBox(
//                       height: 64,
//                       width: 400,
//                       child: AdvanceDropDown(
//                         sLabel: "SPECve",
//                         imgpath: 'assets/icons/icon-down_4@3x.png',
//                         listdropdown: [const MapEntry("", "")],
//                         onChangeinside: (d, k) {
//                           setState(() {
//                             INSPECTIONstdVAR.FINAL_SPECIFICATIONve = d;
//                           });
//                         },
//                         value: INSPECTIONstdVAR.FINAL_SPECIFICATIONve,
//                         height: 40,
//                         width: 400,
//                       ),
//                     ),
//                   SizedBox(
//                     height: 15,
//                   ),

//                   if (INSPECTIONstdVAR.FINAL_RESULTFORMATdata == 'Number')
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.black),
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(8)),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsetsDirectional.only(
//                             top: 10, bottom: 10, start: 30, end: 30),
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 64,
//                               width: 200,
//                               child: AdvanceDropDown(
//                                 sLabel: "condition",
//                                 imgpath: 'assets/icons/icon-down_4@3x.png',
//                                 listdropdown: [
//                                   const MapEntry("", ""),
//                                   const MapEntry("BTW", "BTW"),
//                                   const MapEntry("LOL(<)", "LOL(<)"),
//                                   const MapEntry("HIM(>)", "HIM(>)"),
//                                   const MapEntry("Actual", "Actual"),
//                                 ],
//                                 onChangeinside: (d, k) {
//                                   setState(() {
//                                     INSPECTIONstdVAR
//                                         .FINAL_SPECIFICATIONveOB.condition = d;
//                                   });
//                                 },
//                                 value: INSPECTIONstdVAR
//                                     .FINAL_SPECIFICATIONveOB.condition,
//                                 height: 40,
//                                 width: 200,
//                               ),
//                             ),
//                             if (INSPECTIONstdVAR
//                                     .FINAL_SPECIFICATIONveOB.condition ==
//                                 'BTW') ...[
//                               ComInputText(
//                                 nLimitedChar: 100,
//                                 sLabel: "BTW_HI",
//                                 height: 40,
//                                 width: 200,
//                                 isContr: INSPECTIONstdVAR.iscontrol,
//                                 // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
//                                 fnContr: (input) {
//                                   setState(() {
//                                     INSPECTIONstdVAR.iscontrol = input;
//                                   });
//                                 },
//                                 sValue: INSPECTIONstdVAR
//                                     .FINAL_SPECIFICATIONveOB.BTW_HI,
//                                 returnfunc: (String s) {
//                                   INSPECTIONstdVAR
//                                       .FINAL_SPECIFICATIONveOB.BTW_HI = s;
//                                 },
//                               ),
//                               ComInputText(
//                                 nLimitedChar: 100,
//                                 sLabel: "BTW_LOW",
//                                 height: 40,
//                                 width: 200,
//                                 isContr: INSPECTIONstdVAR.iscontrol,
//                                 // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
//                                 fnContr: (input) {
//                                   setState(() {
//                                     INSPECTIONstdVAR.iscontrol = input;
//                                   });
//                                 },
//                                 sValue: INSPECTIONstdVAR
//                                     .FINAL_SPECIFICATIONveOB.BTW_LOW,
//                                 returnfunc: (String s) {
//                                   INSPECTIONstdVAR
//                                       .FINAL_SPECIFICATIONveOB.BTW_LOW = s;
//                                 },
//                               ),
//                             ],
//                             if (INSPECTIONstdVAR
//                                     .FINAL_SPECIFICATIONveOB.condition ==
//                                 'HIM(>)') ...[
//                               ComInputText(
//                                 nLimitedChar: 100,
//                                 sLabel: "HIM_L",
//                                 height: 40,
//                                 width: 200,
//                                 isContr: INSPECTIONstdVAR.iscontrol,
//                                 // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
//                                 fnContr: (input) {
//                                   setState(() {
//                                     INSPECTIONstdVAR.iscontrol = input;
//                                   });
//                                 },
//                                 sValue: INSPECTIONstdVAR
//                                     .FINAL_SPECIFICATIONveOB.HIM_L,
//                                 returnfunc: (String s) {
//                                   INSPECTIONstdVAR
//                                       .FINAL_SPECIFICATIONveOB.HIM_L = s;
//                                 },
//                               ),
//                             ],
//                             if (INSPECTIONstdVAR
//                                     .FINAL_SPECIFICATIONveOB.condition ==
//                                 'LOL(<)') ...[
//                               ComInputText(
//                                 nLimitedChar: 100,
//                                 sLabel: "LOL_H",
//                                 height: 40,
//                                 width: 200,
//                                 isContr: INSPECTIONstdVAR.iscontrol,
//                                 // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
//                                 fnContr: (input) {
//                                   setState(() {
//                                     INSPECTIONstdVAR.iscontrol = input;
//                                   });
//                                 },
//                                 sValue: INSPECTIONstdVAR
//                                     .FINAL_SPECIFICATIONveOB.LOL_H,
//                                 returnfunc: (String s) {
//                                   INSPECTIONstdVAR
//                                       .FINAL_SPECIFICATIONveOB.LOL_H = s;
//                                 },
//                               ),
//                             ],
//                             if (INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.condition == 'HIM(>)' ||
//                                 INSPECTIONstdVAR
//                                         .FINAL_SPECIFICATIONveOB.condition ==
//                                     'LOL(<)' ||
//                                 INSPECTIONstdVAR
//                                         .FINAL_SPECIFICATIONveOB.condition ==
//                                     'BTW') ...[
//                               ComInputText(
//                                 nLimitedChar: 100,
//                                 sLabel: "TARGET",
//                                 height: 40,
//                                 width: 200,
//                                 isContr: INSPECTIONstdVAR.iscontrol,
//                                 // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
//                                 fnContr: (input) {
//                                   setState(() {
//                                     INSPECTIONstdVAR.iscontrol = input;
//                                   });
//                                 },
//                                 sValue: INSPECTIONstdVAR
//                                     .FINAL_SPECIFICATIONveOB.TARGET,
//                                 returnfunc: (String s) {
//                                   INSPECTIONstdVAR
//                                       .FINAL_SPECIFICATIONveOB.TARGET = s;
//                                 },
//                               ),
//                             ],
//                           ],
//                         ),
//                       ),
//                     ),
//                   SizedBox(
//                     height: 64,
//                     width: 400,
//                     child: AdvanceDropDown(
//                       sLabel: "UNIT",
//                       imgpath: 'assets/icons/icon-down_4@3x.png',
//                       listdropdown: INSPECTIONstdVAR.List_FINAL_UNIT,
//                       onChangeinside: (d, k) {
//                         setState(() {
//                           INSPECTIONstdVAR.FINAL_UNIT = d;
//                         });
//                       },
//                       value: INSPECTIONstdVAR.FINAL_UNIT,
//                       height: 40,
//                       width: 400,
//                     ),
//                   ),
//                   ComInputText(
//                     nLimitedChar: 100,
//                     sLabel: "POINT",
//                     height: 40,
//                     width: 400,
//                     isContr: INSPECTIONstdVAR.iscontrol,
//                     // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
//                     fnContr: (input) {
//                       setState(() {
//                         INSPECTIONstdVAR.iscontrol = input;
//                       });
//                     },
//                     sValue: INSPECTIONstdVAR.FINAL_POINTPCS,
//                     returnfunc: (String s) {
//                       INSPECTIONstdVAR.FINAL_POINTPCS = s;
//                     },
//                   ),
//                   ComInputText(
//                     nLimitedChar: 100,
//                     sLabel: "PCS",
//                     height: 40,
//                     width: 400,
//                     isContr: INSPECTIONstdVAR.iscontrol,
//                     // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
//                     fnContr: (input) {
//                       setState(() {
//                         INSPECTIONstdVAR.iscontrol = input;
//                       });
//                     },
//                     sValue: INSPECTIONstdVAR.FINAL_PCS,
//                     returnfunc: (String s) {
//                       INSPECTIONstdVAR.FINAL_PCS = s;
//                     },
//                   ),
//                   SizedBox(
//                     height: 64,
//                     width: 400,
//                     child: AdvanceDropDown(
//                       sLabel: "FREQUENCY",
//                       imgpath: 'assets/icons/icon-down_4@3x.png',
//                       listdropdown: INSPECTIONstdVAR.List_FINAL_FREQUENCY,
//                       onChangeinside: (d, k) {
//                         setState(() {
//                           INSPECTIONstdVAR.FINAL_FREQUENCY = d;
//                         });
//                       },
//                       value: INSPECTIONstdVAR.FINAL_FREQUENCY,
//                       height: 40,
//                       width: 400,
//                     ),
//                   ),
//                   ComInputText(
//                     nLimitedChar: 100,
//                     sLabel: "REMARK",
//                     height: 40,
//                     width: 400,
//                     isContr: INSPECTIONstdVAR.iscontrol,
//                     // isEnabled: INSPECTIONstdVAR.ACTION_isEnabled,
//                     fnContr: (input) {
//                       setState(() {
//                         INSPECTIONstdVAR.iscontrol = input;
//                       });
//                     },
//                     sValue: INSPECTIONstdVAR.FINAL_REMARK,
//                     returnfunc: (String s) {
//                       INSPECTIONstdVAR.FINAL_REMARK = s;
//                     },
//                   ),

//                   const SizedBox(
//                     height: 15,
//                   ),
//                   InkWell(
//                     onTap: () {},
//                     child: Container(
//                       height: 40,
//                       width: 200,
//                       color: Colors.blue,
//                       child: const Center(
//                           child: Text(
//                         "SAVE",
//                         style: TextStyle(color: Colors.white),
//                       )),
//                     ),
//                   ),
//                 ],
//                 const SizedBox(
//                   height: 24,
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
